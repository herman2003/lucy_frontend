import 'package:flutter/material.dart';

/// Button themes derived from [ThemeData.colorScheme].
class LucyButtonTheme {
  LucyButtonTheme._();

  static const double kButtonHeight = 48;
  static const double kButtonBorderRadius = 12;

  static ElevatedButtonThemeData getElevatedButtonTheme(ThemeData theme) {
    final scheme = theme.colorScheme;
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size.fromHeight(kButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kButtonBorderRadius),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData getOutlinedButtonTheme(ThemeData theme) {
    final scheme = theme.colorScheme;
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.secondary,
        side: BorderSide(color: scheme.secondary),
        minimumSize: const Size.fromHeight(kButtonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kButtonBorderRadius),
        ),
      ),
    );
  }

  static TextButtonThemeData getTextButtonTheme(ThemeData theme) {
    final scheme = theme.colorScheme;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: scheme.tertiary,
      ),
    );
  }
}
