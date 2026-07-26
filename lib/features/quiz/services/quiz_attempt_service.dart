import '../data/datasources/quiz_attempt_prefs_data_source.dart';
import '../domain/entities/learning_session.dart';
import '../domain/entities/quiz_attempt.dart';

/// Records and reads local quiz attempt history (LEARN-12b).
class QuizAttemptService {
  QuizAttemptService({required QuizAttemptPrefsDataSource dataSource})
    : _dataSource = dataSource;

  final QuizAttemptPrefsDataSource _dataSource;

  Future<QuizAttempt?> recordCompletedAttempt({
    required LearningSession session,
    required Map<String, int> selectedAnswers,
    required DateTime startedAt,
    required DateTime completedAt,
  }) async {
    if (session.items.isEmpty ||
        selectedAnswers.length != session.items.length) {
      return null;
    }

    final attempt = buildAttempt(
      session: session,
      selectedAnswers: selectedAnswers,
      startedAt: startedAt,
      completedAt: completedAt,
    );
    final existing = await _dataSource.readAttempts(session.id);
    await _dataSource.writeAttempts(session.id, [...existing, attempt]);
    return attempt;
  }

  Future<QuizAttempt?> readLastAttempt(String sessionId) async {
    final attempts = await _dataSource.readAttempts(sessionId);
    if (attempts.isEmpty) {
      return null;
    }
    return attempts.last;
  }

  Future<Map<String, QuizAttempt>> readLastAttempts(
    List<String> sessionIds,
  ) async {
    final result = <String, QuizAttempt>{};
    for (final sessionId in sessionIds) {
      final last = await readLastAttempt(sessionId);
      if (last != null) {
        result[sessionId] = last;
      }
    }
    return result;
  }

  Future<void> deleteAttempts(String sessionId) {
    return _dataSource.deleteAttempts(sessionId);
  }
}

QuizAttempt buildAttempt({
  required LearningSession session,
  required Map<String, int> selectedAnswers,
  required DateTime startedAt,
  required DateTime completedAt,
}) {
  final answers = [
    for (final item in session.items)
      if (item.correctIndex != null)
        QuizAttemptAnswer(
          itemId: item.id,
          selectedIndex: selectedAnswers[item.id]!,
          correctIndex: item.correctIndex!,
          isCorrect: selectedAnswers[item.id] == item.correctIndex,
        ),
  ];
  final scoreCorrect = answers.where((answer) => answer.isCorrect).length;

  return QuizAttempt(
    id: 'attempt_${completedAt.toUtc().millisecondsSinceEpoch}',
    sessionId: session.id,
    startedAt: startedAt,
    completedAt: completedAt,
    scoreCorrect: scoreCorrect,
    scoreTotal: session.items.length,
    answers: answers,
  );
}
