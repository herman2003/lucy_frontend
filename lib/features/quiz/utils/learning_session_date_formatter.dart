import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/localization/l10n/app_localizations.dart';

/// Formats a learning session [isoTimestamp] for library list subtitles.
String formatLearningSessionListDate({
  required AppLocalizations l10n,
  required Locale locale,
  required String isoTimestamp,
  required DateTime reference,
}) {
  final parsed = DateTime.parse(isoTimestamp).toLocal();
  final today = DateTime(reference.year, reference.month, reference.day);
  final sessionDay = DateTime(parsed.year, parsed.month, parsed.day);
  final diffDays = today.difference(sessionDay).inDays;

  if (diffDays == 0) {
    return l10n.quizLibraryDateToday;
  }
  if (diffDays == 1) {
    return l10n.quizLibraryDateYesterday;
  }
  if (diffDays < 7) {
    return DateFormat.EEEE(locale.toLanguageTag()).format(parsed);
  }
  return DateFormat.yMd(locale.toLanguageTag()).format(parsed);
}
