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
    required this.dateLabel,
    required this.ctaLabel,
    required this.type,
    super.key,
    this.onTap,
    this.onDelete,
    this.deleteLabel,
  });

  final String title;
  final String metaLabel;
  final String typeLabel;
  final String dateLabel;
  final String ctaLabel;
  final LucyQuizHubCardType type;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final String? deleteLabel;

  String get _typeEmoji => switch (type) {
        LucyQuizHubCardType.quiz => '🎯',
        LucyQuizHubCardType.flashcards => '🗂',
      };

  LucyChipVariant get _chipVariant => switch (type) {
        LucyQuizHubCardType.quiz => LucyChipVariant.warm,
        LucyQuizHubCardType.flashcards => LucyChipVariant.teal,
      };

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        side: BorderSide(color: lucy.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(LucySpacing.spaceLg + 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                LucyChip(
                  label: '$_typeEmoji $typeLabel',
                  variant: _chipVariant,
                ),
                const SizedBox(width: LucySpacing.spaceSm),
                Expanded(
                  child: Text(
                    dateLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: lucy.faint,
                    ),
                  ),
                ),
                if (onDelete != null && deleteLabel != null)
                  IconButton(
                    icon: Icon(Icons.more_vert, size: 18, color: lucy.faint),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(
                      minWidth: 28,
                      minHeight: 28,
                    ),
                    tooltip: deleteLabel,
                    onPressed: () async {
                      final box = context.findRenderObject()! as RenderBox;
                      final offset = box.localToGlobal(Offset.zero);
                      final selected = await showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          offset.dx,
                          offset.dy + box.size.height,
                          offset.dx + box.size.width,
                          offset.dy,
                        ),
                        items: [
                          PopupMenuItem(
                            value: 'delete',
                            child: Text(deleteLabel!),
                          ),
                        ],
                      );
                      if (selected == 'delete') {
                        onDelete?.call();
                      }
                    },
                  ),
              ],
            ),
            const SizedBox(height: LucySpacing.spaceMd + 1),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: LucySpacing.spaceXs + 1),
            Text(
              metaLabel,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium?.copyWith(
                color: lucy.muted,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceMd + 1),
            _HubCta(
              label: ctaLabel,
              type: type,
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _HubCta extends StatelessWidget {
  const _HubCta({
    required this.label,
    required this.type,
    required this.onPressed,
  });

  final String label;
  final LucyQuizHubCardType type;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    final isQuiz = type == LucyQuizHubCardType.quiz;

    return Material(
      color: isQuiz ? scheme.primary : scheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        side: isQuiz
            ? BorderSide.none
            : BorderSide(color: scheme.primary, width: 1.5),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: isQuiz ? LucySpacing.spaceMd - 1 : LucySpacing.spaceMd - 2,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: isQuiz ? scheme.onPrimary : scheme.primary,
              fontSize: 13.5,
            ),
          ),
        ),
      ),
    );
  }
}
