import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';

/// Full-width destructive outline button for sign-out.
class SettingsLogoutButton extends StatelessWidget {
  const SettingsLogoutButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LucySpacing.spaceLg),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: scheme.error,
            side: BorderSide(color: scheme.error),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                LucyConstants.kButtonBorderRadius,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: LucySpacing.spaceMd),
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: scheme.error,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
