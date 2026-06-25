import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

class QuizProgressHeader extends StatelessWidget {
  const QuizProgressHeader({
    super.key,
    required this.current,
    required this.total,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;
    final scheme = context.colorScheme;
    final l10n = context.l10n;
    final progress = total > 0 ? current / total : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.quizSessionProgress(current, total),
              style: context.textTheme.labelMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            Text(
              l10n.quizSessionProgressPercent((progress * 100).round()),
              style: context.textTheme.labelMedium?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: LucySpacing.spaceSm),
        ClipRRect(
          borderRadius: BorderRadius.circular(LucySpacing.radiusSmall),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: lucy.border.withValues(alpha: 0.35),
            color: scheme.primary,
          ),
        ),
      ],
    );
  }
}
