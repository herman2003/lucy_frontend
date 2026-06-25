import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
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
    final total = state.totalQuestions;
    final correct = state.score;
    final percent = total > 0 ? ((correct / total) * 100).round() : 0;
    final isStrongScore = percent >= 80;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(LucySpacing.spaceXl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isStrongScore
                  ? Icons.emoji_events_outlined
                  : Icons.fact_check_outlined,
              size: 72,
              color: scheme.primary,
            ),
            const SizedBox(height: LucySpacing.spaceXl),
            Text(
              l10n.quizSessionScoreTitle,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineSmall?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceMd),
            Text(
              l10n.quizSessionScore(correct, total),
              textAlign: TextAlign.center,
              style: context.textTheme.displaySmall?.copyWith(
                color: scheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceSm),
            Text(
              l10n.quizSessionProgressPercent(percent),
              textAlign: TextAlign.center,
              style: context.textTheme.labelMedium?.copyWith(
                color: scheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceXl),
            Text(
              l10n.quizSessionScoreSubtitle(correct, total),
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: LucySpacing.space2xl),
            LucyPrimaryButton(text: l10n.quizSessionClose, onPressed: onClose),
            const SizedBox(height: LucySpacing.spaceMd),
            LucySecondaryButton(
              text: l10n.quizSessionRetry,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
