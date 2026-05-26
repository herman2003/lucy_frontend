import 'package:flutter/material.dart';

/// Design tokens for Lucy — hex values live only here (SPEC §4).
///
/// Seeds feed [FlexThemeData]; widgets use `Theme.of(context).colorScheme` only.
class LucyColors {
  LucyColors._();

  static const Color primary = Color(0xFF1E3D6F);

  /// Green — [ColorScheme.secondary] seed (success / snackbar success).
  static const Color colorSchemeSecondaryLightSeed = Color(0xFF4CAF50);
  static const Color colorSchemeSecondaryDarkSeed = Color(0xFF81C784);

  /// Orange — [ColorScheme.tertiary] seed (accent / snackbar / labels).
  static const Color colorSchemeTertiaryLightSeed = Color(0xFFFF9800);
  static const Color colorSchemeTertiaryDarkSeed = Color(0xFFFFB74D);

  static const Color error = Color(0xFFD4183D);

  static const Color lucyNavy = Color(0xFF11223F);

  /// Auth branding panel only (blue → navy). Not used for buttons.
  static const LinearGradient authBrandingGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, lucyNavy],
  );
}
