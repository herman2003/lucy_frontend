import '../../domain/entities/chat_eligibility.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_thread.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../datasources/chat_api_remote_data_source.dart';
import '../datasources/chat_stream_remote_data_source.dart';
import '../mappers/chat_mapper.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._remote, this._streamRemote);

  final ChatApiRemoteDataSource _remote;
  final ChatStreamRemoteDataSource _streamRemote;

  @override
  Future<List<ChatThread>> listThreads() async {
    final models = await _remote.listThreads();
    return models.map(ChatMapper.threadFromModel).toList();
  }

  @override
  Future<ChatThread> createThread({String? title}) async {
    final model = await _remote.createThread(title: title);
    return ChatMapper.threadFromModel(model);
  }

  @override
  Future<List<ChatMessage>> listMessages(
    String chatId, {
    int limit = 100,
    String? beforeMessageId,
  }) async {
    final models = await _remote.listMessages(
      chatId,
      limit: limit,
      beforeMessageId: beforeMessageId,
    );
    return models.map(ChatMapper.messageFromModel).toList();
  }

  @override
  Future<ChatEligibility> getEligibility() async {
    final model = await _remote.getEligibility();
    return ChatMapper.eligibilityFromModel(model);
  }

  @override
  Future<void> deleteThread(String chatId) => _remote.deleteThread(chatId);

  @override
  Stream<ChatStreamEvent> streamMessage(String chatId, String content) =>
      _streamRemote.streamMessage(chatId, content);
}
