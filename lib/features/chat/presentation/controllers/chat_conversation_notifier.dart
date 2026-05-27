import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/utils/chat_sse_parser.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../../domain/exceptions/chat_exception.dart';
import '../../domain/providers/chat_provider.dart';
import 'chat_conversation_state.dart';
import 'chat_send_phase.dart';

part 'chat_conversation_notifier.g.dart';

@riverpod
class ChatConversationNotifier extends _$ChatConversationNotifier {
  @override
  ChatConversationState build(String chatId) => const ChatConversationState();

  Future<void> loadMessages() async {
    state = state.copyWith(isLoadingMessages: true, errorCode: null);
    try {
      final messages = await ref
          .read(chatServiceProvider)
          .listMessages(chatId);
      state = state.copyWith(isLoadingMessages: false, messages: messages);
    } catch (error) {
      state = state.copyWith(
        isLoadingMessages: false,
        errorCode: _errorCode(error),
      );
    }
  }

  Future<void> sendMessage(String content) async {
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

    try {
      await for (final event in ref
          .read(chatServiceProvider)
          .streamMessage(chatId, trimmed)) {
        _applyStreamEvent(event);
      }
    } catch (error) {
      state = state.copyWith(
        sendPhase: ChatSendPhase.error,
        errorCode: _errorCode(error),
      );
    }
  }

  void _applyStreamEvent(ChatStreamEvent event) {
    switch (event) {
      case ChatStreamUserMessageEvent(:final message):
        state = state.copyWith(
          messages: [...state.messages, message],
          sendPhase: ChatSendPhase.streaming,
        );
      case ChatStreamTextDeltaEvent(:final delta):
        state = state.copyWith(
          streamingContent: aggregateChatStreamDeltas([
            state.streamingContent,
            delta,
          ]),
          sendPhase: ChatSendPhase.streaming,
        );
      case ChatStreamSourcesEvent(:final sources):
        state = state.copyWith(pendingSources: sources);
      case ChatStreamDoneEvent(:final assistantMessage):
        state = state.copyWith(
          messages: [...state.messages, assistantMessage],
          sendPhase: ChatSendPhase.completed,
          streamingContent: '',
          pendingSources: const [],
        );
        state = state.copyWith(sendPhase: ChatSendPhase.idle);
      case ChatStreamErrorEvent(:final code):
        state = state.copyWith(
          sendPhase: ChatSendPhase.error,
          errorCode: code,
          streamingContent: '',
          pendingSources: const [],
        );
    }
  }

  String _errorCode(Object error) {
    if (error is ChatException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
