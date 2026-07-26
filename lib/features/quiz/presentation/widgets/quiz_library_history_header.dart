import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';

class QuizLibraryHistoryHeader extends StatelessWidget {
  const QuizLibraryHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        LucySpacing.spaceLg,
        LucySpacing.spaceLg,
        LucySpacing.spaceLg,
        LucySpacing.spaceSm,
      ),
      child: Text(
        context.l10n.quizLibraryHistoryTitle,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
