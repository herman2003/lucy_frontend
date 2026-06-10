import '../entities/generate_learning_session_request.dart';
import '../entities/learning_session.dart';
import '../entities/learning_session_list_item.dart';

abstract class LearningSessionRepository {
  Future<LearningSession> generate(GenerateLearningSessionRequest request);

  Future<LearningSession> getById(String sessionId);

  Future<List<LearningSessionListItem>> list();
}
