// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingChatNotifier)
const onboardingChatProvider = OnboardingChatNotifierProvider._();

final class OnboardingChatNotifierProvider
    extends $NotifierProvider<OnboardingChatNotifier, OnboardingChatState> {
  const OnboardingChatNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingChatProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingChatNotifierHash();

  @$internal
  @override
  OnboardingChatNotifier create() => OnboardingChatNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingChatState>(value),
    );
  }
}

String _$onboardingChatNotifierHash() =>
    r'26e0f9b957751b2602e161ce0b31d880281a162d';

abstract class _$OnboardingChatNotifier extends $Notifier<OnboardingChatState> {
  OnboardingChatState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OnboardingChatState, OnboardingChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingChatState, OnboardingChatState>,
              OnboardingChatState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
