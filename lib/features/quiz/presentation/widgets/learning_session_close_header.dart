import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

/// Progress label with optional close action (quiz / flashcards sessions).
class LearningSessionCloseHeader extends StatelessWidget {
  const LearningSessionCloseHeader({
    required this.progressLabel,
    super.key,
    this.onClose,
  });

  final String progressLabel;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return Row(
      children: [
        Text(
          progressLabel,
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
    );
  }
}
