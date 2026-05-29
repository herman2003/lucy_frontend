import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/lucy_locale_resolution.dart';

import '../../helpers/test_locales.dart';

void main() {
  testWidgets('readDeviceLocale uses localeTestValue in tests', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    expect(readDeviceLocale(), const Locale('fr'));
  });

  testWidgets('resolveLucyLocale ignores device locale', (tester) async {
    setTestLocaleOverride(const Locale('es'));
    addTearDown(clearTestLocaleOverride);

    expect(resolveLucyLocale(readDeviceLocale()), kLucyAppLocale);
  });
}
