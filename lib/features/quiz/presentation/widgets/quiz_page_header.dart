import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

/// Quiz library page header (Newsreader title + subtitle, V3/V4).
class QuizPageHeader extends StatelessWidget {
  const QuizPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Material(
      color: scheme.surface,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: lucy.border)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            LucySpacing.space2xl,
            LucySpacing.spaceXl + 2,
            LucySpacing.space2xl,
            LucySpacing.spaceLg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.quizPageTitle, style: context.textTheme.headlineLarge),
              const SizedBox(height: 3),
              Text(
                l10n.quizPageSubtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: lucy.muted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
