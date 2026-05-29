import 'package:flutter/material.dart';

/// Fixed UI locale for the whole app (German only at runtime).
const kLucyAppLocale = Locale('de');

/// Reads the current platform / test locale from the binding.
Locale? readDeviceLocale() {
  return WidgetsBinding.instance.platformDispatcher.locale;
}

/// Always returns [kLucyAppLocale] — the app does not follow the device language.
Locale resolveLucyLocale(Locale? locale) => kLucyAppLocale;
