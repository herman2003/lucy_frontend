import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/lucy/lucy_chip.dart';
import '../../domain/entities/chat_learning_session_created.dart';

class ChatLearningSessionCard extends StatelessWidget {
  const ChatLearningSessionCard({super.key, required this.session});

  final ChatLearningSessionCreated session;

  bool get _isFlashcards => session.type == 'flashcards';

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final l10n = context.l10n;
    final cardTitle = _isFlashcards
        ? l10n.chatLearningSessionFlashcardsCardTitle
        : l10n.chatLearningSessionCardTitle;
    final subtitle = _isFlashcards
        ? l10n.chatLearningSessionFlashcardsSubtitle
        : l10n.chatLearningSessionQuizSubtitle;
    final ctaLabel = _isFlashcards
        ? l10n.chatLearningSessionStartFlashcards
        : l10n.chatLearningSessionStartQuiz;
    final typeLabel = _isFlashcards
        ? l10n.quizLibraryTypeFlashcards
        : l10n.quizLibraryTypeQuiz;
    final icon = _isFlashcards ? Icons.style_outlined : Icons.quiz_outlined;
    final accent = _isFlashcards ? scheme.tertiary : scheme.primary;

    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        side: BorderSide(color: lucy.border),
      ),
      clipBehavior: Clip.antiAlias,
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
                  child: Icon(icon, color: accent, size: 22),
                ),
                const SizedBox(width: LucySpacing.spaceMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardTitle,
                        style: context.textTheme.titleSmall?.copyWith(
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: LucySpacing.spaceXs),
                      Text(
                        subtitle,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: lucy.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: LucySpacing.spaceMd),
            Text(
              session.title,
              style: context.textTheme.titleSmall?.copyWith(
                color: scheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceMd),
            Row(
              children: [
                LucyChip(
                  label: typeLabel,
                  variant: _isFlashcards
                      ? LucyChipVariant.neutral
                      : LucyChipVariant.teal,
                  icon: icon,
                ),
              ],
            ),
            const SizedBox(height: LucySpacing.spaceLg),
            LucyPrimaryButton(
              text: ctaLabel,
              onPressed: () =>
                  context.push(LucyRoutePaths.quizSession(session.sessionId)),
            ),
          ],
        ),
      ),
    );
  }
}
