import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/learning_reminder_prefs.dart';

/// Remote port for server-side revision reminder push (LEARN-12a-V2).
abstract class RevisionReminderPushRemotePort {
  Future<void> syncPushState({
    String? fcmToken,
    required LearningReminderPrefs prefs,
    required String timezone,
  });
}

/// Remote API for revision reminder push registration (LEARN-12a-V2).
class RevisionReminderPushApiRemoteDataSource
    implements RevisionReminderPushRemotePort {
  RevisionReminderPushApiRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<void> syncPushState({
    String? fcmToken,
    required LearningReminderPrefs prefs,
    required String timezone,
  }) async {
    await _dio.put<void>(
      ApiEndpoints.usersMeRevisionReminderPush,
      data: {
        if (fcmToken != null) 'fcmToken': fcmToken,
        'prefs': {
          'enabled': prefs.enabled,
          'reminderHour': prefs.reminderHour,
          'reminderMinute': prefs.reminderMinute,
          'revisionPlanEnabled': prefs.revisionPlanEnabled,
          'timezone': timezone,
        },
      },
    );
  }
}
