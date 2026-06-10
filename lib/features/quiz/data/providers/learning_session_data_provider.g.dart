// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningSessionApiRemoteDataSource)
const learningSessionApiRemoteDataSourceProvider =
    LearningSessionApiRemoteDataSourceProvider._();

final class LearningSessionApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          LearningSessionApiRemoteDataSource,
          LearningSessionApiRemoteDataSource,
          LearningSessionApiRemoteDataSource
        >
    with $Provider<LearningSessionApiRemoteDataSource> {
  const LearningSessionApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningSessionApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$learningSessionApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<LearningSessionApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningSessionApiRemoteDataSource create(Ref ref) {
    return learningSessionApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningSessionApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningSessionApiRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$learningSessionApiRemoteDataSourceHash() =>
    r'279e676e196beeecb6ce20520ace03457db97d74';

@ProviderFor(learningSessionRepositoryImpl)
const learningSessionRepositoryImplProvider =
    LearningSessionRepositoryImplProvider._();

final class LearningSessionRepositoryImplProvider
    extends
        $FunctionalProvider<
          LearningSessionRepository,
          LearningSessionRepository,
          LearningSessionRepository
        >
    with $Provider<LearningSessionRepository> {
  const LearningSessionRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningSessionRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningSessionRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<LearningSessionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningSessionRepository create(Ref ref) {
    return learningSessionRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningSessionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningSessionRepository>(value),
    );
  }
}

String _$learningSessionRepositoryImplHash() =>
    r'54cb9c46bb9d2e348ceb4aef7b35c7bb4a2e7b53';
