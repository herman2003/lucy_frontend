import '../../domain/entities/generate_learning_session_request.dart';
import '../../domain/entities/learning_session.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/repositories/learning_session_repository.dart';
import '../datasources/learning_session_api_remote_data_source.dart';
import '../mappers/learning_session_mapper.dart';

class LearningSessionRepositoryImpl implements LearningSessionRepository {
  LearningSessionRepositoryImpl(this._remote);

  final LearningSessionApiRemoteDataSource _remote;

  @override
  Future<LearningSession> generate(
    GenerateLearningSessionRequest request,
  ) async {
    final model = await _remote.generate(request);
    return LearningSessionMapper.fromModel(model);
  }

  @override
  Future<LearningSession> getById(String sessionId) async {
    final model = await _remote.getById(sessionId);
    return LearningSessionMapper.fromModel(model);
  }

  @override
  Future<List<LearningSessionListItem>> list() async {
    final models = await _remote.list();
    return models.map(LearningSessionMapper.listItemFromModel).toList(growable: false);
  }

  @override
  Future<void> delete(String sessionId) => _remote.delete(sessionId);
}
