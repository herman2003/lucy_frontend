import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/pages/login/login_page.dart';

import '../../features/auth/helpers/fake_auth_repository.dart';
import '../../helpers/test_locales.dart';

void main() {
  testWidgets('LucyApp shows English login labels when device locale is en', (
    tester,
  ) async {
    final repository = FakeAuthRepository(null);
    setTestLocaleOverride(const Locale('en'));
    addTearDown(clearTestLocaleOverride);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(repository),
          authBootstrapProvider.overrideWith((ref) async => null),
          authStateChangesProvider.overrideWith(
            (ref) => repository.authStateChanges(),
          ),
        ],
        child: const LucyApp(),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Log in'), findsWidgets);
    expect(find.text('Se connecter'), findsNothing);
  });

  testWidgets('LucyApp shows German login labels when device locale is de', (
    tester,
  ) async {
    final repository = FakeAuthRepository(null);
    setTestLocaleOverride(const Locale('de'));
    addTearDown(clearTestLocaleOverride);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(repository),
          authBootstrapProvider.overrideWith((ref) async => null),
          authStateChangesProvider.overrideWith(
            (ref) => repository.authStateChanges(),
          ),
        ],
        child: const LucyApp(),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Anmelden'), findsWidgets);
  });
}
