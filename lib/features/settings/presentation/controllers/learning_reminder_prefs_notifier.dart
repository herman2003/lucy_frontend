import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../quiz/domain/entities/learning_reminder_prefs.dart';
import '../../../quiz/domain/providers/learning_reminder_prefs_provider.dart';

part 'learning_reminder_prefs_notifier.g.dart';

@riverpod
class LearningReminderPrefsNotifier extends _$LearningReminderPrefsNotifier {
  @override
  Future<LearningReminderPrefs> build() {
    return ref.read(learningReminderPrefsServiceProvider).read();
  }

  Future<void> save(LearningReminderPrefs prefs) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(learningReminderPrefsServiceProvider).save(prefs);
      return prefs;
    });
  }

  Future<void> setEnabled(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    await save(current.copyWith(enabled: enabled));
  }

  Future<void> setReminderTime({
    required int hour,
    required int minute,
  }) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    await save(
      current.copyWith(reminderHour: hour, reminderMinute: minute),
    );
  }

  Future<void> setFlashcardsDue(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    await save(current.copyWith(flashcardsDue: enabled));
  }

  Future<void> setRevisionPlanEnabled(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    await save(current.copyWith(revisionPlanEnabled: enabled));
  }

  Future<void> setWeakQuizEnabled(bool enabled) async {
    final current = state.value ?? LearningReminderPrefs.defaults;
    await save(current.copyWith(weakQuizEnabled: enabled));
  }
}
