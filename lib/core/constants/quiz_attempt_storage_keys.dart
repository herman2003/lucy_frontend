/// SharedPreferences keys for quiz attempt history (LEARN-12b).
abstract final class QuizAttemptStorageKeys {
  static String sessionAttempts(String sessionId) =>
      'lucy_quiz_attempts_v1_$sessionId';
}
