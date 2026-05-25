// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Reset password notifier — always shows success for unknown emails (Q13).

@ProviderFor(ResetPasswordNotifier)
const resetPasswordProvider = ResetPasswordNotifierProvider._();

/// Reset password notifier — always shows success for unknown emails (Q13).
final class ResetPasswordNotifierProvider
    extends $NotifierProvider<ResetPasswordNotifier, ResetPasswordState> {
  /// Reset password notifier — always shows success for unknown emails (Q13).
  const ResetPasswordNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetPasswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetPasswordNotifierHash();

  @$internal
  @override
  ResetPasswordNotifier create() => ResetPasswordNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetPasswordState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetPasswordState>(value),
    );
  }
}

String _$resetPasswordNotifierHash() =>
    r'a1d34bb874df11a4a02b4b9da38c9f44bc9356c9';

/// Reset password notifier — always shows success for unknown emails (Q13).

abstract class _$ResetPasswordNotifier extends $Notifier<ResetPasswordState> {
  ResetPasswordState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ResetPasswordState, ResetPasswordState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ResetPasswordState, ResetPasswordState>,
              ResetPasswordState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
