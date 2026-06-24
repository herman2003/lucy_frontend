import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';

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
    final scheme = Theme.of(context).colorScheme;
    final showAsCorrect = revealed && isCorrect;
    final showAsIncorrect = revealed && selected && !isCorrect;

    Color background = scheme.surface;
    Color borderColor = scheme.outlineVariant;
    Color letterBackground = scheme.surfaceContainerHighest;
    Color letterColor = scheme.onSurfaceVariant;

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
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusMedium),
        side: BorderSide(
          color: borderColor,
          width: LucyConstants.kBorderWidthSmall,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusMedium),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: LucyConstants.kQuizChoiceMinHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: LucyConstants.kSpacingMedium,
              vertical: LucyConstants.kSpacingMedium,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: letterBackground,
                  child: Text(
                    letter,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: letterColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: LucyConstants.kSpacingMedium),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
