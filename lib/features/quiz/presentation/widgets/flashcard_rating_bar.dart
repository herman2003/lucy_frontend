import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../domain/entities/flashcard_sm2_state.dart';

class FlashcardRatingBar extends StatelessWidget {
  const FlashcardRatingBar({
    required this.onRated,
    super.key,
  });

  final ValueChanged<Sm2Quality> onRated;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.flashcardsSessionRatePrompt,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.lucyTheme.muted,
          ),
        ),
        const SizedBox(height: LucySpacing.spaceMd),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: LucySpacing.spaceSm,
          runSpacing: LucySpacing.spaceSm,
          children: [
            _RatingChip(
              label: l10n.flashcardsSessionRateAgain,
              onTap: () => onRated(Sm2Quality.again),
            ),
            _RatingChip(
              label: l10n.flashcardsSessionRateHard,
              onTap: () => onRated(Sm2Quality.hard),
            ),
            _RatingChip(
              label: l10n.flashcardsSessionRateGood,
              onTap: () => onRated(Sm2Quality.good),
            ),
            _RatingChip(
              label: l10n.flashcardsSessionRateEasy,
              onTap: () => onRated(Sm2Quality.easy),
            ),
          ],
        ),
      ],
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Material(
      color: lucy.chipBackground,
      shape: StadiumBorder(side: BorderSide(color: lucy.chipForeground.withValues(alpha: 0.25))),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucySpacing.spaceMd,
            vertical: LucySpacing.spaceSm + 2,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: lucy.chipForeground,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
