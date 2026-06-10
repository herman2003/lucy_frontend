import '../domain/entities/chat_local_mirror.dart';
import '../domain/entities/chat_message.dart';
import '../domain/entities/chat_thread.dart';
import '../domain/repositories/chat_local_mirror_repository.dart';
import '../utils/chat_mirror_constants.dart';

/// Read/write chat mirror with truncation rules (spec §3.4, §12.7).
class ChatMirrorService {
  ChatMirrorService({required ChatLocalMirrorRepository repository})
    : _repository = repository;

  final ChatLocalMirrorRepository _repository;

  Future<ChatLocalMirror?> load(String uid) => _repository.load(uid: uid);

  Future<void> removeMirror(String uid) => _repository.remove(uid: uid);

  Future<void> saveThreads({
    required String uid,
    required List<ChatThread> threads,
    String? lastActiveChatId,
    ChatLocalMirror? base,
  }) async {
    final current = base ?? await _repository.load(uid: uid);
    final mirror = (current ?? const ChatLocalMirror()).copyWith(
      threads: threads,
      lastActiveChatId: lastActiveChatId ?? current?.lastActiveChatId,
      syncedAt: DateTime.now().toUtc().toIso8601String(),
    );
    await _repository.save(uid: uid, mirror: mirror);
  }

  Future<void> replaceMessagesForChat({
    required String uid,
    required String chatId,
    required List<ChatMessage> messages,
    ChatLocalMirror? base,
    String? streamDraft,
  }) async {
    final current = base ?? await _repository.load(uid: uid);
    final truncated = _truncate(messages);
    final streamDrafts = Map<String, String>.from(
      current?.streamDraftByChatId ?? const {},
    );
    if (streamDraft == null || streamDraft.isEmpty) {
      streamDrafts.remove(chatId);
    } else {
      streamDrafts[chatId] = streamDraft;
    }

    final messagesByChatId = Map<String, List<ChatMessage>>.from(
      current?.messagesByChatId ?? const {},
    );
    messagesByChatId[chatId] = truncated;

    final mirror = (current ?? const ChatLocalMirror()).copyWith(
      messagesByChatId: messagesByChatId,
      streamDraftByChatId: streamDrafts,
      syncedAt: DateTime.now().toUtc().toIso8601String(),
    );
    await _repository.save(uid: uid, mirror: mirror);
  }

  List<ChatMessage>? messagesForChat(ChatLocalMirror mirror, String chatId) {
    return mirror.messagesByChatId[chatId];
  }

  static List<ChatMessage> _truncate(List<ChatMessage> messages) {
    if (messages.length <= ChatMirrorConstants.maxMessagesPerThread) {
      return messages;
    }
    return messages.sublist(
      messages.length - ChatMirrorConstants.maxMessagesPerThread,
    );
  }
}
