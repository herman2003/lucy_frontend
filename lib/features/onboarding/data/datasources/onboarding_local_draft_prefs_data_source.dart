import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Keys for onboarding local mirror (SPEC §4.7 A16).
abstract final class OnboardingLocalDraftKeys {
  static const uiLocale = 'lucy_onboarding_ui_locale';
  static String draftForUid(String uid) => 'lucy_onboarding_draft_$uid';
}

/// Persists onboarding draft JSON via [SharedPreferences].
class OnboardingLocalDraftPrefsDataSource {
  OnboardingLocalDraftPrefsDataSource([Future<SharedPreferences>? prefs])
    : _prefsFuture = prefs ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _prefsFuture;

  Future<void> writeString(String key, String value) async {
    final prefs = await _prefsFuture;
    await prefs.setString(key, value);
  }

  Future<String?> readString(String key) async {
    final prefs = await _prefsFuture;
    return prefs.getString(key);
  }

  Future<void> remove(String key) async {
    final prefs = await _prefsFuture;
    await prefs.remove(key);
  }

  Future<void> writeDraftJson(String uid, Map<String, dynamic> json) async {
    await writeString(
      OnboardingLocalDraftKeys.draftForUid(uid),
      jsonEncode(json),
    );
  }

  Future<Map<String, dynamic>?> readDraftJson(String uid) async {
    final raw = await readString(OnboardingLocalDraftKeys.draftForUid(uid));
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }
    return decoded;
  }
}
