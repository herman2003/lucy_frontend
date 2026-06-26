import 'package:flutter/material.dart';

import '../../../core/localization/l10n/app_localizations.dart';
import '../domain/entities/quiz_attempt.dart';
import 'learning_session_date_formatter.dart';

/// Builds the library subtitle suffix for the last quiz attempt (LEARN-12b).
String? formatQuizLibraryLastAttemptMeta({
  required AppLocalizations l10n,
  required Locale locale,
  required QuizAttempt? attempt,
  required DateTime reference,
}) {
  if (attempt == null) {
    return null;
  }

  final dateLabel = formatLearningSessionListDate(
    l10n: l10n,
    locale: locale,
    isoTimestamp: attempt.completedAt.toUtc().toIso8601String(),
    reference: reference,
  );
  return l10n.quizLibraryLastAttemptMeta(
    attempt.scoreCorrect,
    attempt.scoreTotal,
    dateLabel,
  );
}
