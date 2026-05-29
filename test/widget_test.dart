import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/app.dart';
import 'package:lucy_frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:lucy_frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:lucy_frontend/features/auth/presentation/pages/login/login_page.dart';
import 'package:lucy_frontend/features/auth/presentation/pages/reset_password/reset_password_page.dart';
import 'package:lucy_frontend/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:lucy_frontend/features/auth/presentation/widgets/auth_mobile_layout.dart';
import 'package:lucy_frontend/features/auth/presentation/widgets/auth_web_layout.dart';
import 'package:lucy_frontend/shared/widgets/inputs/lucy_text_field.dart';

import 'features/auth/helpers/fake_auth_repository.dart';
import 'helpers/auth_test_overrides.dart';
import 'helpers/test_locales.dart';

// ignore: strict_top_level_inference
_loggedOutAuthOverrides(FakeAuthRepository repository) {
  return [
    authRepositoryProvider.overrideWithValue(repository),
    authBootstrapProvider.overrideWith(
      (ref) async => const AuthBootstrapResult(),
    ),
    authStateChangesProvider.overrideWith(
      (ref) => repository.authStateChanges(),
    ),
  ];
}

void main() {
  testWidgets('LucyApp shows splash with Lucy title (smoke)', (
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

  testWidgets('auth routes render login, sign up and reset forms', (
    WidgetTester tester,
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
        overrides: _loggedOutAuthOverrides(repository),
        child: const LucyApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(LucyTextField), findsAtLeast(2));
    expect(find.byType(AuthWebLayout), findsOneWidget);

    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpPage), findsOneWidget);
    expect(find.byType(TextFormField), findsAtLeast(3));

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Réinitialiser'));
    await tester.pumpAndSettle();
    expect(find.byType(ResetPasswordPage), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
  });

  testWidgets('auth mobile layout on narrow viewport', (
    WidgetTester tester,
  ) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);
    final repository = FakeAuthRepository(null);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: _loggedOutAuthOverrides(repository),
        child: const LucyApp(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(AuthMobileLayout), findsOneWidget);
    expect(find.byType(AuthWebLayout), findsNothing);
  });
}
