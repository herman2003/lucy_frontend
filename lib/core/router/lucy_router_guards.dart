import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/auth_user.dart';
import '../../features/auth/domain/providers/auth_provider.dart'
    show authBootstrapProvider, authRepositoryProvider;
import 'lucy_route_paths.dart';

/// Authentication redirects for [GoRouter] (SPEC §6.1, Q14).
class LucyRouterGuards {
  LucyRouterGuards._();

  static const Set<String> _publicAuthPaths = {
    LucyRoutePaths.login,
    LucyRoutePaths.signup,
    LucyRoutePaths.resetPassword,
  };

  /// Pure redirect rules (testable without [GoRouterState]).
  static String? resolveRedirect({
    required AsyncValue<AuthUser?> bootstrap,
    AuthUser? sessionUser,
    required String location,
  }) {
    if (bootstrap.isLoading) {
      return location == LucyRoutePaths.splash ? null : LucyRoutePaths.splash;
    }

    final isLoggedIn = sessionUser != null;

    if (location == LucyRoutePaths.splash) {
      return isLoggedIn ? LucyRoutePaths.home : LucyRoutePaths.login;
    }

    if (isLoggedIn && _publicAuthPaths.contains(location)) {
      return LucyRoutePaths.home;
    }

    if (!isLoggedIn && location == LucyRoutePaths.home) {
      return LucyRoutePaths.login;
    }

    return null;
  }

  /// Resolves redirect from bootstrap state and current session.
  static String? redirect(BuildContext context, GoRouterState state) {
    final container = ProviderScope.containerOf(context);
    final bootstrap = container.read(authBootstrapProvider);
    final sessionUser = bootstrap.isLoading
        ? null
        : container.read(authRepositoryProvider).currentUser;
    return resolveRedirect(
      bootstrap: bootstrap,
      sessionUser: sessionUser,
      location: state.matchedLocation,
    );
  }
}
