import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';
import '../../../core/theme/lucy_typography.dart';

/// Citation card for chat and quiz (teal left accent, editorial quote).
class LucySourceCard extends StatelessWidget {
  const LucySourceCard({
    required this.title,
    required this.excerpt,
    super.key,
    this.pagesLabel,
    this.sourceLabel,
  });

  final String title;
  final String excerpt;
  final String? pagesLabel;
  final String? sourceLabel;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final label = sourceLabel ?? context.l10n.chatSourceLabel;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        border: Border.all(color: lucy.border),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 3, color: lucy.tealChipForeground),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LucySpacing.spaceMd + 2,
                    vertical: LucySpacing.spaceMd,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            label.toUpperCase(),
                            style: context.textTheme.labelSmall?.copyWith(
                              color: lucy.faint,
                              letterSpacing: 0.4,
                            ),
                          ),
                          const SizedBox(width: LucySpacing.spaceSm),
                          Expanded(
                            child: Divider(color: lucy.border, height: 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: LucySpacing.spaceSm),
                      Text(
                        '« $excerpt »',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: LucyTypography.editorialQuote(
                          fontSize: 14,
                          color: lucy.muted,
                        ),
                      ),
                      const SizedBox(height: LucySpacing.spaceSm + 1),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: scheme.onSurface,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                          if (pagesLabel != null) ...[
                            const SizedBox(width: LucySpacing.spaceSm),
                            Text(
                              pagesLabel!,
                              style: context.textTheme.labelMedium,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
