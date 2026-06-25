import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_quiz_hub_card.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/entities/learning_session_type.dart';
import '../../utils/learning_session_date_formatter.dart';

class QuizSessionCard extends StatelessWidget {
  const QuizSessionCard({
    super.key,
    required this.session,
    required this.onTap,
    this.onDelete,
  });

  final LearningSessionListItem session;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isQuiz = session.type == LearningSessionType.quiz;
    final dateLabel = formatLearningSessionListDate(
      l10n: l10n,
      locale: Localizations.localeOf(context),
      isoTimestamp: session.createdAt,
      reference: DateTime.now(),
    );
    final metaLabel = isQuiz
        ? '${l10n.quizSessionQuestionCount(session.itemCount)} · ${l10n.quizSessionFormatQcm}'
        : l10n.quizLibraryFlashcardsMeta(session.itemCount);
    final typeBadge = isQuiz
        ? l10n.quizLibraryTypeQuiz
        : l10n.quizLibraryTypeFlashcards;
    final ctaLabel = isQuiz
        ? l10n.quizLibraryStartQuiz
        : l10n.quizLibraryOpenFlashcards;

    return LucyQuizHubCard(
      title: session.title,
      metaLabel: metaLabel,
      typeLabel: typeBadge,
      dateLabel: dateLabel,
      ctaLabel: ctaLabel,
      type: isQuiz
          ? LucyQuizHubCardType.quiz
          : LucyQuizHubCardType.flashcards,
      onTap: onTap,
      onDelete: onDelete,
      deleteLabel: onDelete != null ? l10n.quizLibraryDeleteAction : null,
    );
  }
}
