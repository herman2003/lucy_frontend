import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/lucy_locale_resolution.dart';

import '../../helpers/test_locales.dart';

void main() {
  testWidgets('readDeviceLocale uses localeTestValue in tests', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    expect(readDeviceLocale(), const Locale('fr'));
  });

  testWidgets('readDeviceLocale resolves unsupported language to French', (
    tester,
  ) async {
    setTestLocaleOverride(const Locale('es'));
    addTearDown(clearTestLocaleOverride);

    expect(resolveLucyLocale(readDeviceLocale()), const Locale('fr'));
  });
}
