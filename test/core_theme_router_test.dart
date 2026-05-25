import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';

import 'helpers/auth_test_overrides.dart';

void main() {
  testWidgets('LucyApp uses GoRouter splash with themed loading indicator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: splashBootstrapOverrides(),
        child: const LucyApp(),
      ),
    );
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Lucy'), findsOneWidget);
  });
}
