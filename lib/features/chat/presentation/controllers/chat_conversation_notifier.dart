import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/providers/auth_provider.dart';
import '../../data/utils/chat_sse_parser.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../../domain/exceptions/chat_exception.dart';
import '../../domain/providers/chat_mirror_provider.dart';
import '../../services/chat_mirror_service.dart';
import '../../domain/providers/chat_provider.dart';
import '../../utils/chat_mirror_constants.dart';
import '../../utils/chat_network_utils.dart';
import 'chat_send_phase.dart';
import 'chat_threads_notifier.dart';
import 'chat_conversation_state.dart';

part 'chat_conversation_notifier.g.dart';

@riverpod
class ChatConversationNotifier extends _$ChatConversationNotifier {
  Timer? _mirrorDebounce;
  late final ChatMirrorService _mirrorService;
  String? _uid;
  List<ChatMessage> _mirrorMessages = const [];
  String _mirrorStreamingContent = '';
  ChatSendPhase _mirrorSendPhase = ChatSendPhase.idle;

  @override
  ChatConversationState build(String chatId) {
    _mirrorService = ref.read(chatMirrorServiceProvider);
    _uid = ref.read(authRepositoryProvider).currentUser?.uid;
    ref.onDispose(() {
      _mirrorDebounce?.cancel();
      final uid = _uid;
      if (uid == null) {
        return;
      }
      unawaited(
        _mirrorService.replaceMessagesForChat(
          uid: uid,
          chatId: chatId,
          messages: _mirrorMessages,
          streamDraft:
              _mirrorSendPhase == ChatSendPhase.sending ||
                  _mirrorSendPhase == ChatSendPhase.streaming
              ? _mirrorStreamingContent
              : null,
        ),
      );
    });
    Future.microtask(() {
      if (!ref.mounted) {
        return;
      }
      unawaited(loadMessages());
    });
    return const ChatConversationState();
  }

  void _captureMirrorSnapshot() {
    _mirrorMessages = state.messages;
    _mirrorStreamingContent = state.streamingContent;
    _mirrorSendPhase = state.sendPhase;
  }

  Future<void> loadMessages() async {
    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    if (uid == null) {
      return;
    }

    final mirrorService = ref.read(chatMirrorServiceProvider);
    final mirror = await mirrorService.load(uid);
    final cached = mirror == null
        ? null
        : mirrorService.messagesForChat(mirror, chatId);
    if (cached != null && cached.isNotEmpty) {
      state = state.copyWith(messages: cached, isLoadingMessages: false);
      _captureMirrorSnapshot();
    } else {
      state = state.copyWith(isLoadingMessages: true, errorCode: null);
    }

    if (ref.read(chatThreadsProvider).isOffline) {
      return;
    }

    if (state.isStreaming) {
      return;
    }

    try {
      final messages = await ref.read(chatServiceProvider).listMessages(chatId);
      state = state.copyWith(isLoadingMessages: false, messages: messages);
      _captureMirrorSnapshot();
      await mirrorService.replaceMessagesForChat(
        uid: uid,
        chatId: chatId,
        messages: messages,
        base: mirror,
      );
    } catch (error) {
      if (ChatNetworkUtils.isOfflineError(error) && cached != null) {
        state = state.copyWith(isLoadingMessages: false, errorCode: null);
        Future.microtask(() {
          if (!ref.mounted) {
            return;
          }
          ref.read(chatThreadsProvider.notifier).setOffline(true);
        });
        return;
      }
      state = state.copyWith(
        isLoadingMessages: false,
        errorCode: _errorCode(error),
      );
    }
  }

  Future<void> sendMessage(String content) async {
    if (ref.read(chatThreadsProvider).isOffline) {
      return;
    }

    final trimmed = content.trim();
    if (trimmed.isEmpty || !state.canSend) {
      return;
    }

    state = state.copyWith(
      sendPhase: ChatSendPhase.sending,
      streamingContent: '',
      pendingSources: const [],
      errorCode: null,
    );
    _captureMirrorSnapshot();

    try {
      await for (final event
          in ref.read(chatServiceProvider).streamMessage(chatId, trimmed)) {
        _applyStreamEvent(event);
      }
      await _persistMirror();
    } catch (error) {
      state = state.copyWith(
        sendPhase: ChatSendPhase.error,
        errorCode: _errorCode(error),
      );
      _captureMirrorSnapshot();
      await _persistMirror();
    }
  }

  void _applyStreamEvent(ChatStreamEvent event) {
    switch (event) {
      case ChatStreamUserMessageEvent(:final message):
        state = state.copyWith(
          messages: [...state.messages, message],
          sendPhase: ChatSendPhase.streaming,
        );
        unawaited(_persistMirror());
      case ChatStreamTextDeltaEvent(:final delta):
        state = state.copyWith(
          streamingContent: aggregateChatStreamDeltas([
            state.streamingContent,
            delta,
          ]),
          sendPhase: ChatSendPhase.streaming,
        );
        _scheduleMirrorPersist();
      case ChatStreamSourcesEvent(:final sources):
        state = state.copyWith(pendingSources: sources);
        unawaited(_persistMirror());
      case ChatStreamLearningSessionCreatedEvent(:final session):
        state = state.copyWith(pendingLearningSession: session);
        unawaited(_persistMirror());
      case ChatStreamDoneEvent(:final assistantMessage):
        final cards = state.pendingLearningSession != null
            ? [...state.learningSessionCards, state.pendingLearningSession!]
            : state.learningSessionCards;
        state = state.copyWith(
          messages: [...state.messages, assistantMessage],
          sendPhase: ChatSendPhase.completed,
          streamingContent: '',
          pendingSources: const [],
          learningSessionCards: cards,
          pendingLearningSession: null,
        );
        state = state.copyWith(sendPhase: ChatSendPhase.idle);
        unawaited(_persistMirror());
      case ChatStreamErrorEvent(:final code):
        state = state.copyWith(
          sendPhase: ChatSendPhase.error,
          errorCode: code,
          streamingContent: '',
          pendingSources: const [],
          pendingLearningSession: null,
        );
        _captureMirrorSnapshot();
        unawaited(_persistMirror());
    }
    _captureMirrorSnapshot();
  }

  void _scheduleMirrorPersist() {
    _mirrorDebounce?.cancel();
    _mirrorDebounce = Timer(ChatMirrorConstants.persistDebounce, () {
      unawaited(_persistMirror());
    });
  }

  Future<void> _persistMirror() async {
    final uid = _uid ?? ref.read(authRepositoryProvider).currentUser?.uid;
    if (uid == null) {
      return;
    }
    await _persistMirrorForUid(uid);
  }

  Future<void> _persistMirrorForUid(String uid) async {
    _captureMirrorSnapshot();
    await _mirrorService.replaceMessagesForChat(
      uid: uid,
      chatId: chatId,
      messages: _mirrorMessages,
      streamDraft:
          _mirrorSendPhase == ChatSendPhase.sending ||
              _mirrorSendPhase == ChatSendPhase.streaming
          ? _mirrorStreamingContent
          : null,
    );
  }

  String _errorCode(Object error) {
    if (error is ChatException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
