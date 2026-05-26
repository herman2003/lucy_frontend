import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/core/router/lucy_router_guards.dart';
import 'package:frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';

void main() {
  const user = AuthUser(uid: 'uid', email: 'a@lucy.test');
  const configured = AsyncData(
    AuthBootstrapResult(user: user, isConfigured: true),
  );

  group('LucyRouterGuards.resolveRedirect', () {
    test('keeps splash while bootstrap is loading', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncLoading(),
          location: LucyRoutePaths.splash,
        ),
        isNull,
      );
    });

    test('forces splash when bootstrap is loading on other routes', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncLoading(),
          location: LucyRoutePaths.login,
        ),
        LucyRoutePaths.splash,
      );
    });

    test('sends unauthenticated user from splash to login', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(AuthBootstrapResult()),
          sessionUser: null,
          location: LucyRoutePaths.splash,
        ),
        LucyRoutePaths.login,
      );
    });

    test('blocks /home when not logged in after bootstrap', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(AuthBootstrapResult()),
          sessionUser: null,
          location: LucyRoutePaths.home,
        ),
        LucyRoutePaths.login,
      );
    });

    test('sends configured user from login to documents', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: configured,
          sessionUser: user,
          location: LucyRoutePaths.login,
        ),
        LucyRoutePaths.documents,
      );
    });

    test('sends configured user from splash to documents', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: configured,
          sessionUser: user,
          location: LucyRoutePaths.splash,
        ),
        LucyRoutePaths.documents,
      );
    });

    test('redirects /home to documents when configured', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: configured,
          sessionUser: user,
          location: LucyRoutePaths.home,
        ),
        LucyRoutePaths.documents,
      );
    });

    test('blocks shell when not logged in', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(AuthBootstrapResult()),
          sessionUser: null,
          location: LucyRoutePaths.documents,
        ),
        LucyRoutePaths.login,
      );
    });
  });
}
