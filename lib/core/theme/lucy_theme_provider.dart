import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'lucy_flex_theme.dart';
import 'lucy_interface_style.dart';
import 'lucy_interface_style_storage.dart';
import 'lucy_theme_mode_storage.dart';

part 'lucy_theme_provider.freezed.dart';
part 'lucy_theme_provider.g.dart';

/// Runtime theme preferences (interface style + brightness mode).
@freezed
abstract class LucyThemePreferences with _$LucyThemePreferences {
  const factory LucyThemePreferences({
    @Default(LucyInterfaceStyle.academic) LucyInterfaceStyle interfaceStyle,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _LucyThemePreferences;
}

/// Exposes [ThemeData] for light/dark and persisted user preferences.
@Riverpod(keepAlive: true)
class LucyAppTheme extends _$LucyAppTheme {
  static LucyThemePreferences _bootstrapped = const LucyThemePreferences();

  /// Call from [main] before [runApp].
  static void bootstrap({
    LucyInterfaceStyle? interfaceStyle,
    ThemeMode? themeMode,
  }) {
    _bootstrapped = LucyThemePreferences(
      interfaceStyle: interfaceStyle ?? LucyInterfaceStyle.academic,
      themeMode: themeMode ?? ThemeMode.system,
    );
  }

  @override
  LucyThemePreferences build() => _bootstrapped;

  void setInterfaceStyle(LucyInterfaceStyle style) {
    state = state.copyWith(interfaceStyle: style);
    _bootstrapped = state;
    unawaited(LucyInterfaceStyleStorage.write(style));
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _bootstrapped = state;
    unawaited(LucyThemeModeStorage.write(mode));
  }
}

/// Light [ThemeData] for the current interface style.
@Riverpod(keepAlive: true)
ThemeData lucyLightTheme(Ref ref) {
  final prefs = ref.watch(lucyAppThemeProvider);
  return LucyFlexTheme.themeFor(
    brightness: Brightness.light,
    interfaceStyle: prefs.interfaceStyle,
  );
}

/// Dark [ThemeData] for the current interface style.
@Riverpod(keepAlive: true)
ThemeData lucyDarkTheme(Ref ref) {
  final prefs = ref.watch(lucyAppThemeProvider);
  return LucyFlexTheme.themeFor(
    brightness: Brightness.dark,
    interfaceStyle: prefs.interfaceStyle,
  );
}

/// [ThemeMode] for [MaterialApp].
@Riverpod(keepAlive: true)
ThemeMode lucyThemeMode(Ref ref) {
  return ref.watch(lucyAppThemeProvider).themeMode;
}
