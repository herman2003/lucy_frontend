import 'package:flutter/material.dart';

import 'lucy_colors.dart';

/// Input decoration for auth forms (tokens from [LucyColors] only here).
class LucyTextFieldTheme {
  LucyTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme(ThemeData theme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: LucyColors.lucyInputBg,
      labelStyle: TextStyle(color: theme.colorScheme.tertiary),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LucyColors.lucyBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: theme.colorScheme.error),
      ),
    );
  }
}
