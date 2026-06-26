import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../controllers/quiz_session_state.dart';

class QuizScoreSummary extends StatelessWidget {
  const QuizScoreSummary({
    super.key,
    required this.state,
    required this.onClose,
    required this.onRetry,
  });

  final QuizSessionState state;
  final VoidCallback onClose;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final total = state.totalQuestions;
    final correct = state.score;

    return Padding(
      padding: const EdgeInsets.all(LucySpacing.spaceXl),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(LucySpacing.radiusLarge),
          border: Border.all(color: lucy.border),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucySpacing.space2xl,
            vertical: LucySpacing.space2xl + 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🎉', style: TextStyle(fontSize: 48)),
              const SizedBox(height: LucySpacing.spaceMd),
              Text(
                l10n.quizSessionScoreTitle,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: LucySpacing.spaceSm),
              Text(
                l10n.quizSessionScoreSubtitle(correct, total),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(color: lucy.muted),
              ),
              const SizedBox(height: LucySpacing.spaceXl),
              Row(
                children: [
                  Expanded(
                    child: _ScoreActionButton(
                      label: l10n.quizSessionClose,
                      outlined: true,
                      onPressed: onClose,
                    ),
                  ),
                  const SizedBox(width: LucySpacing.spaceMd),
                  Expanded(
                    child: _ScoreActionButton(
                      label: l10n.quizSessionRetry,
                      outlined: false,
                      onPressed: onRetry,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreActionButton extends StatelessWidget {
  const _ScoreActionButton({
    required this.label,
    required this.outlined,
    required this.onPressed,
  });

  final String label;
  final bool outlined;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Material(
      color: outlined ? scheme.surface : scheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        side: outlined
            ? BorderSide(color: lucy.border, width: 1.5)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucySpacing.spaceXl,
            vertical: LucySpacing.spaceMd - 1,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: outlined ? scheme.onSurface : scheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
