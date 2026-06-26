import '../data/clients/fcm_token_client.dart';
import '../data/datasources/revision_reminder_push_remote_data_source.dart';
import '../domain/entities/learning_reminder_prefs.dart';

export '../data/clients/fcm_token_client.dart';

/// Syncs reminder prefs and FCM token to the backend (LEARN-12a-V2).
class RevisionReminderPushSyncService {
  RevisionReminderPushSyncService({
    required RevisionReminderPushRemotePort remotePort,
    required FcmTokenClient fcmTokenClient,
    required Future<String> Function() readTimezone,
  }) : _remotePort = remotePort,
       _fcmTokenClient = fcmTokenClient,
       _readTimezone = readTimezone;

  final RevisionReminderPushRemotePort _remotePort;
  final FcmTokenClient _fcmTokenClient;
  final Future<String> Function() _readTimezone;

  Future<void> sync({required LearningReminderPrefs prefs}) async {
    final timezone = await _readTimezone();
    String? fcmToken;
    if (prefs.enabled && prefs.revisionPlanEnabled) {
      fcmToken = await _fcmTokenClient.requestToken();
    }

    await _remotePort.syncPushState(
      fcmToken: fcmToken,
      prefs: prefs,
      timezone: timezone,
    );
  }
}
