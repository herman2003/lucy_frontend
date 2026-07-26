import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_api_remote_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/quiz_attempt.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_sync_service.dart';

class _FakeQuizAttemptRemotePort implements QuizAttemptRemotePort {
  QuizAttempt? lastAttempt;

  @override
  Future<void> createAttempt({
    required String sessionId,
    required QuizAttempt attempt,
  }) async {
    lastAttempt = attempt;
  }

  @override
  Future<List<QuizAttempt>> listAttempts(String sessionId) async => const [];
}

void main() {
  test('pushAttempt forwards attempt to remote port', () async {
    final remote = _FakeQuizAttemptRemotePort();
    final service = QuizAttemptSyncService(remoteDataSource: remote);
    final attempt = QuizAttempt(
      id: 'attempt_1',
      sessionId: 'learn_quiz_1',
      startedAt: DateTime.utc(2026, 6, 10, 8),
      completedAt: DateTime.utc(2026, 6, 10, 8, 10),
      scoreCorrect: 3,
      scoreTotal: 5,
      answers: const [],
    );

    await service.pushAttempt(attempt);

    expect(remote.lastAttempt, attempt);
  });
}
