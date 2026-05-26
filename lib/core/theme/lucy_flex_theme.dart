import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'lucy_colors.dart';

/// Lucy application theme via FlexColorScheme (SPEC §4).
class LucyFlexTheme {
  LucyFlexTheme._();

  static ThemeData get lightTheme => FlexThemeData.light(
    scheme: FlexScheme.material,
    primary: LucyColors.primary,
    secondary: LucyColors.colorSchemeSecondaryLightSeed,
    tertiary: LucyColors.colorSchemeTertiaryLightSeed,
    error: LucyColors.error,
    useMaterial3: true,
    subThemesData: const FlexSubThemesData(useMaterial3Typography: true),
  );

  static ThemeData get darkTheme => FlexThemeData.dark(
    scheme: FlexScheme.material,
    primary: LucyColors.primary,
    primaryLightRef: LucyColors.primary,
    secondary: LucyColors.colorSchemeSecondaryDarkSeed,
    secondaryLightRef: LucyColors.colorSchemeSecondaryLightSeed,
    tertiary: LucyColors.colorSchemeTertiaryDarkSeed,
    tertiaryLightRef: LucyColors.colorSchemeTertiaryLightSeed,
    error: LucyColors.error,
    useMaterial3: true,
    subThemesData: const FlexSubThemesData(useMaterial3Typography: true),
  );

  /// Blue branding gradient for auth panels and twinkling stars.
  static LinearGradient authBrandingGradient(BuildContext context) {
    return LucyColors.authBrandingGradient;
  }
}
