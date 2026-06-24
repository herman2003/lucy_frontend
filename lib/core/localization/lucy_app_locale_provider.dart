import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'lucy_locale_resolution.dart';
import 'lucy_ui_locale_storage.dart';

part 'lucy_app_locale_provider.g.dart';

/// Runtime UI locale (fr / en / de) — synced from prefs and `GET /v1/users/me`.
@Riverpod(keepAlive: true)
class LucyAppLocale extends _$LucyAppLocale {
  static String? _bootstrappedCode;

  /// Call from [main] before [runApp] so the first frame uses the saved locale.
  static void bootstrap(String? code) {
    _bootstrappedCode = code;
  }

  @override
  Locale build() {
    return _localeFromCode(_bootstrappedCode) ?? kLucyAppLocale;
  }

  void applyLanguageCode(String? code) {
    final resolved = _localeFromCode(code);
    if (resolved == null) {
      return;
    }
    _bootstrappedCode = code;
    state = resolved;
    unawaited(LucyUiLocaleStorage.write(code));
  }

  Locale? _localeFromCode(String? code) {
    return switch (code) {
      'fr' => const Locale('fr'),
      'en' => const Locale('en'),
      'de' => const Locale('de'),
      _ => null,
    };
  }
}
