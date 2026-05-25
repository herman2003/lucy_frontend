import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';

/// Reads the current platform / test locale from the binding.
Locale? readDeviceLocale() {
  return WidgetsBinding.instance.platformDispatcher.locale;
}

/// Resolves the device [locale] to one of Lucy's supported locales (fr, en, de).
Locale resolveLucyLocale(Locale? locale) {
  const fallback = Locale('fr');

  if (locale == null) {
    return fallback;
  }

  for (final supported in AppLocalizations.supportedLocales) {
    if (supported.languageCode == locale.languageCode) {
      return supported;
    }
  }

  return fallback;
}
