import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/theme/lucy_colors.dart';
import '../../domain/entities/chat_learning_session_created.dart';

/// Inline learning session card in chat (warm gradient, design system).
class ChatLearningSessionCard extends StatelessWidget {
  const ChatLearningSessionCard({super.key, required this.session});

  final ChatLearningSessionCreated session;

  bool get _isFlashcards => session.type == 'flashcards';

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final l10n = context.l10n;
    final subtitle = _isFlashcards
        ? l10n.chatLearningSessionFlashcardsSubtitle
        : l10n.chatLearningSessionQuizSubtitle;
    final ctaLabel = _isFlashcards
        ? l10n.chatLearningSessionStartFlashcards
        : l10n.chatLearningSessionStartQuiz;
    final emoji = _isFlashcards ? '🃏' : '🎯';
    final title = session.title.trim().isNotEmpty
        ? session.title
        : (_isFlashcards
              ? l10n.chatLearningSessionFlashcardsCardTitle
              : l10n.chatLearningSessionCardTitle);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LucyColors.learningSessionCardGradient,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium + 1),
        border: Border.all(color: LucyColors.learningSessionBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LucySpacing.spaceLg,
          vertical: LucySpacing.spaceMd + 2,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: scheme.tertiary,
                borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(width: LucySpacing.spaceMd + 2),
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
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: LucyColors.learningSessionSubtitle,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: LucySpacing.spaceMd),
            _LearningSessionCta(
              label: ctaLabel,
              onPressed: () =>
                  context.push(LucyRoutePaths.quizSession(session.sessionId)),
            ),
          ],
        ),
      ),
    );
  }
}

class _LearningSessionCta extends StatelessWidget {
  const _LearningSessionCta({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Material(
      color: scheme.tertiary,
      borderRadius: BorderRadius.circular(9),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(9),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucySpacing.spaceLg,
            vertical: LucySpacing.spaceSm + 1,
          ),
          child: Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
