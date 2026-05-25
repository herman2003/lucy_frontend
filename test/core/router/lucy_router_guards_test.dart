import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/core/router/lucy_router_guards.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const user = AuthUser(uid: 'uid', email: 'a@lucy.test');

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

    test('blocks /home when not logged in after bootstrap', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(null),
          location: LucyRoutePaths.home,
        ),
        LucyRoutePaths.login,
      );
    });

    test('sends authenticated user from login to home', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(user),
          location: LucyRoutePaths.login,
        ),
        LucyRoutePaths.home,
      );
    });

    test('sends authenticated user from splash to home', () {
      expect(
        LucyRouterGuards.resolveRedirect(
          bootstrap: const AsyncData(user),
          location: LucyRoutePaths.splash,
        ),
        LucyRoutePaths.home,
      );
    });
  });
}
