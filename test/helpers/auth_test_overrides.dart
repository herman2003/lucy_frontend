import 'dart:async';

import 'package:frontend/features/auth/data/providers/auth_data_provider.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import '../features/auth/helpers/fake_auth_repository.dart';

/// Keeps the app on splash during widget tests (bootstrap never completes).
// ignore: strict_top_level_inference
splashBootstrapOverrides() {
  final repository = FakeAuthRepository(null);

  return [
    authRepositoryImplProvider.overrideWith((ref) => repository),
    authRepositoryProvider.overrideWith((ref) => repository),
    authBootstrapProvider.overrideWith(
      (ref) => Completer<AuthUser?>().future,
    ),
    authStateChangesProvider.overrideWith(
      (ref) => const Stream<AuthUser?>.empty(),
    ),
  ];
}
