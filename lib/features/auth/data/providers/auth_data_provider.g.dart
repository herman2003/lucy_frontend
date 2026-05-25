// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Wires Firebase SDKs to [AuthRepositoryImpl] (data layer only).

@ProviderFor(authRepositoryImpl)
const authRepositoryImplProvider = AuthRepositoryImplProvider._();

/// Wires Firebase SDKs to [AuthRepositoryImpl] (data layer only).

final class AuthRepositoryImplProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Wires Firebase SDKs to [AuthRepositoryImpl] (data layer only).
  const AuthRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryImplHash() =>
    r'62b9e089e6864e9493cea16412ca8fc05528ee6a';
