import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';
import 'lucy_chip.dart';

/// Quiz or flashcards session card for the library hub (V3/V4 redesign).
enum LucyQuizHubCardType { quiz, flashcards }

class LucyQuizHubCard extends StatelessWidget {
  const LucyQuizHubCard({
    required this.title,
    required this.metaLabel,
    required this.typeLabel,
    required this.type,
    super.key,
    this.onTap,
    this.onDelete,
    this.deleteLabel,
  });

  final String title;
  final String metaLabel;
  final String typeLabel;
  final LucyQuizHubCardType type;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final String? deleteLabel;

  IconData get _icon => switch (type) {
        LucyQuizHubCardType.quiz => Icons.quiz_outlined,
        LucyQuizHubCardType.flashcards => Icons.style_outlined,
      };

  LucyChipVariant get _chipVariant => switch (type) {
        LucyQuizHubCardType.quiz => LucyChipVariant.teal,
        LucyQuizHubCardType.flashcards => LucyChipVariant.neutral,
      };

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final accent = type == LucyQuizHubCardType.quiz
        ? scheme.primary
        : scheme.tertiary;

    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        side: BorderSide(color: lucy.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(LucySpacing.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.12),
                      borderRadius:
                          BorderRadius.circular(LucySpacing.radiusMedium),
                    ),
                    child: Icon(_icon, color: accent, size: 22),
                  ),
                  const SizedBox(width: LucySpacing.spaceMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: scheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: LucySpacing.spaceXs),
                        Text(
                          metaLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  if (onDelete != null && deleteLabel != null)
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, size: 20),
                      onSelected: (value) {
                        if (value == 'delete') {
                          onDelete?.call();
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'delete',
                          child: Text(deleteLabel!),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: LucySpacing.spaceMd),
              Row(
                children: [
                  LucyChip(
                    label: typeLabel,
                    variant: _chipVariant,
                    icon: _icon,
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right, color: accent, size: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
