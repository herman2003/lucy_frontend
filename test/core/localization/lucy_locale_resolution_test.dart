import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/core/localization/lucy_locale_resolution.dart';

void main() {
  group('resolveLucyLocale', () {
    test('returns French for null locale', () {
      expect(resolveLucyLocale(null), const Locale('fr'));
    });

    test('returns matching supported locale by language code', () {
      expect(resolveLucyLocale(const Locale('en', 'US')), const Locale('en'));
      expect(resolveLucyLocale(const Locale('de')), const Locale('de'));
      expect(resolveLucyLocale(const Locale('fr', 'CA')), const Locale('fr'));
    });

    test('falls back to French for unsupported language', () {
      expect(resolveLucyLocale(const Locale('es')), const Locale('fr'));
    });

    test('supported locales include fr, en, de', () {
      expect(
        AppLocalizations.supportedLocales,
        containsAll(const [
          Locale('fr'),
          Locale('en'),
          Locale('de'),
        ]),
      );
    });
  });
}
