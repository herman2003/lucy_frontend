import '../../../core/localization/l10n/app_localizations.dart';
import '../domain/entities/learning_reminder.dart';

class LearningReminderLabels {
  const LearningReminderLabels({
    required this.title,
    required this.message,
    required this.cta,
  });

  final String title;
  final String message;
  final String cta;
}

LearningReminderLabels buildLearningReminderLabels(
  AppLocalizations l10n,
  LearningReminder reminder,
) {
  switch (reminder.kind) {
    case LearningReminderKind.flashcardsDue:
      return LearningReminderLabels(
        title: l10n.learningReminderFlashcardsTitle(
          reminder.dueFlashcardCount ?? 0,
        ),
        message: l10n.learningReminderFlashcardsMessage(reminder.sessionTitle),
        cta: l10n.quizLibraryOpenFlashcards,
      );
    case LearningReminderKind.weakQuiz:
      final attempt = reminder.lastAttempt;
      return LearningReminderLabels(
        title: l10n.learningReminderWeakQuizTitle(
          reminder.incorrectAnswerCount ?? 0,
        ),
        message: l10n.learningReminderWeakQuizMessage(
          reminder.sessionTitle,
          attempt?.scoreCorrect ?? 0,
          attempt?.scoreTotal ?? 0,
        ),
        cta: l10n.quizLibraryStartQuiz,
      );
  }
}
