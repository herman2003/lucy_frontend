import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/containers/lucy_admin_card.dart';
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
    final scheme = Theme.of(context).colorScheme;
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
    final icon = isQuiz ? Icons.quiz_outlined : Icons.style_outlined;
    final accent = isQuiz ? scheme.primary : scheme.tertiary;
    final onAccent = isQuiz ? scheme.onPrimary : scheme.onTertiary;

    return LucyAdminCard(
      title: session.title,
      subtitle: itemLabel,
      badgeLabel: typeBadge,
      dateLabel: dateLabel,
      headerIcon: icon,
      openLabel: l10n.quizLibraryOpen,
      accentColor: accent,
      iconColor: onAccent,
      onTap: onTap,
      onDelete: onDelete,
    );
  }
}
