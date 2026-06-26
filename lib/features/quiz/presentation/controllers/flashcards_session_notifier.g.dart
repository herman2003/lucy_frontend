// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcards_session_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FlashcardsSessionNotifier)
const flashcardsSessionProvider = FlashcardsSessionNotifierFamily._();

final class FlashcardsSessionNotifierProvider
    extends
        $NotifierProvider<FlashcardsSessionNotifier, FlashcardsSessionState> {
  const FlashcardsSessionNotifierProvider._({
    required FlashcardsSessionNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'flashcardsSessionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$flashcardsSessionNotifierHash();

  @override
  String toString() {
    return r'flashcardsSessionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FlashcardsSessionNotifier create() => FlashcardsSessionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlashcardsSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlashcardsSessionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlashcardsSessionNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flashcardsSessionNotifierHash() =>
    r'0f6a22cf242a88173ec4cd992dec8eb56083346b';

final class FlashcardsSessionNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          FlashcardsSessionNotifier,
          FlashcardsSessionState,
          FlashcardsSessionState,
          FlashcardsSessionState,
          String
        > {
  const FlashcardsSessionNotifierFamily._()
    : super(
        retry: null,
        name: r'flashcardsSessionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FlashcardsSessionNotifierProvider call(String sessionId) =>
      FlashcardsSessionNotifierProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'flashcardsSessionProvider';
}

abstract class _$FlashcardsSessionNotifier
    extends $Notifier<FlashcardsSessionState> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  FlashcardsSessionState build(String sessionId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<FlashcardsSessionState, FlashcardsSessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FlashcardsSessionState, FlashcardsSessionState>,
              FlashcardsSessionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
