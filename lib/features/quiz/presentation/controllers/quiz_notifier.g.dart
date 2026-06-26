// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QuizNotifier)
const quizProvider = QuizNotifierProvider._();

final class QuizNotifierProvider
    extends $NotifierProvider<QuizNotifier, QuizState> {
  const QuizNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizNotifierHash();

  @$internal
  @override
  QuizNotifier create() => QuizNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizState>(value),
    );
  }
}

String _$quizNotifierHash() => r'85f69080d424f7f6b831f35d432a8fd27f0f6e32';

abstract class _$QuizNotifier extends $Notifier<QuizState> {
  QuizState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<QuizState, QuizState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QuizState, QuizState>,
              QuizState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
