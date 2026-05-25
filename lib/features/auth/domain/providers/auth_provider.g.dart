// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Domain-facing [AuthRepository] provider (delegates to data layer).

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

/// Domain-facing [AuthRepository] provider (delegates to data layer).

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Domain-facing [AuthRepository] provider (delegates to data layer).
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'0ac7afd23e78039a77b2dc93f60280c146d9405e';

/// [AuthService] provider — sole entry to auth repository from presentation.

@ProviderFor(authService)
const authServiceProvider = AuthServiceProvider._();

/// [AuthService] provider — sole entry to auth repository from presentation.

final class AuthServiceProvider
    extends $FunctionalProvider<AuthService, AuthService, AuthService>
    with $Provider<AuthService> {
  /// [AuthService] provider — sole entry to auth repository from presentation.
  const AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<AuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthService>(value),
    );
  }
}

String _$authServiceHash() => r'ec1c353979766b3e25eff6e74db885d1e623d14c';

/// Firebase auth session stream for router guard and UI.

@ProviderFor(authStateChanges)
const authStateChangesProvider = AuthStateChangesProvider._();

/// Firebase auth session stream for router guard and UI.

final class AuthStateChangesProvider
    extends
        $FunctionalProvider<AsyncValue<AuthUser?>, AuthUser?, Stream<AuthUser?>>
    with $FutureModifier<AuthUser?>, $StreamProvider<AuthUser?> {
  /// Firebase auth session stream for router guard and UI.
  const AuthStateChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateChangesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateChangesHash();

  @$internal
  @override
  $StreamProviderElement<AuthUser?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<AuthUser?> create(Ref ref) {
    return authStateChanges(ref);
  }
}

String _$authStateChangesHash() => r'f31b96c0a82f4d470bb12831dc2f74e3b99fe1d5';

/// Auth + `isConfigured` for routing; recomputes when [authStateChanges] updates.

@ProviderFor(authBootstrap)
const authBootstrapProvider = AuthBootstrapProvider._();

/// Auth + `isConfigured` for routing; recomputes when [authStateChanges] updates.

final class AuthBootstrapProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthBootstrapResult>,
          AuthBootstrapResult,
          FutureOr<AuthBootstrapResult>
        >
    with
        $FutureModifier<AuthBootstrapResult>,
        $FutureProvider<AuthBootstrapResult> {
  /// Auth + `isConfigured` for routing; recomputes when [authStateChanges] updates.
  const AuthBootstrapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authBootstrapProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authBootstrapHash();

  @$internal
  @override
  $FutureProviderElement<AuthBootstrapResult> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthBootstrapResult> create(Ref ref) {
    return authBootstrap(ref);
  }
}

String _$authBootstrapHash() => r'98ddc70f53fef9650ce2de29d9b4d113322cd280';
