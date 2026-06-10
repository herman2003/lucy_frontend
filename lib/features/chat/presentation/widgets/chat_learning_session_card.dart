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

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return Card(
      color: scheme.surface,
      margin: const EdgeInsets.only(bottom: LucyConstants.kSpacingMedium),
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.chatLearningSessionCardTitle,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLow),
            Text(
              session.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: scheme.onSurface,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyPrimaryButton(
              text: l10n.chatLearningSessionOpen,
              onPressed: () => context.push(
                LucyRoutePaths.quizSession(session.sessionId),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
