import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

class QuizProgressHeader extends StatelessWidget {
  const QuizProgressHeader({
    super.key,
    required this.current,
    required this.total,
    this.onClose,
  });

  final int current;
  final int total;
  final VoidCallback? onClose;

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
          children: [
            Text(
              l10n.quizSessionProgress(current, total),
              style: context.textTheme.labelMedium?.copyWith(color: lucy.muted),
            ),
            const Spacer(),
            if (onClose != null)
              InkWell(
                onTap: onClose,
                borderRadius: BorderRadius.circular(LucySpacing.radiusSmall),
                child: Padding(
                  padding: const EdgeInsets.all(LucySpacing.spaceXs),
                  child: Text(
                    '✕',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: lucy.faint,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: LucySpacing.spaceMd + 2),
        ClipRRect(
          borderRadius: BorderRadius.circular(LucySpacing.radiusPill),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: lucy.border,
            color: scheme.primary,
          ),
        ),
      ],
    );
  }
}
