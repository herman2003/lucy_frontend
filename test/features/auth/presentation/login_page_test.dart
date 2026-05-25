import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/pages/home/home_page.dart';
import 'package:frontend/features/auth/presentation/pages/login/login_page.dart';

import '../helpers/fake_auth_repository.dart';

void main() {
  testWidgets('login form navigates to home on success', (tester) async {
    final repository = FakeAuthRepository(null);
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

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

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'user@lucy.test',
    );
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'password1',
    );

    await tester.tap(find.text('Se connecter'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(LoginPage), findsNothing);
  });

  testWidgets('logout returns to login', (tester) async {
    final repository = FakeAuthRepository(null);
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

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

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'user@lucy.test',
    );
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'password1',
    );
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    await tester.tap(find.text('Se déconnecter'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
  });
}
