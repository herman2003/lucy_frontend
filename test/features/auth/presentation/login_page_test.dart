import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:frontend/features/auth/data/providers/auth_data_provider.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/pages/home/home_page.dart';
import 'package:frontend/features/auth/presentation/pages/login/login_page.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_placeholder_page.dart';

import 'package:frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_auth_repository.dart';

void main() {
  tearDown(LucySnackBar.hideAll);

  testWidgets('login navigates to onboarding when not configured', (
    tester,
  ) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);
    final repository = FakeAuthRepository(null);
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(repository),
          authBootstrapProvider.overrideWith(
            (ref) async => const AuthBootstrapResult(),
          ),
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

    await tester.enterText(find.byType(TextFormField).at(0), 'user@lucy.test');
    await tester.enterText(find.byType(TextFormField).at(1), 'password1');

    await tester.tap(find.text('Se connecter'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingPlaceholderPage), findsOneWidget);
    expect(find.byType(LoginPage), findsNothing);
  });

  testWidgets('logout returns to login', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);
    final repository = FakeAuthRepository(null, isConfigured: true);
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryImplProvider.overrideWithValue(repository),
          authRepositoryProvider.overrideWithValue(repository),
          authStateChangesProvider.overrideWith(
            (ref) => repository.authStateChanges(),
          ),
        ],
        child: const LucyApp(),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    await tester.enterText(find.byType(TextFormField).at(0), 'user@lucy.test');
    await tester.enterText(find.byType(TextFormField).at(1), 'password1');
    await tester.tap(find.text('Se connecter'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
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
