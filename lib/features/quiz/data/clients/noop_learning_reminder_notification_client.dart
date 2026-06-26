import 'learning_reminder_notification_client.dart';

/// No-op notification client for platforms without local notifications (e.g. web).
class NoopLearningReminderNotificationClient
    implements LearningReminderNotificationClient {
  const NoopLearningReminderNotificationClient();

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> requestPermissions() async => false;

  @override
  Future<void> cancelDailyReminder() async {}

  @override
  Future<void> scheduleDailyReminder({
    required String title,
    required String body,
    required int hour,
    required int minute,
    required String sessionId,
  }) async {}
}
