// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Application [GoRouter] with auth bootstrap and session guard.

@ProviderFor(lucyRouter)
const lucyRouterProvider = LucyRouterProvider._();

/// Application [GoRouter] with auth bootstrap and session guard.

final class LucyRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Application [GoRouter] with auth bootstrap and session guard.
  const LucyRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return lucyRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$lucyRouterHash() => r'b6dc241e94ff75559850987a538c90b465900f12';
