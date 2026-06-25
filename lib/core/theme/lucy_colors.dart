import 'package:flutter/material.dart';

/// Design tokens for Lucy — hex values live only here (UI redesign P5).
///
/// Seeds feed [FlexThemeData]; widgets use `Theme.of(context).colorScheme` and
/// [LucyThemeExtension] for semantic colors.
class LucyColors {
  LucyColors._();

  // --- FlexColorScheme seeds (design system) ---
  static const Color primary = Color(0xFF2E4C8A);
  static const Color primaryDarkMode = Color(0xFF3A5FB0);

  static const Color colorSchemeSecondaryLightSeed = Color(0xFF159A8B);
  static const Color colorSchemeSecondaryDarkSeed = Color(0xFF2BB89F);

  static const Color colorSchemeTertiaryLightSeed = Color(0xFFE5933C);
  static const Color colorSchemeTertiaryDarkSeed = Color(0xFFF0A85A);

  static const Color error = Color(0xFFCE3A4E);

  // --- Neutrals ---
  static const Color ink = Color(0xFF1B2336);
  static const Color mutedLight = Color(0xFF8A8270);
  static const Color faintLight = Color(0xFFA39A84);
  static const Color borderLight = Color(0xFFE6DFD0);
  static const Color scaffoldAcademicLight = Color(0xFFF4F0E8);
  static const Color surfaceElevatedLight = Color(0xFFFBF8F1);

  static const Color scaffoldAcademicDark = Color(0xFF0F1320);
  static const Color surfaceAcademicDark = Color(0xFF181D2C);
  static const Color surface2AcademicDark = Color(0xFF141927);
  static const Color borderDark = Color(0xFF2A3142);
  static const Color mutedDark = Color(0xFF98A1B6);

  static const Color scaffoldPremiumLight = Color(0xFFE8EDF6);
  static const Color scaffoldMotivantLight = Color(0xFFFCF4E8);
  static const Color motivantAccentSurface = Color(0xFFFBEEDD);

  // --- Shell ---
  static const Color rail = Color(0xFF22315C);
  static const Color railText = Color(0xFF9DA9CC);
  static const Color railTextActive = Color(0xFF22315C);

  // --- Lucy brand ---
  static const Color lucyNavy = Color(0xFF1B2336);

  static const LinearGradient lucyAvatarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6F9BF0), Color(0xFF2E4C8A), Color(0xFF1C7C6E)],
    stops: [0.0, 0.52, 1.0],
  );

  /// Auth branding panel (blue → ink).
  static const LinearGradient authBrandingGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, lucyNavy],
  );

  // --- Chips / semantic ---
  static const Color teal = Color(0xFF159A8B);
  static const Color tealChipBgLight = Color(0xFFE2F2EF);
  static const Color tealChipTextLight = Color(0xFF0E7163);
  static const Color tealChipBgDark = Color(0xFF13322C);
  static const Color tealChipTextDark = Color(0xFF5FD3BE);

  static const Color chipBgLight = Color(0xFFEBEEF7);
  static const Color chipTextLight = Color(0xFF2E4C8A);
  static const Color processingAccent = Color(0xFFE5933C);

  /// Learning session card in chat (design system §learning session).
  static const Color learningSessionGradientEnd = Color(0xFFFCF4E8);
  static const Color learningSessionBorder = Color(0xFFF0DCC0);
  static const Color learningSessionSubtitle = Color(0xFF9A6A2A);

  static const LinearGradient learningSessionCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [motivantAccentSurface, learningSessionGradientEnd],
  );
}
