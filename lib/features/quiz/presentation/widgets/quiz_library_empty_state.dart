import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

class QuizLibraryEmptyState extends StatelessWidget {
  const QuizLibraryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final l10n = context.l10n;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LucySpacing.space2xl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: lucy.motivantAccentSurface,
                  borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
                ),
                alignment: Alignment.center,
                child: const Text('✨', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: LucySpacing.spaceLg),
              Text(
                l10n.quizLibraryEmptyHint,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurface,
                  height: 1.45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
