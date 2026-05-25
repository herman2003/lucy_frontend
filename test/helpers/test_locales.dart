import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Overrides [PlatformDispatcher.locale] for widget tests.
void setTestLocaleOverride(Locale locale) {
  TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue = locale;
}

/// Default French locale for tests written against `app_fr.arb` strings.
void setTestLocaleFr() => setTestLocaleOverride(const Locale('fr'));

/// Clears the test locale override (restores platform default).
void clearTestLocaleOverride() {
  TestWidgetsFlutterBinding.instance.platformDispatcher.clearLocaleTestValue();
}
