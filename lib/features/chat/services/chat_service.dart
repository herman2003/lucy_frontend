import '../domain/entities/chat_eligibility.dart';
import '../domain/entities/chat_message.dart';
import '../domain/entities/chat_stream_event.dart';
import '../domain/entities/chat_thread.dart';
import '../domain/repositories/chat_repository.dart';

/// Chat threads and messages orchestration (UI → notifier → service → repository).
class ChatService {
  ChatService({required ChatRepository repository}) : _repository = repository;

  final ChatRepository _repository;

  Future<List<ChatThread>> listThreads() => _repository.listThreads();

  Future<ChatThread> createThread({String? title}) =>
      _repository.createThread(title: title);

  Future<List<ChatMessage>> listMessages(
    String chatId, {
    int limit = 100,
    String? beforeMessageId,
  }) => _repository.listMessages(
    chatId,
    limit: limit,
    beforeMessageId: beforeMessageId,
  );

  Future<ChatEligibility> getEligibility() => _repository.getEligibility();

  Future<void> deleteThread(String chatId) => _repository.deleteThread(chatId);

  Stream<ChatStreamEvent> streamMessage(String chatId, String content) =>
      _repository.streamMessage(chatId, content);
}
