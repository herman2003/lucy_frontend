import 'package:flutter/material.dart';

/// Design tokens for Lucy — hex values live only here (SPEC §4).
class LucyColors {
  LucyColors._();

  static const Color primary = Color(0xFF1E3D6F);
  static const Color colorSchemeSecondaryLightSeed = Color(0xFF2E5B9E);
  static const Color colorSchemeTertiaryLightSeed = Color(0xFF5A6C7D);
  static const Color colorSchemeSecondaryDarkSeed = Color(0xFF4A7BC4);
  static const Color colorSchemeTertiaryDarkSeed = Color(0xFF8A9AAB);
  static const Color error = Color(0xFFD4183D);

  static const Color lucyNavy = Color(0xFF11223F);
  static const Color lucyInputBg = Color(0xFFF0F4F8);
  static const Color lucyBorder = Color(0xFFD1DCE6);
  static const Color white = Color(0xFFFFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, colorSchemeSecondaryLightSeed],
  );
}
