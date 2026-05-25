import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/controllers/sign_up_notifier.dart';
import 'package:frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../helpers/fake_auth_repository.dart';

void main() {
  group('SignUpNotifier', () {
    tearDown(LucySnackBar.hideAll);

    testWidgets('submitSignUp shows snackbar on profile-write-failed', (
      tester,
    ) async {
      final repository = FakeAuthRepository(null)..failProfileWrite = true;
      late ProviderContainer container;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(repository),
          ],
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

      final notifier = container.read(signUpProvider.notifier);
      notifier.updateFullName('Lucy User');
      notifier.updateEmail('new@lucy.test');
      notifier.updatePassword('password1');

      await notifier.submitSignUp(tester.element(find.byType(SizedBox)));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      final state = container.read(signUpProvider);
      expect(state.isLoading, isFalse);
      expect(find.textContaining('profil'), findsOneWidget);
      expect(repository.currentUser, isNull);
    });

    test('submitSignUp creates user when profile write succeeds', () async {
      final repository = FakeAuthRepository(null);
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(signUpProvider.notifier);
      notifier.updateFullName('Lucy User');
      notifier.updateEmail('new@lucy.test');
      notifier.updatePassword('password1');

      await notifier.submitSignUp(
        _UnmountedContext(),
      );

      expect(repository.currentUser?.email, 'new@lucy.test');
      expect(repository.currentUser?.displayName, 'Lucy User');
    });
  });
}

class _UnmountedContext extends Fake implements BuildContext {
  @override
  bool get mounted => false;
}
