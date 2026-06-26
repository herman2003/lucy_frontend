// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_reminder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningReminderService)
const learningReminderServiceProvider = LearningReminderServiceProvider._();

final class LearningReminderServiceProvider
    extends
        $FunctionalProvider<
          LearningReminderService,
          LearningReminderService,
          LearningReminderService
        >
    with $Provider<LearningReminderService> {
  const LearningReminderServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningReminderServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningReminderServiceHash();

  @$internal
  @override
  $ProviderElement<LearningReminderService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningReminderService create(Ref ref) {
    return learningReminderService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningReminderService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningReminderService>(value),
    );
  }
}

String _$learningReminderServiceHash() =>
    r'2a476bbd641911ff8a5a0131b91ad78fe6357009';
