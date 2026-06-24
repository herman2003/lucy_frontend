import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../domain/entities/chat_learning_session_created.dart';

class ChatLearningSessionCard extends StatelessWidget {
  const ChatLearningSessionCard({super.key, required this.session});

  final ChatLearningSessionCreated session;

  bool get _isFlashcards => session.type == 'flashcards';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
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
      margin: const EdgeInsets.only(bottom: LucyConstants.kSpacingMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.25)),
        color: scheme.primaryContainer.withValues(alpha: 0.22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: scheme.onPrimary, size: 28),
                ),
                const SizedBox(width: LucyConstants.kSpacingMedium),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardTitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: scheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: LucyConstants.kSpacingLow / 2),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            Text(
              session.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: scheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
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
