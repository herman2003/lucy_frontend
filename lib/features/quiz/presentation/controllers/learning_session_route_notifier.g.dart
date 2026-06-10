// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_route_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningSessionRoute)
const learningSessionRouteProvider = LearningSessionRouteFamily._();

final class LearningSessionRouteProvider
    extends
        $FunctionalProvider<
          AsyncValue<LearningSession>,
          LearningSession,
          FutureOr<LearningSession>
        >
    with $FutureModifier<LearningSession>, $FutureProvider<LearningSession> {
  const LearningSessionRouteProvider._({
    required LearningSessionRouteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'learningSessionRouteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$learningSessionRouteHash();

  @override
  String toString() {
    return r'learningSessionRouteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LearningSession> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LearningSession> create(Ref ref) {
    final argument = this.argument as String;
    return learningSessionRoute(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LearningSessionRouteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$learningSessionRouteHash() =>
    r'a8387ace8ccd1650dd1f48cdd5461a41429d1919';

final class LearningSessionRouteFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LearningSession>, String> {
  const LearningSessionRouteFamily._()
    : super(
        retry: null,
        name: r'learningSessionRouteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LearningSessionRouteProvider call(String sessionId) =>
      LearningSessionRouteProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'learningSessionRouteProvider';
}
