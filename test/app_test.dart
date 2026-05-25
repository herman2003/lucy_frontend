import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';

import 'helpers/auth_test_overrides.dart';

void main() {
  testWidgets('LucyApp shows splash with Lucy title instead of demo counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: splashBootstrapOverrides(),
        child: const LucyApp(),
      ),
    );

    expect(find.text('Lucy'), findsWidgets);
    expect(find.byIcon(Icons.add), findsNothing);
  });
}
