// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizRepository)
const quizRepositoryProvider = QuizRepositoryProvider._();

final class QuizRepositoryProvider
    extends $FunctionalProvider<QuizRepository, QuizRepository, QuizRepository>
    with $Provider<QuizRepository> {
  const QuizRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizRepositoryHash();

  @$internal
  @override
  $ProviderElement<QuizRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizRepository create(Ref ref) {
    return quizRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizRepository>(value),
    );
  }
}

String _$quizRepositoryHash() => r'b37be1b19d123980cd8cd5b5499b878d2664e767';

@ProviderFor(quizService)
const quizServiceProvider = QuizServiceProvider._();

final class QuizServiceProvider
    extends $FunctionalProvider<QuizService, QuizService, QuizService>
    with $Provider<QuizService> {
  const QuizServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizServiceHash();

  @$internal
  @override
  $ProviderElement<QuizService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizService create(Ref ref) {
    return quizService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizService>(value),
    );
  }
}

String _$quizServiceHash() => r'01ceed543ae112b0b1da9f03e7b2e825940c4e83';
