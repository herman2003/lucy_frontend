// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Wires Firebase Auth + Nest profile API to [AuthRepositoryImpl].

@ProviderFor(authRepositoryImpl)
const authRepositoryImplProvider = AuthRepositoryImplProvider._();

/// Wires Firebase Auth + Nest profile API to [AuthRepositoryImpl].

final class AuthRepositoryImplProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Wires Firebase Auth + Nest profile API to [AuthRepositoryImpl].
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
    r'1a201e72eb8ce0ea943c0fa3d5994b871f2adfb6';
