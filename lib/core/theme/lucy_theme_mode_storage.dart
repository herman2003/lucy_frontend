import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists light / dark / system preference for [ThemeMode].
abstract final class LucyThemeModeStorage {
  static const prefsKey = 'lucy_theme_mode';

  static Future<ThemeMode?> read() async {
    final prefs = await SharedPreferences.getInstance();
    return _fromStorage(prefs.getString(prefsKey));
  }

  static Future<void> write(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, _toStorage(mode));
  }

  static ThemeMode? _fromStorage(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => null,
    };
  }

  static String _toStorage(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
  }
}
