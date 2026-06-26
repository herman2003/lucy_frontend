import '../data/datasources/quiz_attempt_api_remote_data_source.dart';
import '../domain/entities/quiz_attempt.dart';

/// Pushes locally stored quiz attempts to the backend (LEARN-12b-V2).
class QuizAttemptSyncService {
  QuizAttemptSyncService({required QuizAttemptRemotePort remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final QuizAttemptRemotePort _remoteDataSource;

  Future<void> pushAttempt(QuizAttempt attempt) {
    return _remoteDataSource.createAttempt(
      sessionId: attempt.sessionId,
      attempt: attempt,
    );
  }

  Future<List<QuizAttempt>> fetchAttempts(String sessionId) {
    return _remoteDataSource.listAttempts(sessionId);
  }
}
