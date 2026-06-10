// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningSessionRepository)
const learningSessionRepositoryProvider = LearningSessionRepositoryProvider._();

final class LearningSessionRepositoryProvider
    extends
        $FunctionalProvider<
          LearningSessionRepository,
          LearningSessionRepository,
          LearningSessionRepository
        >
    with $Provider<LearningSessionRepository> {
  const LearningSessionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningSessionRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningSessionRepositoryHash();

  @$internal
  @override
  $ProviderElement<LearningSessionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningSessionRepository create(Ref ref) {
    return learningSessionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningSessionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningSessionRepository>(value),
    );
  }
}

String _$learningSessionRepositoryHash() =>
    r'5ee0a1dbd0c063ddf54697c55f54813cebb371c4';

@ProviderFor(learningSessionService)
const learningSessionServiceProvider = LearningSessionServiceProvider._();

final class LearningSessionServiceProvider
    extends
        $FunctionalProvider<
          LearningSessionService,
          LearningSessionService,
          LearningSessionService
        >
    with $Provider<LearningSessionService> {
  const LearningSessionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningSessionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningSessionServiceHash();

  @$internal
  @override
  $ProviderElement<LearningSessionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningSessionService create(Ref ref) {
    return learningSessionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningSessionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningSessionService>(value),
    );
  }
}

String _$learningSessionServiceHash() =>
    r'dd34b4d8bc26b55edd29b18a1e78e86a675a5fee';
