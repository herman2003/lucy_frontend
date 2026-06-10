// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChangePasswordNotifier)
const changePasswordProvider = ChangePasswordNotifierProvider._();

final class ChangePasswordNotifierProvider
    extends $NotifierProvider<ChangePasswordNotifier, bool> {
  const ChangePasswordNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changePasswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changePasswordNotifierHash();

  @$internal
  @override
  ChangePasswordNotifier create() => ChangePasswordNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$changePasswordNotifierHash() =>
    r'f8528383849d00911a853c7297582ba2ecc2ff34';

abstract class _$ChangePasswordNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
