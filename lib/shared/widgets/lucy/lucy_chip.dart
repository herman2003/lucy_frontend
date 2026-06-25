import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';

/// Small status or category pill (documents, corpus, quiz type).
class LucyChip extends StatelessWidget {
  const LucyChip({
    required this.label,
    super.key,
    this.variant = LucyChipVariant.neutral,
    this.icon,
  });

  final String label;
  final LucyChipVariant variant;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;
    final (background, foreground) = switch (variant) {
      LucyChipVariant.neutral => (lucy.chipBackground, lucy.chipForeground),
      LucyChipVariant.teal => (lucy.tealChipBackground, lucy.tealChipForeground),
      LucyChipVariant.error => (
        context.colorScheme.errorContainer,
        context.colorScheme.onErrorContainer,
      ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(LucySpacing.radiusPill),
        border: Border.all(color: foreground.withValues(alpha: 0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LucySpacing.spaceSm + 2,
          vertical: LucySpacing.spaceXs + 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 12, color: foreground),
              const SizedBox(width: LucySpacing.spaceXs),
            ],
            Text(
              label,
              style: context.textTheme.labelSmall?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum LucyChipVariant { neutral, teal, error }
