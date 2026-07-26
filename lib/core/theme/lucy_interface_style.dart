/// Visual ambiance selected in Settings (design system v3/v4).
enum LucyInterfaceStyle {
  /// Default — cream background, Newsreader titles.
  academic,

  /// Cool / neon Lucy glow; includes a dedicated light variant.
  premiumDark,

  /// Warm accents; no streak counter in MVP.
  motivant,
}

extension LucyInterfaceStyleStorageValue on LucyInterfaceStyle {
  String get storageValue => switch (this) {
    LucyInterfaceStyle.academic => 'academic',
    LucyInterfaceStyle.premiumDark => 'premium_dark',
    LucyInterfaceStyle.motivant => 'motivant',
  };
}

/// Parses persisted [LucyInterfaceStyle] codes.
LucyInterfaceStyle? lucyInterfaceStyleFromStorage(String? value) {
  return switch (value) {
    'academic' => LucyInterfaceStyle.academic,
    'premium_dark' => LucyInterfaceStyle.premiumDark,
    'motivant' => LucyInterfaceStyle.motivant,
    _ => null,
  };
}
