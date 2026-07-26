import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/learning_reminder_storage_keys.dart';
import '../../domain/entities/learning_reminder_prefs.dart';

/// Persists learning reminder user preferences (LEARN-12a-3).
class LearningReminderPrefsDataSource {
  LearningReminderPrefsDataSource([Future<SharedPreferences>? prefs])
    : _prefsFuture = prefs ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _prefsFuture;

  Future<LearningReminderPrefs> read() async {
    final prefs = await _prefsFuture;
    final raw = prefs.getString(LearningReminderStorageKeys.prefs);
    if (raw == null || raw.isEmpty) {
      return LearningReminderPrefs.defaults;
    }

    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return LearningReminderPrefs.defaults;
    }

    return LearningReminderPrefs.fromJson(decoded);
  }

  Future<void> write(LearningReminderPrefs value) async {
    final prefs = await _prefsFuture;
    await prefs.setString(
      LearningReminderStorageKeys.prefs,
      jsonEncode(value.toJson()),
    );
  }
}
