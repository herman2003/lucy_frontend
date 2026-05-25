import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../extensions/context.dart';
import 'lucy_custom_theme/lucy_button_theme.dart';
import 'lucy_custom_theme/lucy_colors.dart';
import 'lucy_custom_theme/lucy_form_theme.dart';
import 'lucy_custom_theme/lucy_text_field_theme.dart';

/// Lucy application theme via FlexColorScheme (SPEC §4).
class LucyFlexTheme {
  LucyFlexTheme._();

  static ThemeData get lightTheme {
    final baseTheme = FlexThemeData.light(
      scheme: FlexScheme.material,
      primary: LucyColors.primary,
      secondary: LucyColors.colorSchemeSecondaryLightSeed,
      tertiary: LucyColors.colorSchemeTertiaryLightSeed,
      error: LucyColors.error,
      useMaterial3: true,
      subThemesData: const FlexSubThemesData(
        useMaterial3Typography: true,
      ),
    );

    return baseTheme.copyWith(
      elevatedButtonTheme: LucyButtonTheme.getElevatedButtonTheme(baseTheme),
      outlinedButtonTheme: LucyButtonTheme.getOutlinedButtonTheme(baseTheme),
      textButtonTheme: LucyButtonTheme.getTextButtonTheme(baseTheme),
      checkboxTheme: LucyFormTheme.getCheckboxTheme(baseTheme),
      inputDecorationTheme: LucyTextFieldTheme.lightInputDecorationTheme(
        baseTheme,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: baseTheme.colorScheme.surface,
        foregroundColor: baseTheme.colorScheme.onSurface,
        elevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    final baseTheme = FlexThemeData.dark(
      scheme: FlexScheme.material,
      primary: LucyColors.primary,
      primaryLightRef: LucyColors.primary,
      secondary: LucyColors.colorSchemeSecondaryDarkSeed,
      secondaryLightRef: LucyColors.colorSchemeSecondaryLightSeed,
      tertiary: LucyColors.colorSchemeTertiaryDarkSeed,
      tertiaryLightRef: LucyColors.colorSchemeTertiaryLightSeed,
      error: LucyColors.error,
      useMaterial3: true,
      subThemesData: const FlexSubThemesData(
        useMaterial3Typography: true,
      ),
    );

    return baseTheme.copyWith(
      elevatedButtonTheme: LucyButtonTheme.getElevatedButtonTheme(baseTheme),
      outlinedButtonTheme: LucyButtonTheme.getOutlinedButtonTheme(baseTheme),
      textButtonTheme: LucyButtonTheme.getTextButtonTheme(baseTheme),
      checkboxTheme: LucyFormTheme.getCheckboxTheme(baseTheme),
      inputDecorationTheme: LucyTextFieldTheme.lightInputDecorationTheme(
        baseTheme,
      ),
    );
  }

  /// Primary button gradient from [ColorScheme] (no hex in widgets).
  static LinearGradient primaryGradient(BuildContext context) {
    final scheme = context.colorScheme;
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [scheme.primary, scheme.secondary],
    );
  }
}
