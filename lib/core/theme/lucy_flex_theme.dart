import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'lucy_colors.dart';
import 'lucy_interface_style.dart';
import 'lucy_theme_palette.dart';
import 'lucy_typography.dart';

/// Lucy application theme via FlexColorScheme + design-system palettes (P5).
class LucyFlexTheme {
  LucyFlexTheme._();

  /// Academic light — backward-compatible default for tests.
  static ThemeData get lightTheme => themeFor(
    brightness: Brightness.light,
    interfaceStyle: LucyInterfaceStyle.academic,
  );

  /// Academic dark — backward-compatible default for tests.
  static ThemeData get darkTheme => themeFor(
    brightness: Brightness.dark,
    interfaceStyle: LucyInterfaceStyle.academic,
  );

  static ThemeData themeFor({
    required Brightness brightness,
    required LucyInterfaceStyle interfaceStyle,
  }) {
    final palette = LucyThemePalette.resolve(
      brightness: brightness,
      style: interfaceStyle,
    );
    final isLight = brightness == Brightness.light;

    final base = isLight
        ? FlexThemeData.light(
            scheme: FlexScheme.material,
            primary: palette.primarySeed,
            secondary: palette.secondarySeed,
            tertiary: palette.tertiarySeed,
            error: LucyColors.error,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            scaffoldBackground: palette.scaffoldBackground,
            useMaterial3: true,
            subThemesData: const FlexSubThemesData(
              useMaterial3Typography: false,
            ),
          )
        : FlexThemeData.dark(
            scheme: FlexScheme.material,
            primary: palette.primarySeed,
            primaryLightRef: LucyColors.primary,
            secondary: palette.secondarySeed,
            secondaryLightRef: LucyColors.colorSchemeSecondaryLightSeed,
            tertiary: palette.tertiarySeed,
            tertiaryLightRef: LucyColors.colorSchemeTertiaryLightSeed,
            error: LucyColors.error,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            scaffoldBackground: palette.scaffoldBackground,
            useMaterial3: true,
            subThemesData: const FlexSubThemesData(
              useMaterial3Typography: false,
            ),
          );

    return base.copyWith(
      textTheme: LucyTypography.apply(base.textTheme, brightness),
      primaryTextTheme: LucyTypography.apply(base.primaryTextTheme, brightness),
      extensions: [palette.extension],
    );
  }

  /// Blue branding gradient for auth panels and twinkling stars.
  static LinearGradient authBrandingGradient(BuildContext context) {
    return LucyColors.authBrandingGradient;
  }
}
