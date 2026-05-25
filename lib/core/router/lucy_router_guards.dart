import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/auth_bootstrap_result.dart';
import '../../features/auth/domain/entities/auth_user.dart';
import '../../features/auth/domain/providers/auth_provider.dart'
    show authBootstrapProvider, authRepositoryProvider;
import 'lucy_route_paths.dart';

/// Authentication and onboarding redirects for [GoRouter] (SPEC §3, §4.7).
class LucyRouterGuards {
  LucyRouterGuards._();

  static const Set<String> _publicAuthPaths = {
    LucyRoutePaths.login,
    LucyRoutePaths.signup,
    LucyRoutePaths.resetPassword,
  };

  static bool _isOnboardingPath(String location) {
    return location == LucyRoutePaths.onboarding ||
        location == LucyRoutePaths.onboardingConfirm;
  }

  /// Pure redirect rules (testable without [GoRouterState]).
  static String? resolveRedirect({
    required AsyncValue<AuthBootstrapResult> bootstrap,
    AuthUser? sessionUser,
    required String location,
  }) {
    if (bootstrap.isLoading) {
      return location == LucyRoutePaths.splash ? null : LucyRoutePaths.splash;
    }

    final result = bootstrap.value;
    final user = result?.user ?? sessionUser;
    final isConfigured = result?.isConfigured ?? false;

    if (user == null) {
      if (location == LucyRoutePaths.splash) {
        return LucyRoutePaths.login;
      }
      if (_isOnboardingPath(location)) {
        return LucyRoutePaths.login;
      }
      if (location == LucyRoutePaths.home) {
        return LucyRoutePaths.login;
      }
      return null;
    }

    if (location == LucyRoutePaths.splash) {
      return isConfigured ? LucyRoutePaths.home : LucyRoutePaths.onboarding;
    }

    if (!isConfigured) {
      if (_isOnboardingPath(location)) {
        return null;
      }
      if (location == LucyRoutePaths.home || _publicAuthPaths.contains(location)) {
        return LucyRoutePaths.onboarding;
      }
      return null;
    }

    if (_isOnboardingPath(location)) {
      return LucyRoutePaths.home;
    }

    if (_publicAuthPaths.contains(location)) {
      return LucyRoutePaths.home;
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
