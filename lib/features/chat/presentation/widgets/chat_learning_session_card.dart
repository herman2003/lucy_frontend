import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
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
    final icon = _isFlashcards ? Icons.style_outlined : Icons.quiz_outlined;

    return Container(
      margin: const EdgeInsets.only(bottom: LucySpacing.spaceMd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        border: Border.all(
          color: lucy.tealChipForeground.withValues(alpha: 0.4),
        ),
        color: lucy.tealChipBackground.withValues(alpha: 0.35),
      ),
      child: Padding(
        padding: const EdgeInsets.all(LucySpacing.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(LucySpacing.spaceSm + 2),
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: scheme.onPrimary, size: 24),
                ),
                const SizedBox(width: LucySpacing.spaceMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardTitle,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.w700,
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
            const SizedBox(height: LucySpacing.spaceLg),
            Text(
              session.title,
              style: context.textTheme.titleSmall?.copyWith(
                color: scheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceLg),
            SizedBox(
              width: double.infinity,
              child: LucyPrimaryButton(
                text: ctaLabel,
                width: MediaQuery.sizeOf(context).width,
                onPressed: () =>
                    context.push(LucyRoutePaths.quizSession(session.sessionId)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
