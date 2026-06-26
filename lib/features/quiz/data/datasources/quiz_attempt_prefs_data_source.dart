import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/quiz_attempt_storage_keys.dart';
import '../../domain/entities/quiz_attempt.dart';

/// Persists quiz attempts per session in SharedPreferences (LEARN-12b).
class QuizAttemptPrefsDataSource {
  QuizAttemptPrefsDataSource([Future<SharedPreferences>? prefs])
    : _prefsFuture = prefs ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _prefsFuture;

  Future<List<QuizAttempt>> readAttempts(String sessionId) async {
    final prefs = await _prefsFuture;
    final raw = prefs.getString(
      QuizAttemptStorageKeys.sessionAttempts(sessionId),
    );
    if (raw == null || raw.isEmpty) {
      return [];
    }

    final decoded = jsonDecode(raw);
    if (decoded is! List) {
      return [];
    }

    return [
      for (final entry in decoded)
        if (entry is Map<String, dynamic>) QuizAttempt.fromJson(entry),
    ];
  }

  Future<void> writeAttempts(
    String sessionId,
    List<QuizAttempt> attempts,
  ) async {
    final prefs = await _prefsFuture;
    final encoded = attempts.map((attempt) => attempt.toJson()).toList();
    await prefs.setString(
      QuizAttemptStorageKeys.sessionAttempts(sessionId),
      jsonEncode(encoded),
    );
  }

  Future<void> deleteAttempts(String sessionId) async {
    final prefs = await _prefsFuture;
    await prefs.remove(QuizAttemptStorageKeys.sessionAttempts(sessionId));
  }
}
