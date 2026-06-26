// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_learning_reminder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resolves the highest-priority in-app learning reminder (LEARN-12a-2).

@ProviderFor(primaryLearningReminder)
const primaryLearningReminderProvider = PrimaryLearningReminderProvider._();

/// Resolves the highest-priority in-app learning reminder (LEARN-12a-2).

final class PrimaryLearningReminderProvider
    extends
        $FunctionalProvider<
          AsyncValue<LearningReminder?>,
          LearningReminder?,
          FutureOr<LearningReminder?>
        >
    with
        $FutureModifier<LearningReminder?>,
        $FutureProvider<LearningReminder?> {
  /// Resolves the highest-priority in-app learning reminder (LEARN-12a-2).
  const PrimaryLearningReminderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'primaryLearningReminderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$primaryLearningReminderHash();

  @$internal
  @override
  $FutureProviderElement<LearningReminder?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LearningReminder?> create(Ref ref) {
    return primaryLearningReminder(ref);
  }
}

String _$primaryLearningReminderHash() =>
    r'886b2e1094046805b4f40e30bb2becd27a433c5c';
