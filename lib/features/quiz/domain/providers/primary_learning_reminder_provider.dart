import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/signals/quiz_library_refresh_signal.dart';
import '../../domain/entities/learning_reminder.dart';
import 'learning_reminder_provider.dart';
import 'learning_session_provider.dart';

part 'primary_learning_reminder_provider.g.dart';

/// Resolves the highest-priority in-app learning reminder (LEARN-12a-2).
@riverpod
Future<LearningReminder?> primaryLearningReminder(Ref ref) async {
  ref.watch(quizLibraryRefreshSignalProvider);
  final sessions = await ref.read(learningSessionServiceProvider).list();
  return ref.read(learningReminderServiceProvider).pickPrimaryReminder(
    sessions: sessions,
    now: DateTime.now().toUtc(),
  );
}
