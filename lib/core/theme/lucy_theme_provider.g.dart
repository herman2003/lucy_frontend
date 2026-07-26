// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lucy_theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Exposes [ThemeData] for light/dark and persisted user preferences.

@ProviderFor(LucyAppTheme)
const lucyAppThemeProvider = LucyAppThemeProvider._();

/// Exposes [ThemeData] for light/dark and persisted user preferences.
final class LucyAppThemeProvider
    extends $NotifierProvider<LucyAppTheme, LucyThemePreferences> {
  /// Exposes [ThemeData] for light/dark and persisted user preferences.
  const LucyAppThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyAppThemeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyAppThemeHash();

  @$internal
  @override
  LucyAppTheme create() => LucyAppTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LucyThemePreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LucyThemePreferences>(value),
    );
  }
}

String _$lucyAppThemeHash() => r'fbd74c37ce3df07f6a087f2bafa6459d38c99f9e';

/// Exposes [ThemeData] for light/dark and persisted user preferences.

abstract class _$LucyAppTheme extends $Notifier<LucyThemePreferences> {
  LucyThemePreferences build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LucyThemePreferences, LucyThemePreferences>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LucyThemePreferences, LucyThemePreferences>,
              LucyThemePreferences,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Light [ThemeData] for the current interface style.

@ProviderFor(lucyLightTheme)
const lucyLightThemeProvider = LucyLightThemeProvider._();

/// Light [ThemeData] for the current interface style.

final class LucyLightThemeProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  /// Light [ThemeData] for the current interface style.
  const LucyLightThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyLightThemeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyLightThemeHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return lucyLightTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$lucyLightThemeHash() => r'f90ebed87249ec58a7659a948f711f59aadcedb7';

/// Dark [ThemeData] for the current interface style.

@ProviderFor(lucyDarkTheme)
const lucyDarkThemeProvider = LucyDarkThemeProvider._();

/// Dark [ThemeData] for the current interface style.

final class LucyDarkThemeProvider
    extends $FunctionalProvider<ThemeData, ThemeData, ThemeData>
    with $Provider<ThemeData> {
  /// Dark [ThemeData] for the current interface style.
  const LucyDarkThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyDarkThemeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyDarkThemeHash();

  @$internal
  @override
  $ProviderElement<ThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeData create(Ref ref) {
    return lucyDarkTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeData>(value),
    );
  }
}

String _$lucyDarkThemeHash() => r'286744f8e2cd3cbd6b18b22e17c041f39d786e1b';

/// [ThemeMode] for [MaterialApp].

@ProviderFor(lucyThemeMode)
const lucyThemeModeProvider = LucyThemeModeProvider._();

/// [ThemeMode] for [MaterialApp].

final class LucyThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  /// [ThemeMode] for [MaterialApp].
  const LucyThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lucyThemeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lucyThemeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return lucyThemeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$lucyThemeModeHash() => r'd815530874a7638a35ccb543e0e3d7c09db69236';
