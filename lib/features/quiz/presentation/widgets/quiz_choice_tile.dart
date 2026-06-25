import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

class QuizChoiceTile extends StatelessWidget {
  const QuizChoiceTile({
    super.key,
    required this.label,
    required this.letter,
    required this.selected,
    required this.revealed,
    required this.isCorrect,
    this.onTap,
  });

  final String label;
  final String letter;
  final bool selected;
  final bool revealed;
  final bool isCorrect;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final showAsCorrect = revealed && isCorrect;
    final showAsIncorrect = revealed && selected && !isCorrect;

    Color background = scheme.surface;
    Color borderColor = lucy.border;
    Color letterBackground = lucy.chipBackground;
    Color letterColor = lucy.chipForeground;

    if (showAsCorrect) {
      background = scheme.primaryContainer;
      borderColor = scheme.primary;
      letterBackground = scheme.primary;
      letterColor = scheme.onPrimary;
    } else if (showAsIncorrect) {
      background = scheme.errorContainer;
      borderColor = scheme.error;
      letterBackground = scheme.error;
      letterColor = scheme.onError;
    } else if (selected) {
      background = scheme.secondaryContainer;
      borderColor = scheme.secondary;
      letterBackground = scheme.secondary;
      letterColor = scheme.onSecondary;
    }

    return Material(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        side: BorderSide(
          color: borderColor,
          width: LucyConstants.kBorderWidthSmall,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: LucyConstants.kQuizChoiceMinHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: LucySpacing.spaceLg,
              vertical: LucySpacing.spaceMd,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: letterBackground,
                  child: Text(
                    letter,
                    style: context.textTheme.labelLarge?.copyWith(
                      color: letterColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: LucySpacing.spaceMd),
                Expanded(
                  child: Text(
                    label,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: scheme.onSurface,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                if (showAsCorrect)
                  Icon(Icons.check_circle, color: scheme.primary),
                if (showAsIncorrect) Icon(Icons.cancel, color: scheme.error),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
