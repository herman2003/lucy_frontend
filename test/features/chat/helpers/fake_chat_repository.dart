import 'package:frontend/features/chat/domain/entities/chat_eligibility.dart';
import 'package:frontend/features/chat/domain/entities/chat_message.dart';
import 'package:frontend/features/chat/domain/entities/chat_message_role.dart';
import 'package:frontend/features/chat/domain/entities/chat_message_status.dart';
import 'package:frontend/features/chat/domain/entities/chat_source.dart';
import 'package:frontend/features/chat/domain/entities/chat_stream_event.dart';
import 'package:frontend/features/chat/domain/entities/chat_thread.dart';
import 'package:frontend/features/chat/domain/repositories/chat_repository.dart';

/// In-memory [ChatRepository] for unit tests.
class FakeChatRepository implements ChatRepository {
  FakeChatRepository({
    List<ChatThread>? initialThreads,
    Map<String, List<ChatMessage>>? initialMessagesByChatId,
    ChatEligibility eligibility = const ChatEligibility(
      canChat: true,
      activeDocumentCount: 1,
    ),
  }) : _threads = List<ChatThread>.from(initialThreads ?? const []),
       _messagesByChatId = Map<String, List<ChatMessage>>.from(
         initialMessagesByChatId ?? const {},
       ),
       _eligibility = eligibility;

  final List<ChatThread> _threads;
  final Map<String, List<ChatMessage>> _messagesByChatId;
  ChatEligibility _eligibility;

  @override
  Future<List<ChatThread>> listThreads() async =>
      List<ChatThread>.unmodifiable(_threads);

  @override
  Future<ChatThread> createThread({String? title}) async {
    final now = DateTime.now().toUtc().toIso8601String();
    final thread = ChatThread(
      id: 'chat-${_threads.length + 1}',
      title: title ?? 'New conversation',
      createdAt: now,
      updatedAt: now,
    );
    _threads.add(thread);
    _messagesByChatId.putIfAbsent(thread.id, () => []);
    return thread;
  }

  @override
  Future<List<ChatMessage>> listMessages(
    String chatId, {
    int limit = 100,
    String? beforeMessageId,
  }) async {
    final messages = List<ChatMessage>.from(
      _messagesByChatId[chatId] ?? const [],
    );
    if (beforeMessageId != null) {
      final index = messages.indexWhere((m) => m.id == beforeMessageId);
      if (index <= 0) {
        return [];
      }
      return messages.sublist(0, index).take(limit).toList();
    }
    if (messages.length <= limit) {
      return messages;
    }
    return messages.sublist(messages.length - limit);
  }

  @override
  Future<ChatEligibility> getEligibility() async => _eligibility;

  void setEligibility(ChatEligibility eligibility) {
    _eligibility = eligibility;
  }

  @override
  Future<void> deleteThread(String chatId) async {
    _threads.removeWhere((thread) => thread.id == chatId);
    _messagesByChatId.remove(chatId);
  }

  void seedMessage(ChatMessage message, {required String chatId}) {
    final list = _messagesByChatId.putIfAbsent(chatId, () => []);
    list.add(message);
  }

  @override
  Stream<ChatStreamEvent> streamMessage(String chatId, String content) async* {
    final now = DateTime.now().toUtc().toIso8601String();
    final userId = 'user-msg-${_messagesByChatId[chatId]?.length ?? 0}';
    final userMessage = ChatMessage(
      id: userId,
      role: ChatMessageRole.user,
      content: content,
      createdAt: now,
    );
    yield ChatStreamUserMessageEvent(userMessage);

    const deltas = ['Bonjour', ' ', 'Lucy'];
    for (final delta in deltas) {
      yield ChatStreamTextDeltaEvent(delta);
    }

    const sources = [
      ChatSource(
        documentId: 'doc-1',
        title: 'Cours PDF',
        chunkId: 'chunk-1',
        excerpt: 'Extrait de test.',
        pageStart: 2,
        pageEnd: 5,
      ),
    ];
    yield const ChatStreamSourcesEvent(sources);

    final assistant = fakeAssistantMessage(
      id: 'assistant-$userId',
      content: 'Bonjour Lucy',
      sources: sources,
    );
    yield ChatStreamDoneEvent(
      userMessageId: userId,
      assistantMessage: assistant,
    );

    final list = _messagesByChatId.putIfAbsent(chatId, () => []);
    list.add(userMessage);
    list.add(assistant);
  }
}

ChatMessage fakeAssistantMessage({
  required String id,
  required String content,
  List<ChatSource> sources = const [],
}) {
  return ChatMessage(
    id: id,
    role: ChatMessageRole.assistant,
    content: content,
    createdAt: DateTime.now().toUtc().toIso8601String(),
    status: ChatMessageStatus.completed,
    sources: sources,
  );
}
