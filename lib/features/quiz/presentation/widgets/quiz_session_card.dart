import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_quiz_hub_card.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/entities/learning_session_type.dart';
import '../../domain/entities/quiz_attempt.dart';
import '../../utils/learning_session_date_formatter.dart';
import '../../utils/quiz_attempt_formatter.dart';

class QuizSessionCard extends StatelessWidget {
  const QuizSessionCard({
    super.key,
    required this.session,
    required this.onTap,
    this.onDelete,
    this.lastAttempt,
  });

  final LearningSessionListItem session;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final QuizAttempt? lastAttempt;

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
    final attemptMeta = isQuiz
        ? formatQuizLibraryLastAttemptMeta(
            l10n: l10n,
            locale: Localizations.localeOf(context),
            attempt: lastAttempt,
            reference: DateTime.now(),
          )
        : null;
    final metaLabel = isQuiz
        ? [
            l10n.quizSessionQuestionCount(session.itemCount),
            l10n.quizSessionFormatQcm,
            ?attemptMeta,
          ].join(' · ')
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
      type: isQuiz ? LucyQuizHubCardType.quiz : LucyQuizHubCardType.flashcards,
      onTap: onTap,
      onDelete: onDelete,
      deleteLabel: onDelete != null ? l10n.quizLibraryDeleteAction : null,
    );
  }
}
