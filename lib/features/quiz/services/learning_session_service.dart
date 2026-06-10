import '../domain/entities/generate_learning_session_request.dart';
import '../domain/entities/learning_session.dart';
import '../domain/entities/learning_session_list_item.dart';
import '../domain/repositories/learning_session_repository.dart';

class LearningSessionService {
  LearningSessionService({required LearningSessionRepository repository})
      : _repository = repository;

  final LearningSessionRepository _repository;

  Future<LearningSession> generate(GenerateLearningSessionRequest request) =>
      _repository.generate(request);

  Future<LearningSession> getById(String sessionId) =>
      _repository.getById(sessionId);

  Future<List<LearningSessionListItem>> list() => _repository.list();

  Future<void> delete(String sessionId) => _repository.delete(sessionId);
}
