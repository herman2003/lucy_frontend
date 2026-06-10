// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lucy_app_locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Runtime UI locale (fr / en / de) — synced from `GET /v1/users/me`.

@ProviderFor(LucyAppLocale)
const lucyAppLocaleProvider = LucyAppLocaleProvider._();

/// Runtime UI locale (fr / en / de) — synced from `GET /v1/users/me`.
final class LucyAppLocaleProvider
    extends $NotifierProvider<LucyAppLocale, Locale> {
  /// Runtime UI locale (fr / en / de) — synced from `GET /v1/users/me`.
  const LucyAppLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyAppLocaleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyAppLocaleHash();

  @$internal
  @override
  LucyAppLocale create() => LucyAppLocale();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$lucyAppLocaleHash() => r'9fc65a0c3798748ef29e3608e8f5df10cb4680d0';

/// Runtime UI locale (fr / en / de) — synced from `GET /v1/users/me`.

abstract class _$LucyAppLocale extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
