import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';

/// Citation card for chat and quiz (teal accent border).
class LucySourceCard extends StatelessWidget {
  const LucySourceCard({
    required this.title,
    required this.excerpt,
    super.key,
    this.pagesLabel,
  });

  final String title;
  final String excerpt;
  final String? pagesLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: LucySpacing.spaceSm),
      padding: const EdgeInsets.all(LucySpacing.spaceMd),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        border: Border.all(
          color: lucy.tealChipForeground.withValues(alpha: 0.45),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall?.copyWith(
              color: scheme.onSurface,
            ),
          ),
          if (pagesLabel != null) ...[
            const SizedBox(height: LucySpacing.spaceXs),
            Text(
              pagesLabel!,
              style: context.textTheme.labelMedium?.copyWith(
                color: lucy.tealChipForeground,
              ),
            ),
          ],
          const SizedBox(height: LucySpacing.spaceSm),
          Text(
            excerpt,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: lucy.muted,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
