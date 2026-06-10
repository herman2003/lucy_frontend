import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/entities/learning_session_type.dart';

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

    final subtitle = switch (session.type) {
      LearningSessionType.quiz => l10n.quizSessionQuestionCount(session.itemCount),
      LearningSessionType.flashcards =>
        l10n.quizSessionFlashcardCount(session.itemCount),
    };

    return Card(
      color: scheme.surface,
      margin: const EdgeInsets.symmetric(
        horizontal: LucyConstants.kSpacingMedium,
        vertical: LucyConstants.kSpacingLow,
      ),
      child: ListTile(
        title: Text(
          session.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: scheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: scheme.secondary,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: scheme.tertiary),
        onTap: onTap,
      ),
    );
  }
}
