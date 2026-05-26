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

  group('onboarding router guards (F03/F07)', () {
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

    test('authenticated configured: onboarding redirects to documents', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapConfigured,
          sessionUser: user,
          location: LucyRoutePaths.onboarding,
        ),
        LucyRoutePaths.documents,
      );
    });

    test('authenticated configured: confirm redirects to documents', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapConfigured,
          sessionUser: user,
          location: LucyRoutePaths.onboardingConfirm,
        ),
        LucyRoutePaths.documents,
      );
    });

    test('authenticated not configured: confirm page allowed', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapNotConfigured,
          sessionUser: user,
          location: LucyRoutePaths.onboardingConfirm,
        ),
        isNull,
      );
    });

    test('authenticated configured: splash redirects to documents', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapConfigured,
          sessionUser: user,
          location: LucyRoutePaths.splash,
        ),
        LucyRoutePaths.documents,
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

    test('unauthenticated user cannot access onboarding confirm', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(AuthBootstrapResult()),
          sessionUser: null,
          location: LucyRoutePaths.onboardingConfirm,
        ),
        LucyRoutePaths.login,
      );
    });

    test('bootstrap loading keeps splash', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncLoading<AuthBootstrapResult>(),
          sessionUser: user,
          location: LucyRoutePaths.splash,
        ),
        isNull,
      );
    });

    test('bootstrap loading redirects away from home', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncLoading<AuthBootstrapResult>(),
          sessionUser: user,
          location: LucyRoutePaths.home,
        ),
        LucyRoutePaths.splash,
      );
    });

    test('authenticated not configured: documents redirects to onboarding', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapNotConfigured,
          sessionUser: user,
          location: LucyRoutePaths.documents,
        ),
        LucyRoutePaths.onboarding,
      );
    });

    test('configured user on login redirects to documents', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: bootstrapConfigured,
          sessionUser: user,
          location: LucyRoutePaths.login,
        ),
        LucyRoutePaths.documents,
      );
    });
  });
}
