// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizApiRemoteDataSource)
const quizApiRemoteDataSourceProvider = QuizApiRemoteDataSourceProvider._();

final class QuizApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          QuizApiRemoteDataSource,
          QuizApiRemoteDataSource,
          QuizApiRemoteDataSource
        >
    with $Provider<QuizApiRemoteDataSource> {
  const QuizApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<QuizApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QuizApiRemoteDataSource create(Ref ref) {
    return quizApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizApiRemoteDataSource>(value),
    );
  }
}

String _$quizApiRemoteDataSourceHash() =>
    r'caa66ba135075471a9a34b9cc77f85216f16d94e';

@ProviderFor(quizRepositoryImpl)
const quizRepositoryImplProvider = QuizRepositoryImplProvider._();

final class QuizRepositoryImplProvider
    extends $FunctionalProvider<QuizRepository, QuizRepository, QuizRepository>
    with $Provider<QuizRepository> {
  const QuizRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<QuizRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuizRepository create(Ref ref) {
    return quizRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizRepository>(value),
    );
  }
}

String _$quizRepositoryImplHash() =>
    r'c6ae7702b4841c4411a92346ddd9e27f10e4cd41';
