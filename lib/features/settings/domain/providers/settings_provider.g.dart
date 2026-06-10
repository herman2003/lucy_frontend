// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsApiRemoteDataSource)
const settingsApiRemoteDataSourceProvider =
    SettingsApiRemoteDataSourceProvider._();

final class SettingsApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SettingsApiRemoteDataSource,
          SettingsApiRemoteDataSource,
          SettingsApiRemoteDataSource
        >
    with $Provider<SettingsApiRemoteDataSource> {
  const SettingsApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SettingsApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsApiRemoteDataSource create(Ref ref) {
    return settingsApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsApiRemoteDataSource>(value),
    );
  }
}

String _$settingsApiRemoteDataSourceHash() =>
    r'1f863ba16abf3549d8204d18473f90afa01fbe53';

@ProviderFor(settingsRepository)
const settingsRepositoryProvider = SettingsRepositoryProvider._();

final class SettingsRepositoryProvider
    extends
        $FunctionalProvider<
          SettingsRepository,
          SettingsRepository,
          SettingsRepository
        >
    with $Provider<SettingsRepository> {
  const SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() =>
    r'64af9f3615e89e8ef839196f2c87b95ab1ee2573';

@ProviderFor(settingsService)
const settingsServiceProvider = SettingsServiceProvider._();

final class SettingsServiceProvider
    extends
        $FunctionalProvider<SettingsService, SettingsService, SettingsService>
    with $Provider<SettingsService> {
  const SettingsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsServiceHash();

  @$internal
  @override
  $ProviderElement<SettingsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsService create(Ref ref) {
    return settingsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsService>(value),
    );
  }
}

String _$settingsServiceHash() => r'1256646e54343497b554c6d4b193fc4ecb2dcaa2';
