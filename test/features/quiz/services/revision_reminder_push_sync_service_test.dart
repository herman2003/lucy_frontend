import 'package:flutter_test/flutter_test.dart';

import 'package:lucy_frontend/features/quiz/data/datasources/revision_reminder_push_remote_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder_prefs.dart';
import 'package:lucy_frontend/features/quiz/services/revision_reminder_push_sync_service.dart';

void main() {
  test('sync registers FCM token when revision plan reminders are enabled', () async {
    final remote = _FakeRevisionReminderPushRemotePort();
    final fcm = _FakeFcmTokenClient(token: 'device-token-a');
    final service = RevisionReminderPushSyncService(
      remotePort: remote,
      fcmTokenClient: fcm,
      readTimezone: () async => 'Europe/Paris',
    );

    await service.sync(
      prefs: LearningReminderPrefs.defaults.copyWith(
        enabled: true,
        revisionPlanEnabled: true,
      ),
    );

    expect(remote.lastFcmToken, 'device-token-a');
    expect(remote.lastTimezone, 'Europe/Paris');
    expect(remote.lastPrefs?.enabled, isTrue);
  });

  test('sync skips FCM token when reminders are disabled', () async {
    final remote = _FakeRevisionReminderPushRemotePort();
    final fcm = _FakeFcmTokenClient(token: 'device-token-a');
    final service = RevisionReminderPushSyncService(
      remotePort: remote,
      fcmTokenClient: fcm,
      readTimezone: () async => 'Europe/Paris',
    );

    await service.sync(prefs: LearningReminderPrefs.defaults);

    expect(remote.lastFcmToken, isNull);
    expect(remote.lastPrefs?.enabled, isFalse);
    expect(fcm.requestCount, 0);
  });
}

class _FakeRevisionReminderPushRemotePort
    implements RevisionReminderPushRemotePort {
  String? lastFcmToken;
  String? lastTimezone;
  LearningReminderPrefs? lastPrefs;

  @override
  Future<void> syncPushState({
    String? fcmToken,
    required LearningReminderPrefs prefs,
    required String timezone,
  }) async {
    lastFcmToken = fcmToken;
    lastPrefs = prefs;
    lastTimezone = timezone;
  }
}

class _FakeFcmTokenClient implements FcmTokenClient {
  _FakeFcmTokenClient({required this.token});

  final String? token;
  var requestCount = 0;

  @override
  Future<String?> requestToken() async {
    requestCount += 1;
    return token;
  }
}
