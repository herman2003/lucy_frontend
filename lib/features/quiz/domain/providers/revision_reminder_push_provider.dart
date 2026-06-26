import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/device_timezone_reader.dart';
import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../data/clients/firebase_messaging_fcm_token_client.dart';
import '../../data/clients/fcm_token_client.dart';
import '../../data/datasources/revision_reminder_push_remote_data_source.dart';
import '../../services/revision_reminder_push_sync_service.dart';

part 'revision_reminder_push_provider.g.dart';

@Riverpod(keepAlive: true)
FcmTokenClient fcmTokenClient(Ref ref) {
  return FirebaseMessagingFcmTokenClient();
}

@Riverpod(keepAlive: true)
RevisionReminderPushApiRemoteDataSource revisionReminderPushApiRemoteDataSource(
  Ref ref,
) {
  return RevisionReminderPushApiRemoteDataSource(
    ref.watch(lucyDioClientProvider).dio,
  );
}

@Riverpod(keepAlive: true)
RevisionReminderPushSyncService revisionReminderPushSyncService(Ref ref) {
  return RevisionReminderPushSyncService(
    remotePort: ref.watch(revisionReminderPushApiRemoteDataSourceProvider),
    fcmTokenClient: ref.watch(fcmTokenClientProvider),
    readTimezone: readDeviceTimezoneIdentifier,
  );
}
