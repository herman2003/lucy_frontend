import '../../../core/localization/l10n/app_localizations.dart';
import '../domain/entities/learning_session_item.dart';

const _maxTopics = 3;
const _maxTopicLength = 72;

/// Builds the chat message to request flashcards on quiz weak points (LEARN-10a).
String buildQuizWeakPointsFlashcardsMessage({
  required AppLocalizations l10n,
  required List<LearningSessionItem> incorrectItems,
}) {
  if (incorrectItems.isEmpty) {
    return '';
  }

  final topics = incorrectItems
      .map((item) => item.question?.trim() ?? '')
      .where((question) => question.isNotEmpty)
      .take(_maxTopics)
      .map(_truncateTopic)
      .join(' ; ');

  if (topics.isEmpty) {
    return '';
  }

  return l10n.quizSessionWeakPointsFlashcardsMessage(topics);
}

String _truncateTopic(String value) {
  if (value.length <= _maxTopicLength) {
    return value;
  }
  return '${value.substring(0, _maxTopicLength - 1)}…';
}
