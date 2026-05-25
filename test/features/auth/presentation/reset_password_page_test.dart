import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/pages/login/login_page.dart';
import 'package:frontend/features/auth/presentation/pages/reset_password/reset_password_page.dart';

import '../helpers/fake_auth_repository.dart';

Future<void> _openResetPassword(WidgetTester tester) async {
  expect(find.byType(LoginPage), findsOneWidget);
  await tester.tap(find.text('Réinitialiser'));
  await tester.pumpAndSettle();
  expect(find.byType(ResetPasswordPage), findsOneWidget);
}

void main() {
  testWidgets('reset flow shows success then try again returns to form', (
    tester,
  ) async {
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

    await _openResetPassword(tester);

    await tester.enterText(
      find.byType(TextFormField),
      'user@lucy.test',
    );
    await tester.tap(find.text('Envoyer le lien'));
    await tester.pumpAndSettle();

    expect(find.text('Vérifiez votre e-mail'), findsOneWidget);
    expect(find.textContaining('user@lucy.test'), findsOneWidget);

    await tester.tap(find.text('Réessayer'));
    await tester.pumpAndSettle();

    expect(find.text('Mot de passe oublié'), findsOneWidget);
    expect(find.text('Vérifiez votre e-mail'), findsNothing);
  });

  testWidgets('user-not-found still shows same success UI', (tester) async {
    final repository = FakeAuthRepository(null)
      ..passwordResetErrorCode = 'user-not-found';
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

    await _openResetPassword(tester);

    await tester.enterText(
      find.byType(TextFormField),
      'unknown@lucy.test',
    );
    await tester.tap(find.text('Envoyer le lien'));
    await tester.pumpAndSettle();

    expect(find.text('Vérifiez votre e-mail'), findsOneWidget);
    expect(find.textContaining('unknown@lucy.test'), findsOneWidget);
    expect(find.textContaining('Aucun compte'), findsNothing);
  });

  testWidgets('back to login navigates from success', (tester) async {
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

    await _openResetPassword(tester);

    await tester.enterText(
      find.byType(TextFormField),
      'user@lucy.test',
    );
    await tester.tap(find.text('Envoyer le lien'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Retour à la connexion'));
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(ResetPasswordPage), findsNothing);
  });
}
