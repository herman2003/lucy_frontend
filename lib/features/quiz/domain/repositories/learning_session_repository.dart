import '../entities/generate_learning_session_request.dart';
import '../entities/learning_session.dart';

abstract class LearningSessionRepository {
  Future<LearningSession> generate(GenerateLearningSessionRequest request);

  Future<LearningSession> getById(String sessionId);
}
