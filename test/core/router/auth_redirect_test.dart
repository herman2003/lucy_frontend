import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/features/documents/presentation/pages/documents_page.dart';
import 'package:frontend/features/auth/presentation/pages/login/login_page.dart';
import 'package:frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import '../../features/auth/helpers/fake_auth_repository.dart';

void main() {
  const testUser = AuthUser(uid: 'uid-1', email: 'user@lucy.test');

  group('Auth redirect (T06)', () {
    testWidgets(
      'authenticated user reaches documents shell after bootstrap',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authRepositoryProvider.overrideWithValue(
                FakeAuthRepository(testUser, isConfigured: true),
              ),
              authBootstrapProvider.overrideWith(
                (ref) async => const AuthBootstrapResult(
                  user: testUser,
                  isConfigured: true,
                ),
              ),
              authStateChangesProvider.overrideWith(
                (ref) => Stream.value(testUser),
              ),
            ],
            child: const LucyApp(),
          ),
        );

        await tester.pump();
        expect(find.byType(LoginPage), findsNothing);

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(DocumentsPage), findsOneWidget);
        expect(find.byType(LoginPage), findsNothing);
      },
    );

    testWidgets('unauthenticated user is redirected away from home', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authRepositoryProvider.overrideWithValue(
              FakeAuthRepository(null),
            ),
            authBootstrapProvider.overrideWith(
              (ref) async => const AuthBootstrapResult(),
            ),
            authStateChangesProvider.overrideWith(
              (ref) => Stream.value(null),
            ),
          ],
          child: const LucyApp(),
        ),
      );

      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(DocumentsPage), findsNothing);
    });
  });
}
