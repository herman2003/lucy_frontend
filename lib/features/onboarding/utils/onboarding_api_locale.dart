import 'package:flutter/material.dart';

/// Maps device locale to API `locale` (`fr` | `en` | `de`).
String resolveOnboardingApiLocale(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return 'en';
    case 'de':
      return 'de';
    default:
      return 'fr';
  }
}
