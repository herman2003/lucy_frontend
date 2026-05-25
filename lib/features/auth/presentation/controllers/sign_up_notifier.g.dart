// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sign up form notifier (UI → Notifier → [AuthService]).

@ProviderFor(SignUpNotifier)
const signUpProvider = SignUpNotifierProvider._();

/// Sign up form notifier (UI → Notifier → [AuthService]).
final class SignUpNotifierProvider
    extends $NotifierProvider<SignUpNotifier, SignUpState> {
  /// Sign up form notifier (UI → Notifier → [AuthService]).
  const SignUpNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpNotifierHash();

  @$internal
  @override
  SignUpNotifier create() => SignUpNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpState>(value),
    );
  }
}

String _$signUpNotifierHash() => r'c9d799be46e9c4442c42c2d1460c6f0541fe2364';

/// Sign up form notifier (UI → Notifier → [AuthService]).

abstract class _$SignUpNotifier extends $Notifier<SignUpState> {
  SignUpState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignUpState, SignUpState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignUpState, SignUpState>,
              SignUpState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
