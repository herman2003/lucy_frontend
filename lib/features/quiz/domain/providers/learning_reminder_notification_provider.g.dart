// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_reminder_notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningReminderNotificationClient)
const learningReminderNotificationClientProvider =
    LearningReminderNotificationClientProvider._();

final class LearningReminderNotificationClientProvider
    extends
        $FunctionalProvider<
          LearningReminderNotificationClient,
          LearningReminderNotificationClient,
          LearningReminderNotificationClient
        >
    with $Provider<LearningReminderNotificationClient> {
  const LearningReminderNotificationClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningReminderNotificationClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$learningReminderNotificationClientHash();

  @$internal
  @override
  $ProviderElement<LearningReminderNotificationClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningReminderNotificationClient create(Ref ref) {
    return learningReminderNotificationClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningReminderNotificationClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningReminderNotificationClient>(
        value,
      ),
    );
  }
}

String _$learningReminderNotificationClientHash() =>
    r'dd7447c84ff1f0e6fb82bba4e62906c762060b26';

@ProviderFor(learningReminderNotificationService)
const learningReminderNotificationServiceProvider =
    LearningReminderNotificationServiceProvider._();

final class LearningReminderNotificationServiceProvider
    extends
        $FunctionalProvider<
          LearningReminderNotificationService,
          LearningReminderNotificationService,
          LearningReminderNotificationService
        >
    with $Provider<LearningReminderNotificationService> {
  const LearningReminderNotificationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningReminderNotificationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$learningReminderNotificationServiceHash();

  @$internal
  @override
  $ProviderElement<LearningReminderNotificationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningReminderNotificationService create(Ref ref) {
    return learningReminderNotificationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningReminderNotificationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningReminderNotificationService>(
        value,
      ),
    );
  }
}

String _$learningReminderNotificationServiceHash() =>
    r'03bc144c6d414dbf1a529f915a6fab9c8f75cee3';

/// Re-schedules the daily local reminder when locale or quiz library changes.

@ProviderFor(learningReminderNotificationSyncListener)
const learningReminderNotificationSyncListenerProvider =
    LearningReminderNotificationSyncListenerProvider._();

/// Re-schedules the daily local reminder when locale or quiz library changes.

final class LearningReminderNotificationSyncListenerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// Re-schedules the daily local reminder when locale or quiz library changes.
  const LearningReminderNotificationSyncListenerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningReminderNotificationSyncListenerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$learningReminderNotificationSyncListenerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return learningReminderNotificationSyncListener(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$learningReminderNotificationSyncListenerHash() =>
    r'8882d4b945154677342f4116b078f19d8682d87b';
