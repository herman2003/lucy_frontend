import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/domain/providers/auth_provider.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import 'lucy_route_paths.dart';

/// Resolves the route after signup/login from Firestore `isConfigured` (SPEC §4.7 F07b).
abstract final class PostAuthRoute {
  static Future<String> resolve(Ref ref) async {
    ref.invalidate(authBootstrapProvider);
    return resolveFromRepository(ref.read(authRepositoryProvider));
  }

  static Future<String> resolveFromRepository(AuthRepository repository) async {
    final isConfigured = await repository.fetchIsConfiguredForCurrentUser();
    return isConfigured
        ? LucyRoutePaths.shellDefault
        : LucyRoutePaths.onboarding;
  }
}
