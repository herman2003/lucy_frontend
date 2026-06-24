import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/entities/learning_session_type.dart';
import '../../utils/learning_session_date_formatter.dart';

class QuizSessionListTile extends StatelessWidget {
  const QuizSessionListTile({
    super.key,
    required this.session,
    required this.onTap,
  });

  final LearningSessionListItem session;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    final isQuiz = session.type == LearningSessionType.quiz;
    final typeLabel = isQuiz
        ? l10n.quizSessionQuestionCount(session.itemCount)
        : l10n.quizSessionFlashcardCount(session.itemCount);
    final dateLabel = formatLearningSessionListDate(
      l10n: l10n,
      locale: Localizations.localeOf(context),
      isoTimestamp: session.createdAt,
      reference: DateTime.now(),
    );
    final typeBadge = isQuiz
        ? l10n.quizLibraryTypeQuiz
        : l10n.quizLibraryTypeFlashcards;
    final icon = isQuiz ? Icons.quiz_outlined : Icons.style_outlined;
    final accent = isQuiz ? scheme.primary : scheme.tertiary;
    final onAccent = isQuiz ? scheme.onPrimary : scheme.onTertiary;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LucyConstants.kSpacingMedium,
        vertical: LucyConstants.kSpacingLow,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
          border: Border.all(color: accent.withValues(alpha: 0.22)),
          color: Color.alphaBlend(
            accent.withValues(alpha: 0.08),
            scheme.surface,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(
              LucyConstants.kBorderRadiusLarge,
            ),
            child: Padding(
              padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      LucyConstants.kSpacingLow + 2,
                    ),
                    decoration: BoxDecoration(
                      color: accent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: onAccent, size: 22),
                  ),
                  const SizedBox(width: LucyConstants.kSpacingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          typeBadge,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: LucyConstants.kSpacingLow / 2),
                        Text(
                          session.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: scheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: LucyConstants.kSpacingLow / 2),
                        Text(
                          '$typeLabel · $dateLabel',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: accent),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
