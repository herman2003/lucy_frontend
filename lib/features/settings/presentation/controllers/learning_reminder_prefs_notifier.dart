import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../quiz/domain/entities/learning_reminder_prefs.dart';
import '../../../quiz/domain/providers/learning_reminder_notification_provider.dart';
import '../../../quiz/domain/providers/learning_reminder_prefs_provider.dart';
import '../../../quiz/domain/providers/revision_reminder_push_provider.dart';
import '../../../../core/localization/lucy_app_locale_provider.dart';

part 'learning_reminder_prefs_notifier.g.dart';

@riverpod
class LearningReminderPrefsNotifier extends _$LearningReminderPrefsNotifier {
  @override
  Future<LearningReminderPrefs> build() {
    return ref.read(learningReminderPrefsServiceProvider).read();
  }

  Future<bool> save(LearningReminderPrefs prefs) async {
    final previous = state.value ?? LearningReminderPrefs.defaults;
    state = AsyncData(prefs);
    try {
      await ref.read(learningReminderPrefsServiceProvider).save(prefs);
    } catch (_) {
      state = AsyncData(previous);
      return false;
    }

    await _syncSideEffects(prefs);
    return true;
  }

  Future<void> _syncSideEffects(LearningReminderPrefs prefs) async {
    try {
      await ref
          .read(learningReminderNotificationServiceProvider)
          .sync(languageCode: ref.read(lucyAppLocaleProvider).languageCode);
    } catch (_) {}

    try {
      await ref.read(revisionReminderPushSyncServiceProvider).sync(prefs: prefs);
    } catch (_) {}
  }

  Future<bool> setEnabled(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    return save(current.copyWith(enabled: enabled));
  }

  Future<bool> setReminderTime({required int hour, required int minute}) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    return save(current.copyWith(reminderHour: hour, reminderMinute: minute));
  }

  Future<bool> setFlashcardsDue(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    return save(current.copyWith(flashcardsDue: enabled));
  }

  Future<bool> setRevisionPlanEnabled(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    return save(current.copyWith(revisionPlanEnabled: enabled));
  }

  Future<bool> setWeakQuizEnabled(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    return save(current.copyWith(weakQuizEnabled: enabled));
  }
}
