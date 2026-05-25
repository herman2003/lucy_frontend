import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';
import 'package:frontend/core/presentation/pages/home_placeholder_page.dart';
import 'package:frontend/core/presentation/pages/login_placeholder_page.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import '../../features/auth/helpers/fake_auth_repository.dart';

void main() {
  const testUser = AuthUser(uid: 'uid-1', email: 'user@lucy.test');

  group('Auth redirect (T06)', () {
    testWidgets(
      'authenticated user reaches home after bootstrap without login flash',
      (tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authRepositoryProvider.overrideWithValue(
                FakeAuthRepository(testUser),
              ),
              authBootstrapProvider.overrideWith((ref) async => testUser),
              authStateChangesProvider.overrideWith(
                (ref) => Stream.value(testUser),
              ),
            ],
            child: const LucyApp(),
          ),
        );

        await tester.pump();
        expect(find.byType(LoginPlaceholderPage), findsNothing);

        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.byType(HomePlaceholderPage), findsOneWidget);
        expect(find.byType(LoginPlaceholderPage), findsNothing);
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
            authBootstrapProvider.overrideWith((ref) async => null),
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

      expect(find.byType(LoginPlaceholderPage), findsOneWidget);
      expect(find.byType(HomePlaceholderPage), findsNothing);
    });
  });
}
