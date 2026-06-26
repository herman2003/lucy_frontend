import '../domain/entities/learning_reminder.dart';
import '../domain/entities/learning_session_list_item.dart';
import '../domain/entities/learning_session_type.dart';
import '../domain/entities/quiz_attempt.dart';
import '../services/flashcard_sm2_service.dart';
import '../services/quiz_attempt_service.dart';
import '../utils/learning_reminder_flashcard_counter.dart';

/// Aggregates SM-2 due cards and weak quiz attempts for in-app reminders.
class LearningReminderService {
  LearningReminderService({
    required FlashcardSm2Service flashcardSm2Service,
    required QuizAttemptService quizAttemptService,
  }) : _flashcardSm2Service = flashcardSm2Service,
       _quizAttemptService = quizAttemptService;

  final FlashcardSm2Service _flashcardSm2Service;
  final QuizAttemptService _quizAttemptService;

  Future<LearningReminder?> pickPrimaryReminder({
    required List<LearningSessionListItem> sessions,
    required DateTime now,
  }) async {
    final flashcardsReminder = await _pickFlashcardsReminder(
      sessions: sessions,
      now: now,
    );
    if (flashcardsReminder != null) {
      return flashcardsReminder;
    }

    return _pickWeakQuizReminder(sessions: sessions);
  }

  Future<LearningReminder?> _pickFlashcardsReminder({
    required List<LearningSessionListItem> sessions,
    required DateTime now,
  }) async {
    var totalDue = 0;
    String? topSessionId;
    String? topSessionTitle;
    var topSessionDue = 0;

    for (final session in sessions) {
      if (session.type != LearningSessionType.flashcards) {
        continue;
      }

      final states = await _flashcardSm2Service.loadStates(session.id);
      final dueCount = countDueFlashcardsForSession(
        itemCount: session.itemCount,
        statesByItemId: states,
        now: now,
      );
      if (dueCount <= 0) {
        continue;
      }

      totalDue += dueCount;
      if (dueCount > topSessionDue) {
        topSessionDue = dueCount;
        topSessionId = session.id;
        topSessionTitle = session.title;
      }
    }

    if (totalDue <= 0 || topSessionId == null || topSessionTitle == null) {
      return null;
    }

    return LearningReminder(
      kind: LearningReminderKind.flashcardsDue,
      sessionId: topSessionId,
      sessionTitle: topSessionTitle,
      dueFlashcardCount: totalDue,
    );
  }

  Future<LearningReminder?> _pickWeakQuizReminder({
    required List<LearningSessionListItem> sessions,
  }) async {
    final quizSessionIds = [
      for (final session in sessions)
        if (session.type == LearningSessionType.quiz) session.id,
    ];
    if (quizSessionIds.isEmpty) {
      return null;
    }

    final lastAttempts = await _quizAttemptService.readLastAttempts(
      quizSessionIds,
    );
    QuizAttempt? weakestAttempt;
    LearningSessionListItem? weakestSession;

    for (final session in sessions) {
      if (session.type != LearningSessionType.quiz) {
        continue;
      }
      final attempt = lastAttempts[session.id];
      if (attempt == null || attempt.scoreCorrect >= attempt.scoreTotal) {
        continue;
      }

      if (weakestAttempt == null ||
          attempt.completedAt.isAfter(weakestAttempt.completedAt)) {
        weakestAttempt = attempt;
        weakestSession = session;
      }
    }

    if (weakestAttempt == null || weakestSession == null) {
      return null;
    }

    return LearningReminder(
      kind: LearningReminderKind.weakQuiz,
      sessionId: weakestSession.id,
      sessionTitle: weakestSession.title,
      incorrectAnswerCount:
          weakestAttempt.scoreTotal - weakestAttempt.scoreCorrect,
      lastAttempt: weakestAttempt,
    );
  }
}
