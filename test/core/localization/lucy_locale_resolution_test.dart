import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/localization/lucy_locale_resolution.dart';

void main() {
  group('resolveLucyLocale', () {
    test('always returns German regardless of input', () {
      expect(resolveLucyLocale(null), kLucyAppLocale);
      expect(resolveLucyLocale(const Locale('en', 'US')), kLucyAppLocale);
      expect(resolveLucyLocale(const Locale('fr', 'CA')), kLucyAppLocale);
      expect(resolveLucyLocale(const Locale('es')), kLucyAppLocale);
    });

    test('supported locales include fr, en, de', () {
      expect(
        AppLocalizations.supportedLocales,
        containsAll(const [Locale('fr'), Locale('en'), Locale('de')]),
      );
    });
  });
}
