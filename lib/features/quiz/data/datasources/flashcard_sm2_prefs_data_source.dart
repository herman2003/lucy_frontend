import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/flashcard_sm2_storage_keys.dart';
import '../../domain/entities/flashcard_sm2_state.dart';

/// Persists per-item SM-2 state for a flashcards session.
class FlashcardSm2PrefsDataSource {
  FlashcardSm2PrefsDataSource([Future<SharedPreferences>? prefs])
    : _prefsFuture = prefs ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _prefsFuture;

  Future<Map<String, FlashcardSm2State>> readStates(String sessionId) async {
    final prefs = await _prefsFuture;
    final raw = prefs.getString(FlashcardSm2StorageKeys.sessionStates(sessionId));
    if (raw == null || raw.isEmpty) {
      return {};
    }
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return {};
    }

    final states = <String, FlashcardSm2State>{};
    for (final entry in decoded.entries) {
      final value = entry.value;
      if (value is Map<String, dynamic>) {
        states[entry.key] = FlashcardSm2State.fromJson(value);
      }
    }
    return states;
  }

  Future<void> writeStates(
    String sessionId,
    Map<String, FlashcardSm2State> states,
  ) async {
    final prefs = await _prefsFuture;
    final encoded = <String, dynamic>{
      for (final entry in states.entries) entry.key: entry.value.toJson(),
    };
    await prefs.setString(
      FlashcardSm2StorageKeys.sessionStates(sessionId),
      jsonEncode(encoded),
    );
  }
}
