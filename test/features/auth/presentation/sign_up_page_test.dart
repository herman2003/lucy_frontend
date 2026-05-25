import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_chat_page.dart';
import 'package:frontend/features/auth/presentation/pages/login/login_page.dart';
import 'package:frontend/features/auth/presentation/pages/sign_up/sign_up_page.dart';

import 'package:frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_auth_repository.dart';

Future<void> _openSignUp(WidgetTester tester) async {
  expect(find.byType(LoginPage), findsOneWidget);
  await tester.tap(find.text('Créer un compte'));
  await tester.pumpAndSettle();
  expect(find.byType(SignUpPage), findsOneWidget);
}

void main() {
  tearDown(LucySnackBar.hideAll);

  testWidgets('sign up navigates to onboarding when not configured', (
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

    await _openSignUp(tester);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Lucy User');
    await tester.enterText(fields.at(1), 'new@lucy.test');
    await tester.enterText(fields.at(2), 'password1');

    await tester.tap(find.text('Créer mon compte'));
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingChatPage), findsOneWidget);
    expect(find.byType(SignUpPage), findsNothing);
  });

  testWidgets('profile write failure keeps user on sign up', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);
    final repository = FakeAuthRepository(null)..failProfileWrite = true;
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

    await _openSignUp(tester);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Lucy User');
    await tester.enterText(fields.at(1), 'fail@lucy.test');
    await tester.enterText(fields.at(2), 'password1');

    await tester.tap(find.text('Créer mon compte'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.byType(SignUpPage), findsOneWidget);
    expect(find.byType(OnboardingChatPage), findsNothing);
    expect(find.textContaining('profil'), findsOneWidget);
  });
}
