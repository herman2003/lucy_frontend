/// Platform bridge for scheduling the daily learning reminder (LEARN-12a-4).
abstract class LearningReminderNotificationClient {
  Future<void> initialize();

  Future<bool> requestPermissions();

  Future<void> cancelDailyReminder();

  Future<void> scheduleDailyReminder({
    required String title,
    required String body,
    required int hour,
    required int minute,
    required String sessionId,
  });
}

class ScheduledLearningReminderNotification {
  const ScheduledLearningReminderNotification({
    required this.title,
    required this.body,
    required this.hour,
    required this.minute,
    required this.sessionId,
  });

  final String title;
  final String body;
  final int hour;
  final int minute;
  final String sessionId;
}
