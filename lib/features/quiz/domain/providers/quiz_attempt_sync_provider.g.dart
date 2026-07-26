// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_attempt_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quizAttemptApiRemoteDataSource)
const quizAttemptApiRemoteDataSourceProvider =
    QuizAttemptApiRemoteDataSourceProvider._();

final class QuizAttemptApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          QuizAttemptApiRemoteDataSource,
          QuizAttemptApiRemoteDataSource,
          QuizAttemptApiRemoteDataSource
        >
    with $Provider<QuizAttemptApiRemoteDataSource> {
  const QuizAttemptApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizAttemptApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizAttemptApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<QuizAttemptApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QuizAttemptApiRemoteDataSource create(Ref ref) {
    return quizAttemptApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizAttemptApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizAttemptApiRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$quizAttemptApiRemoteDataSourceHash() =>
    r'361690bdbbf9fb0fff1fcb213c1fd42e231feab9';

@ProviderFor(quizAttemptSyncService)
const quizAttemptSyncServiceProvider = QuizAttemptSyncServiceProvider._();

final class QuizAttemptSyncServiceProvider
    extends
        $FunctionalProvider<
          QuizAttemptSyncService,
          QuizAttemptSyncService,
          QuizAttemptSyncService
        >
    with $Provider<QuizAttemptSyncService> {
  const QuizAttemptSyncServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizAttemptSyncServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizAttemptSyncServiceHash();

  @$internal
  @override
  $ProviderElement<QuizAttemptSyncService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QuizAttemptSyncService create(Ref ref) {
    return quizAttemptSyncService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizAttemptSyncService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizAttemptSyncService>(value),
    );
  }
}

String _$quizAttemptSyncServiceHash() =>
    r'f35795ac051deb03dfeb53cf429a644a14da5200';
