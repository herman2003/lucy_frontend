// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_reminder_prefs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningReminderPrefsService)
const learningReminderPrefsServiceProvider =
    LearningReminderPrefsServiceProvider._();

final class LearningReminderPrefsServiceProvider
    extends
        $FunctionalProvider<
          LearningReminderPrefsService,
          LearningReminderPrefsService,
          LearningReminderPrefsService
        >
    with $Provider<LearningReminderPrefsService> {
  const LearningReminderPrefsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningReminderPrefsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningReminderPrefsServiceHash();

  @$internal
  @override
  $ProviderElement<LearningReminderPrefsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningReminderPrefsService create(Ref ref) {
    return learningReminderPrefsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningReminderPrefsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningReminderPrefsService>(value),
    );
  }
}

String _$learningReminderPrefsServiceHash() =>
    r'2f1ec2e54888d6de4d3c04a0710210ed62707067';
