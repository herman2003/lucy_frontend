// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lucyDioClient)
const lucyDioClientProvider = LucyDioClientProvider._();

final class LucyDioClientProvider
    extends $FunctionalProvider<LucyDioClient, LucyDioClient, LucyDioClient>
    with $Provider<LucyDioClient> {
  const LucyDioClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyDioClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyDioClientHash();

  @$internal
  @override
  $ProviderElement<LucyDioClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LucyDioClient create(Ref ref) {
    return lucyDioClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LucyDioClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LucyDioClient>(value),
    );
  }
}

String _$lucyDioClientHash() => r'ecbcea88f7520999b1f94a9f86a1256ad064852b';

@ProviderFor(onboardingValidateRemoteDataSource)
const onboardingValidateRemoteDataSourceProvider =
    OnboardingValidateRemoteDataSourceProvider._();

final class OnboardingValidateRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          OnboardingValidateRemoteDataSource,
          OnboardingValidateRemoteDataSource,
          OnboardingValidateRemoteDataSource
        >
    with $Provider<OnboardingValidateRemoteDataSource> {
  const OnboardingValidateRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingValidateRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$onboardingValidateRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<OnboardingValidateRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingValidateRemoteDataSource create(Ref ref) {
    return onboardingValidateRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingValidateRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingValidateRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$onboardingValidateRemoteDataSourceHash() =>
    r'934192cd04cccff204cbd64aca2439fc60a0b091';

@ProviderFor(onboardingRepositoryImpl)
const onboardingRepositoryImplProvider = OnboardingRepositoryImplProvider._();

final class OnboardingRepositoryImplProvider
    extends
        $FunctionalProvider<
          OnboardingRepository,
          OnboardingRepository,
          OnboardingRepository
        >
    with $Provider<OnboardingRepository> {
  const OnboardingRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<OnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRepository create(Ref ref) {
    return onboardingRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRepository>(value),
    );
  }
}

String _$onboardingRepositoryImplHash() =>
    r'bdf4a027e148320ebaf42f52fe85618ade168bf8';
