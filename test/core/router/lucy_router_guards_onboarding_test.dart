import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/core/router/lucy_router_guards.dart';
import 'package:frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';

void main() {
  const user = AuthUser(uid: 'uid', email: 'a@lucy.test');
  const bootstrapConfigured = AsyncData(
    AuthBootstrapResult(user: user, isConfigured: true),
  );
  const bootstrapNotConfigured = AsyncData(
    AuthBootstrapResult(user: user, isConfigured: false),
  );

  group('LucyRouterGuards onboarding (F03)', () {
    test('authenticated not configured: login redirects to onboarding', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapNotConfigured,
          sessionUser: user,
          location: LucyRoutePaths.login,
        ),
        LucyRoutePaths.onboarding,
      );
    });

    test('authenticated not configured: home redirects to onboarding', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapNotConfigured,
          sessionUser: user,
          location: LucyRoutePaths.home,
        ),
        LucyRoutePaths.onboarding,
      );
    });

    test('authenticated configured: onboarding redirects to home', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapConfigured,
          sessionUser: user,
          location: LucyRoutePaths.onboarding,
        ),
        LucyRoutePaths.home,
      );
    });

    test('authenticated configured: splash redirects to home', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapConfigured,
          sessionUser: user,
          location: LucyRoutePaths.splash,
        ),
        LucyRoutePaths.home,
      );
    });

    test('authenticated not configured: splash redirects to onboarding', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapNotConfigured,
          sessionUser: user,
          location: LucyRoutePaths.splash,
        ),
        LucyRoutePaths.onboarding,
      );
    });

    test('unauthenticated user cannot access onboarding', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(AuthBootstrapResult()),
          sessionUser: null,
          location: LucyRoutePaths.onboarding,
        ),
        LucyRoutePaths.login,
      );
    });
  });
}
