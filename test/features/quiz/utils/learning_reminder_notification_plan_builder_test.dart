import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations_fr.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder_notification_plan.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder_prefs.dart';
import 'package:lucy_frontend/features/quiz/utils/learning_reminder_labels.dart';
import 'package:lucy_frontend/features/quiz/utils/learning_reminder_notification_plan_builder.dart';

void main() {
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

  test('cancels when reminders are disabled', () {
    final plan = buildLearningReminderNotificationPlan(
      prefs: LearningReminderPrefs.defaults,
      reminder: reminder,
      labels: labels,
    );

    expect(plan.action, LearningReminderNotificationAction.cancel);
  });

  test('cancels when enabled but there is no reminder content', () {
    final plan = buildLearningReminderNotificationPlan(
      prefs: LearningReminderPrefs.defaults.copyWith(enabled: true),
      reminder: null,
      labels: null,
    );

    expect(plan.action, LearningReminderNotificationAction.cancel);
  });

  test('schedules one daily notification when enabled with content', () {
    const prefs = LearningReminderPrefs(
      enabled: true,
      reminderHour: 18,
      reminderMinute: 30,
      flashcardsDue: true,
      revisionPlanEnabled: true,
      weakQuizEnabled: true,
    );

    final plan = buildLearningReminderNotificationPlan(
      prefs: prefs,
      reminder: reminder,
      labels: labels,
    );

    expect(plan.action, LearningReminderNotificationAction.schedule);
    expect(plan.title, labels.title);
    expect(plan.body, labels.message);
    expect(plan.hour, 18);
    expect(plan.minute, 30);
  });
}
