import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';

class QuizNoCorpusBanner extends StatelessWidget {
  const QuizNoCorpusBanner({super.key, this.onGoToDocuments});

  final VoidCallback? onGoToDocuments;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: scheme.errorContainer.withValues(alpha: 0.35),
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.quizNoCorpusTitle,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: scheme.onErrorContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLow),
            Text(
              l10n.quizNoCorpusMessage,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: scheme.onErrorContainer),
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyPrimaryButton(
              text: l10n.quizNoCorpusCta,
              onPressed:
                  onGoToDocuments ?? () => context.go(LucyRoutePaths.documents),
            ),
          ],
        ),
      ),
    );
  }
}
