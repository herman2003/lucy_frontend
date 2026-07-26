import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../domain/entities/learning_session_source.dart';
import 'learning_session_source_chip.dart';

/// Sources block for a quiz question or flashcard (spec G8 — chat-style cards).
class LearningSessionItemSources extends StatelessWidget {
  const LearningSessionItemSources({super.key, required this.sources});

  final List<LearningSessionSource> sources;

  @override
  Widget build(BuildContext context) {
    if (sources.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.l10n.chatSourcesTitle,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.lucyTheme.muted,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: LucySpacing.spaceSm),
        for (var index = 0; index < sources.length; index++) ...[
          if (index > 0) const SizedBox(height: LucySpacing.spaceSm),
          LearningSessionSourceChip(source: sources[index]),
        ],
      ],
    );
  }
}
