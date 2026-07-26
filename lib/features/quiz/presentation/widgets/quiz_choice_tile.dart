import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_colors.dart';
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
    final dimmed = revealed && !showAsCorrect && !showAsIncorrect;

    Color background = scheme.surface;
    Color borderColor = lucy.border;
    Color textColor = scheme.onSurface;
    FontWeight fontWeight = FontWeight.w500;
    Widget badge = _MonoBadge(label: letter, color: lucy.faint);

    if (showAsCorrect) {
      background = lucy.tealChipBackground;
      borderColor = lucy.tealChipForeground;
      textColor = lucy.tealChipForeground;
      fontWeight = FontWeight.w600;
      badge = _CircleBadge(
        label: '✓',
        background: lucy.tealChipForeground,
        foreground: Colors.white,
      );
    } else if (showAsIncorrect) {
      background = LucyColors.quizIncorrectBackground;
      borderColor = LucyColors.quizIncorrectBorder;
      textColor = LucyColors.quizIncorrectForeground;
      fontWeight = FontWeight.w600;
      badge = const _CircleBadge(
        label: '✕',
        background: LucyColors.error,
        foreground: Colors.white,
      );
    }

    return Opacity(
      opacity: dimmed ? 0.55 : 1,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium + 1),
          side: BorderSide(color: borderColor, width: 1.5),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium + 1),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: LucyConstants.kQuizChoiceMinHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LucySpacing.spaceLg,
                vertical: LucySpacing.spaceMd + 1,
              ),
              child: Row(
                children: [
                  badge,
                  const SizedBox(width: LucySpacing.spaceMd),
                  Expanded(
                    child: Text(
                      label,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: textColor,
                        fontWeight: fontWeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MonoBadge extends StatelessWidget {
  const _MonoBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: context.textTheme.labelMedium?.copyWith(color: color),
      ),
    );
  }
}

class _CircleBadge extends StatelessWidget {
  const _CircleBadge({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: background, shape: BoxShape.circle),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
