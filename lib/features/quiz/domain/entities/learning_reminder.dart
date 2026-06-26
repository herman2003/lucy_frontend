import 'quiz_attempt.dart';

/// In-app learning reminder kinds (LEARN-12a).
enum LearningReminderKind {
  flashcardsDue,
  weakQuiz,
}

/// One actionable reminder for local notifications and label building.
class LearningReminder {
  const LearningReminder({
    required this.kind,
    required this.sessionId,
    required this.sessionTitle,
    this.dueFlashcardCount,
    this.incorrectAnswerCount,
    this.lastAttempt,
  });

  final LearningReminderKind kind;
  final String sessionId;
  final String sessionTitle;
  final int? dueFlashcardCount;
  final int? incorrectAnswerCount;
  final QuizAttempt? lastAttempt;
}
