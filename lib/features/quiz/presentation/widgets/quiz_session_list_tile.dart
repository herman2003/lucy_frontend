import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_quiz_hub_card.dart';
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
    final l10n = context.l10n;
    final isQuiz = session.type == LearningSessionType.quiz;
    final itemLabel = isQuiz
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

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LucySpacing.spaceLg,
        vertical: LucySpacing.spaceXs,
      ),
      child: LucyQuizHubCard(
        title: session.title,
        metaLabel: '$itemLabel · $dateLabel',
        typeLabel: typeBadge,
        type: isQuiz
            ? LucyQuizHubCardType.quiz
            : LucyQuizHubCardType.flashcards,
        onTap: onTap,
      ),
    );
  }
}
