// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_attempt_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizAttemptService)
const quizAttemptServiceProvider = QuizAttemptServiceProvider._();

final class QuizAttemptServiceProvider
    extends
        $FunctionalProvider<
          QuizAttemptService,
          QuizAttemptService,
          QuizAttemptService
        >
    with $Provider<QuizAttemptService> {
  const QuizAttemptServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizAttemptServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizAttemptServiceHash();

  @$internal
  @override
  $ProviderElement<QuizAttemptService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QuizAttemptService create(Ref ref) {
    return quizAttemptService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizAttemptService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizAttemptService>(value),
    );
  }
}

String _$quizAttemptServiceHash() =>
    r'3bed21e64442f3fb10d12e356c6c145b82cbd048';
