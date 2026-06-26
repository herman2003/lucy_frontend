// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_reminder_prefs_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LearningReminderPrefsNotifier)
const learningReminderPrefsProvider = LearningReminderPrefsNotifierProvider._();

final class LearningReminderPrefsNotifierProvider
    extends
        $AsyncNotifierProvider<
          LearningReminderPrefsNotifier,
          LearningReminderPrefs
        > {
  const LearningReminderPrefsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningReminderPrefsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningReminderPrefsNotifierHash();

  @$internal
  @override
  LearningReminderPrefsNotifier create() => LearningReminderPrefsNotifier();
}

String _$learningReminderPrefsNotifierHash() =>
    r'd82c211e04ba4b18bc62c7c46dd3f4074115f2ef';

abstract class _$LearningReminderPrefsNotifier
    extends $AsyncNotifier<LearningReminderPrefs> {
  FutureOr<LearningReminderPrefs> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<LearningReminderPrefs>, LearningReminderPrefs>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<LearningReminderPrefs>,
                LearningReminderPrefs
              >,
              AsyncValue<LearningReminderPrefs>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
