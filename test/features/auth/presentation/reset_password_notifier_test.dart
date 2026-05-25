import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/controllers/reset_password_notifier.dart';
import 'package:frontend/features/auth/presentation/pages/reset_password/reset_password_state.dart';
import 'package:frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../helpers/fake_auth_repository.dart';

void main() {
  group('ResetPasswordNotifier', () {
    tearDown(LucySnackBar.hideAll);

    testWidgets('user-not-found shows success (anti-enumeration)', (
      tester,
    ) async {
      final repository = FakeAuthRepository(null)
        ..passwordResetErrorCode = 'user-not-found';
      late ProviderContainer container;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [authRepositoryProvider.overrideWithValue(repository)],
          child: Builder(
            builder: (context) {
              container = ProviderScope.containerOf(context);
              return MaterialApp(
                locale: const Locale('fr'),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const SizedBox(),
              );
            },
          ),
        ),
      );

      final notifier = container.read(resetPasswordProvider.notifier);
      notifier.updateEmail('unknown@lucy.test');

      await notifier.submitReset(tester.element(find.byType(SizedBox)));

      final state = container.read(resetPasswordProvider);
      expect(state.view, ResetPasswordView.success);
      expect(state.submittedEmail, 'unknown@lucy.test');
    });

    testWidgets('network error keeps form and shows snackbar', (tester) async {
      final repository = FakeAuthRepository(null)
        ..passwordResetErrorCode = 'network-request-failed';
      late ProviderContainer container;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [authRepositoryProvider.overrideWithValue(repository)],
          child: Builder(
            builder: (context) {
              container = ProviderScope.containerOf(context);
              return MaterialApp(
                locale: const Locale('fr'),
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const SizedBox(),
              );
            },
          ),
        ),
      );

      final notifier = container.read(resetPasswordProvider.notifier);
      notifier.updateEmail('user@lucy.test');

      await notifier.submitReset(tester.element(find.byType(SizedBox)));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      final state = container.read(resetPasswordProvider);
      expect(state.view, ResetPasswordView.form);
      expect(find.textContaining('réseau'), findsOneWidget);
    });

    test('successful reset shows success view', () async {
      final repository = FakeAuthRepository(null);
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(resetPasswordProvider.notifier);
      notifier.updateEmail('user@lucy.test');

      await notifier.submitReset(_UnmountedContext());

      final state = container.read(resetPasswordProvider);
      expect(state.view, ResetPasswordView.success);
      expect(state.submittedEmail, 'user@lucy.test');
    });

    test('tryAgain returns to form', () async {
      final repository = FakeAuthRepository(null);
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);

      final notifier = container.read(resetPasswordProvider.notifier);
      notifier.updateEmail('user@lucy.test');
      await notifier.submitReset(_UnmountedContext());
      notifier.tryAgain();

      final state = container.read(resetPasswordProvider);
      expect(state.view, ResetPasswordView.form);
      expect(state.submittedEmail, isNull);
    });
  });
}

class _UnmountedContext extends Fake implements BuildContext {
  @override
  bool get mounted => false;
}
