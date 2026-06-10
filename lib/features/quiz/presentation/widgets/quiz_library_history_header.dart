import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';

class QuizLibraryHistoryHeader extends StatelessWidget {
  const QuizLibraryHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        LucyConstants.kSpacingMedium,
        LucyConstants.kSpacingMedium,
        LucyConstants.kSpacingMedium,
        LucyConstants.kSpacingLow,
      ),
      child: Text(
        context.l10n.quizLibraryHistoryTitle,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: scheme.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
