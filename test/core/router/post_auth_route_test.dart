import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/core/router/post_auth_route.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';

import '../../features/auth/helpers/fake_auth_repository.dart';

void main() {
  test('returns onboarding when user is not configured', () async {
    final repository = FakeAuthRepository(
      const AuthUser(uid: 'u1', email: 'a@b.c'),
      isConfigured: false,
    );
    final container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);

    final route = await PostAuthRoute.resolveFromRepository(repository);

    expect(route, LucyRoutePaths.onboarding);
  });

  test('returns home when user is configured', () async {
    final repository = FakeAuthRepository(
      const AuthUser(uid: 'u1', email: 'a@b.c'),
      isConfigured: true,
    );
    final container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(container.dispose);

    final route = await PostAuthRoute.resolveFromRepository(repository);

    expect(route, LucyRoutePaths.home);
  });
}
