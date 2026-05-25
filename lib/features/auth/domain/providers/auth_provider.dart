import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/auth_data_provider.dart';
import '../../services/auth_service.dart';
import '../entities/auth_bootstrap_result.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

part 'auth_provider.g.dart';

/// Domain-facing [AuthRepository] provider (delegates to data layer).
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return ref.watch(authRepositoryImplProvider);
}

/// [AuthService] provider — sole entry to auth repository from presentation.
@Riverpod(keepAlive: true)
AuthService authService(Ref ref) {
  return AuthService(repository: ref.watch(authRepositoryProvider));
}

/// Firebase auth session stream for router guard and UI.
@Riverpod(keepAlive: true)
Stream<AuthUser?> authStateChanges(Ref ref) {
  return ref.watch(authServiceProvider).authStateChanges();
}

/// Auth + `isConfigured` for routing; recomputes when [authStateChanges] updates.
@Riverpod(keepAlive: true)
Future<AuthBootstrapResult> authBootstrap(Ref ref) async {
  ref.watch(authStateChangesProvider);

  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    return const AuthBootstrapResult();
  }
  final isConfigured = await ref
      .read(authRepositoryProvider)
      .fetchIsConfiguredForCurrentUser();
  return AuthBootstrapResult(user: user, isConfigured: isConfigured);
}
