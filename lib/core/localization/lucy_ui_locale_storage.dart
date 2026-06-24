import 'package:shared_preferences/shared_preferences.dart';

/// Persists the UI language code (fr / en / de) across app restarts.
///
/// Uses the same prefs key as onboarding so locale survives before/after signup.
abstract final class LucyUiLocaleStorage {
  static const prefsKey = 'lucy_onboarding_ui_locale';

  static Future<String?> read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(prefsKey);
  }

  static Future<void> write(String? code) async {
    final prefs = await SharedPreferences.getInstance();
    if (code == null || code.isEmpty) {
      await prefs.remove(prefsKey);
      return;
    }
    await prefs.setString(prefsKey, code);
  }
}
