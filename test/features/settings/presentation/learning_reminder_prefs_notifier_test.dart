import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations_fr.dart';
import 'package:lucy_frontend/core/localization/lucy_app_locale_provider.dart';
import 'package:lucy_frontend/features/quiz/data/clients/learning_reminder_notification_client.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/flashcard_sm2_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/learning_reminder_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/generate_learning_session_request.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder_prefs.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_reminder_notification_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_reminder_prefs_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/revision_reminder_push_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/repositories/learning_session_repository.dart';
import 'package:lucy_frontend/features/quiz/services/flashcard_sm2_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_notification_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_prefs_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_service.dart';
import 'package:lucy_frontend/features/quiz/services/revision_reminder_push_sync_service.dart';
import 'package:lucy_frontend/features/settings/presentation/controllers/learning_reminder_prefs_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lucy_frontend/features/quiz/data/clients/fcm_token_client.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/revision_reminder_push_remote_data_source.dart';

class _FailingNotificationClient implements LearningReminderNotificationClient {
  @override
  Future<void> cancelDailyReminder() async {
    throw StateError('notifications unavailable');
  }

  @override
  Future<void> initialize() async {
    throw StateError('notifications unavailable');
  }

  @override
  Future<bool> requestPermissions() async {
    throw StateError('notifications unavailable');
  }

  @override
  Future<void> scheduleDailyReminder({
    required String title,
    required String body,
    required int hour,
    required int minute,
    required String sessionId,
  }) async {
    throw StateError('notifications unavailable');
  }
}

class _NoopRevisionReminderPushSyncService
    extends RevisionReminderPushSyncService {
  _NoopRevisionReminderPushSyncService()
    : super(
        remotePort: _NoopRevisionReminderPushRemotePort(),
        fcmTokenClient: _NoopFcmTokenClient(),
        readTimezone: () async => 'UTC',
      );

  @override
  Future<void> sync({required LearningReminderPrefs prefs}) async {}
}

class _NoopRevisionReminderPushRemotePort
    implements RevisionReminderPushRemotePort {
  @override
  Future<void> syncPushState({
    String? fcmToken,
    required LearningReminderPrefs prefs,
    required String timezone,
  }) async {}
}

class _NoopFcmTokenClient implements FcmTokenClient {
  @override
  Future<String?> requestToken() async => null;
}

class _EmptyLearningSessionRepository implements LearningSessionRepository {
  @override
  Future<List<LearningSessionListItem>> list() async => const [];

  @override
  Future<LearningSession> generate(GenerateLearningSessionRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<LearningSession> getById(String sessionId) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String sessionId) {
    throw UnimplementedError();
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('save persists prefs even when notification sync fails', () async {
    final prefs = await SharedPreferences.getInstance();
    final prefsService = LearningReminderPrefsService(
      dataSource: LearningReminderPrefsDataSource(Future.value(prefs)),
    );
    final notificationService = LearningReminderNotificationService(
      client: _FailingNotificationClient(),
      prefsService: prefsService,
      learningSessionService: LearningSessionService(
        repository: _EmptyLearningSessionRepository(),
      ),
      reminderService: LearningReminderService(
        flashcardSm2Service: FlashcardSm2Service(
          dataSource: FlashcardSm2PrefsDataSource(Future.value(prefs)),
        ),
        quizAttemptService: QuizAttemptService(
          dataSource: QuizAttemptPrefsDataSource(Future.value(prefs)),
        ),
      ),
      resolveLocalizations: (_) => AppLocalizationsFr(),
    );

    final container = ProviderContainer(
      overrides: [
        lucyAppLocaleProvider.overrideWithValue(const Locale('fr')),
        learningReminderPrefsServiceProvider.overrideWithValue(prefsService),
        learningReminderNotificationServiceProvider.overrideWithValue(
          notificationService,
        ),
        revisionReminderPushSyncServiceProvider.overrideWithValue(
          _NoopRevisionReminderPushSyncService(),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(learningReminderPrefsProvider.notifier);
    await container.read(learningReminderPrefsProvider.future);

    final ok = await notifier.setEnabled(true);

    expect(ok, isTrue);
    expect(container.read(learningReminderPrefsProvider).value?.enabled, isTrue);
    final stored = await prefsService.read();
    expect(stored.enabled, isTrue);
  });
}
