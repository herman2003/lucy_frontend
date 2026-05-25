import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// CP-0 — web target compiles and produces deployable artifacts.
void main() {
  test('build/web contains index.html and main.dart.js after web build', () {
    final index = File('build/web/index.html');
    final mainJs = File('build/web/main.dart.js');

    expect(
      index.existsSync(),
      isTrue,
      reason: 'Run `flutter build web` before this test (CI / CP-0 verify)',
    );
    expect(mainJs.existsSync(), isTrue);

    final html = index.readAsStringSync();
    expect(html.toLowerCase(), contains('lucy'));
    expect(html, isNot(contains('Flutter Demo')));
  });
}
