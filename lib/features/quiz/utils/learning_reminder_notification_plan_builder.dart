import '../domain/entities/learning_reminder.dart';
import '../domain/entities/learning_reminder_notification_plan.dart';
import '../domain/entities/learning_reminder_prefs.dart';
import 'learning_reminder_labels.dart';

LearningReminderNotificationPlan buildLearningReminderNotificationPlan({
  required LearningReminderPrefs prefs,
  required LearningReminder? reminder,
  required LearningReminderLabels? labels,
}) {
  if (!prefs.enabled || reminder == null || labels == null) {
    return const LearningReminderNotificationPlan.cancel();
  }

  return LearningReminderNotificationPlan.schedule(
    title: labels.title,
    body: labels.message,
    hour: prefs.reminderHour,
    minute: prefs.reminderMinute,
  );
}
