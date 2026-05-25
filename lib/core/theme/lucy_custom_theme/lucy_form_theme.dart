import 'package:flutter/material.dart';

/// Form control themes for Lucy.
class LucyFormTheme {
  LucyFormTheme._();

  static CheckboxThemeData getCheckboxTheme(ThemeData theme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return theme.colorScheme.primary;
        }
        return null;
      }),
    );
  }
}
