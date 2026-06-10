import '../entities/chat_eligibility.dart';
import '../entities/chat_message.dart';
import '../entities/chat_stream_event.dart';
import '../entities/chat_thread.dart';

abstract class ChatRepository {
  Future<List<ChatThread>> listThreads();

  Future<ChatThread> createThread({String? title});

  Future<List<ChatMessage>> listMessages(
    String chatId, {
    int limit = 100,
    String? beforeMessageId,
  });

  Future<ChatEligibility> getEligibility();

  Future<void> deleteThread(String chatId);

  Stream<ChatStreamEvent> streamMessage(String chatId, String content);
}
