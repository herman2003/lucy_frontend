import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';

class QuizLibraryEmptyState extends StatelessWidget {
  const QuizLibraryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
        child: Text(
          l10n.quizLibraryEmptyHint,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: scheme.onSurface),
        ),
      ),
    );
  }
}
