import '../data/datasources/learning_reminder_prefs_data_source.dart';
import '../domain/entities/learning_reminder_prefs.dart';

/// Reads and writes learning reminder preferences (LEARN-12a-3).
class LearningReminderPrefsService {
  LearningReminderPrefsService({required LearningReminderPrefsDataSource dataSource})
    : _dataSource = dataSource;

  final LearningReminderPrefsDataSource _dataSource;

  Future<LearningReminderPrefs> read() => _dataSource.read();

  Future<void> save(LearningReminderPrefs prefs) => _dataSource.write(prefs);
}
