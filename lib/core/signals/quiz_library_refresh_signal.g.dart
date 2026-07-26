// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_library_refresh_signal.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bumps when the quiz library should reload sessions (chat generation, tab focus).

@ProviderFor(QuizLibraryRefreshSignal)
const quizLibraryRefreshSignalProvider = QuizLibraryRefreshSignalProvider._();

/// Bumps when the quiz library should reload sessions (chat generation, tab focus).
final class QuizLibraryRefreshSignalProvider
    extends $NotifierProvider<QuizLibraryRefreshSignal, int> {
  /// Bumps when the quiz library should reload sessions (chat generation, tab focus).
  const QuizLibraryRefreshSignalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizLibraryRefreshSignalProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizLibraryRefreshSignalHash();

  @$internal
  @override
  QuizLibraryRefreshSignal create() => QuizLibraryRefreshSignal();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$quizLibraryRefreshSignalHash() =>
    r'eb0a90d35b5f48cf246f51ca92085c2037f05eb4';

/// Bumps when the quiz library should reload sessions (chat generation, tab focus).

abstract class _$QuizLibraryRefreshSignal extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
