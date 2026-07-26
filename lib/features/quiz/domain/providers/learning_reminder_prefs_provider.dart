import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/learning_reminder_prefs_data_source.dart';
import '../../services/learning_reminder_prefs_service.dart';

part 'learning_reminder_prefs_provider.g.dart';

@Riverpod(keepAlive: true)
LearningReminderPrefsService learningReminderPrefsService(Ref ref) {
  return LearningReminderPrefsService(
    dataSource: LearningReminderPrefsDataSource(),
  );
}
