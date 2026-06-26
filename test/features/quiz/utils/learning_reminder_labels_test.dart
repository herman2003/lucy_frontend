import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations_fr.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/quiz_attempt.dart';
import 'package:lucy_frontend/features/quiz/utils/learning_reminder_labels.dart';

import '../../../helpers/test_locales.dart';

void main() {
  test('builds flashcards due labels', () {
    const reminder = LearningReminder(
      kind: LearningReminderKind.flashcardsDue,
      sessionId: 'learn_flash_1',
      sessionTitle: 'Cartes · entropie',
      dueFlashcardCount: 8,
    );

    final labels = buildLearningReminderLabels(
      AppLocalizationsFr(),
      reminder,
    );

    expect(labels.title, contains('8'));
    expect(labels.message, contains('Cartes · entropie'));
    expect(labels.cta, 'Ouvrir les cartes');
  });

  test('builds weak quiz labels', () {
    final reminder = LearningReminder(
      kind: LearningReminderKind.weakQuiz,
      sessionId: 'learn_quiz_1',
      sessionTitle: 'Quiz · thermo',
      incorrectAnswerCount: 2,
      lastAttempt: QuizAttempt(
        id: 'attempt_1',
        sessionId: 'learn_quiz_1',
        startedAt: DateTime.utc(2026, 6, 10, 8),
        completedAt: DateTime.utc(2026, 6, 10, 8, 10),
        scoreCorrect: 3,
        scoreTotal: 5,
        answers: const [],
      ),
    );

    final labels = buildLearningReminderLabels(
      AppLocalizationsFr(),
      reminder,
    );

    expect(labels.title, contains('2'));
    expect(labels.message, contains('3/5'));
    expect(labels.message, contains('Quiz · thermo'));
    expect(labels.cta, 'Démarrer le quiz');
  });
}
