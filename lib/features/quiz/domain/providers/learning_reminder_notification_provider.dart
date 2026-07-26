import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/localization/lucy_app_locale_provider.dart';
import '../../../../core/signals/quiz_library_refresh_signal.dart';
import '../../data/clients/flutter_local_learning_reminder_notification_client.dart';
import '../../data/clients/learning_reminder_notification_client.dart';
import '../../data/clients/noop_learning_reminder_notification_client.dart';
import '../../services/learning_reminder_notification_service.dart';
import 'learning_reminder_prefs_provider.dart';
import 'learning_reminder_provider.dart';
import 'learning_session_provider.dart';

part 'learning_reminder_notification_provider.g.dart';

@Riverpod(keepAlive: true)
LearningReminderNotificationClient learningReminderNotificationClient(Ref ref) {
  if (kIsWeb) {
    return const NoopLearningReminderNotificationClient();
  }
  return FlutterLocalLearningReminderNotificationClient();
}

@Riverpod(keepAlive: true)
LearningReminderNotificationService learningReminderNotificationService(
  Ref ref,
) {
  return LearningReminderNotificationService(
    client: ref.watch(learningReminderNotificationClientProvider),
    prefsService: ref.watch(learningReminderPrefsServiceProvider),
    learningSessionService: ref.watch(learningSessionServiceProvider),
    reminderService: ref.watch(learningReminderServiceProvider),
    resolveLocalizations: (languageCode) =>
        lookupAppLocalizations(Locale(languageCode)),
  );
}

/// Re-schedules the daily local reminder when locale or quiz library changes.
@Riverpod(keepAlive: true)
void learningReminderNotificationSyncListener(Ref ref) {
  ref.watch(lucyAppLocaleProvider);
  ref.watch(quizLibraryRefreshSignalProvider);

  Future.microtask(() async {
    await ref
        .read(learningReminderNotificationServiceProvider)
        .sync(languageCode: ref.read(lucyAppLocaleProvider).languageCode);
  });
}
