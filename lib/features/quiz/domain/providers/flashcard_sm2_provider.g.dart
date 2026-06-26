// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_sm2_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(flashcardSm2Service)
const flashcardSm2ServiceProvider = FlashcardSm2ServiceProvider._();

final class FlashcardSm2ServiceProvider
    extends
        $FunctionalProvider<
          FlashcardSm2Service,
          FlashcardSm2Service,
          FlashcardSm2Service
        >
    with $Provider<FlashcardSm2Service> {
  const FlashcardSm2ServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flashcardSm2ServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flashcardSm2ServiceHash();

  @$internal
  @override
  $ProviderElement<FlashcardSm2Service> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlashcardSm2Service create(Ref ref) {
    return flashcardSm2Service(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlashcardSm2Service value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlashcardSm2Service>(value),
    );
  }
}

String _$flashcardSm2ServiceHash() =>
    r'bd40f868c4144b1171c6b7eab655596c75045231';
