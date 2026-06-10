import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'lucy_locale_resolution.dart';

part 'lucy_app_locale_provider.g.dart';

/// Runtime UI locale (fr / en / de) — synced from `GET /v1/users/me`.
@Riverpod(keepAlive: true)
class LucyAppLocale extends _$LucyAppLocale {
  @override
  Locale build() => kLucyAppLocale;

  void applyLanguageCode(String? code) {
    final resolved = _localeFromCode(code);
    if (resolved != null) {
      state = resolved;
    }
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
