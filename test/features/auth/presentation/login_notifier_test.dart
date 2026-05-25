import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/auth/domain/exceptions/auth_exception.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/controllers/login_notifier.dart';
import 'package:frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../helpers/fake_auth_repository.dart';
import '../helpers/throwing_auth_repository.dart';

void main() {
  group('LoginNotifier', () {
    tearDown(LucySnackBar.hideAll);

    testWidgets('submitLogin shows snackbar on AuthException', (tester) async {
      final repository = ThrowingAuthRepository(
        const AuthException(code: 'user-not-found'),
      );
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

      final notifier = container.read(loginProvider.notifier);
      notifier.updateEmail('missing@lucy.test');
      notifier.updatePassword('secret12');

      await notifier.submitLogin(tester.element(find.byType(SizedBox)));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      final state = container.read(loginProvider);
      expect(state.isLoading, isFalse);
      expect(find.textContaining('Aucun compte'), findsOneWidget);
    });

    test('submitLogin signs in via AuthService', () async {
      final repository = FakeAuthRepository(null);
      final container = ProviderContainer(
        overrides: [authRepositoryProvider.overrideWithValue(repository)],
      );
      addTearDown(container.dispose);

      final service = container.read(authServiceProvider);
      final user = await service.loginWithEmail(
        email: 'user@lucy.test',
        password: 'password1',
      );

      expect(user.email, 'user@lucy.test');
      expect(repository.currentUser?.email, 'user@lucy.test');
    });
  });
}
