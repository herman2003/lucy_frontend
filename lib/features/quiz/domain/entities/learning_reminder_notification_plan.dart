/// Result of evaluating whether a local reminder should be scheduled.
enum LearningReminderNotificationAction { cancel, schedule }

class LearningReminderNotificationPlan {
  const LearningReminderNotificationPlan._({
    required this.action,
    this.title,
    this.body,
    this.hour,
    this.minute,
  });

  const LearningReminderNotificationPlan.cancel()
    : action = LearningReminderNotificationAction.cancel,
      title = null,
      body = null,
      hour = null,
      minute = null;

  const LearningReminderNotificationPlan.schedule({
    required this.title,
    required this.body,
    required this.hour,
    required this.minute,
  }) : action = LearningReminderNotificationAction.schedule;

  final LearningReminderNotificationAction action;
  final String? title;
  final String? body;
  final int? hour;
  final int? minute;
}
