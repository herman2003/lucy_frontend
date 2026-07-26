// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_reminder_push_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fcmTokenClient)
const fcmTokenClientProvider = FcmTokenClientProvider._();

final class FcmTokenClientProvider
    extends $FunctionalProvider<FcmTokenClient, FcmTokenClient, FcmTokenClient>
    with $Provider<FcmTokenClient> {
  const FcmTokenClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmTokenClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmTokenClientHash();

  @$internal
  @override
  $ProviderElement<FcmTokenClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FcmTokenClient create(Ref ref) {
    return fcmTokenClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FcmTokenClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FcmTokenClient>(value),
    );
  }
}

String _$fcmTokenClientHash() => r'9f2ab12a445a032fdd7f8b8f0383e0724e584634';

@ProviderFor(revisionReminderPushApiRemoteDataSource)
const revisionReminderPushApiRemoteDataSourceProvider =
    RevisionReminderPushApiRemoteDataSourceProvider._();

final class RevisionReminderPushApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RevisionReminderPushApiRemoteDataSource,
          RevisionReminderPushApiRemoteDataSource,
          RevisionReminderPushApiRemoteDataSource
        >
    with $Provider<RevisionReminderPushApiRemoteDataSource> {
  const RevisionReminderPushApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revisionReminderPushApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$revisionReminderPushApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RevisionReminderPushApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RevisionReminderPushApiRemoteDataSource create(Ref ref) {
    return revisionReminderPushApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevisionReminderPushApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<RevisionReminderPushApiRemoteDataSource>(value),
    );
  }
}

String _$revisionReminderPushApiRemoteDataSourceHash() =>
    r'6e2d02eac0d78215c607429c0159f7c64f759096';

@ProviderFor(revisionReminderPushSyncService)
const revisionReminderPushSyncServiceProvider =
    RevisionReminderPushSyncServiceProvider._();

final class RevisionReminderPushSyncServiceProvider
    extends
        $FunctionalProvider<
          RevisionReminderPushSyncService,
          RevisionReminderPushSyncService,
          RevisionReminderPushSyncService
        >
    with $Provider<RevisionReminderPushSyncService> {
  const RevisionReminderPushSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revisionReminderPushSyncServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revisionReminderPushSyncServiceHash();

  @$internal
  @override
  $ProviderElement<RevisionReminderPushSyncService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RevisionReminderPushSyncService create(Ref ref) {
    return revisionReminderPushSyncService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevisionReminderPushSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RevisionReminderPushSyncService>(
        value,
      ),
    );
  }
}

String _$revisionReminderPushSyncServiceHash() =>
    r'b06d3320ecb6fb45e91f275a9819a71b3415b075';
