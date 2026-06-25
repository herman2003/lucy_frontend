import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

/// Section title for settings screens.
class SettingsSectionHeader extends StatelessWidget {
  const SettingsSectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        LucySpacing.spaceLg,
        LucySpacing.spaceLg,
        LucySpacing.spaceLg,
        LucySpacing.spaceSm,
      ),
      child: Text(
        title,
        style: context.textTheme.labelMedium?.copyWith(
          color: lucy.muted,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
