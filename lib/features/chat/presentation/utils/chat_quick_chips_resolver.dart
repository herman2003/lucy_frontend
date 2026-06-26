import '../../../../core/localization/l10n/app_localizations.dart';
import '../../domain/entities/chat_quick_chip.dart';

List<ChatQuickChip> resolveChatQuickChips({
  required AppLocalizations l10n,
  String? lastAssistantMessageContent,
}) {
  final normalized = lastAssistantMessageContent?.toLowerCase().trim() ?? '';

  if (normalized.isEmpty) {
    return _defaultChips(l10n);
  }

  if (_matchesLaunchConfirm(normalized)) {
    return _yesCancelChips(l10n);
  }
  if (_matchesTypeConfirm(normalized)) {
    return _yesCancelChips(l10n);
  }
  if (_matchesFocusSelection(normalized)) {
    return _focusSelectionChips(l10n);
  }
  if (_matchesItemCount(normalized)) {
    return [_asYouLikeChip(l10n)];
  }
  if (_matchesRevisionPlanFollowUp(normalized)) {
    return _revisionFollowUpChips(l10n);
  }

  return _defaultChips(l10n);
}

bool _matchesTypeConfirm(String content) {
  return content.contains('c’est bien ça') ||
      content.contains("c'est bien ça") ||
      content.contains('is that right') ||
      content.contains('stimmt das');
}

bool _matchesLaunchConfirm(String content) {
  return content.contains('je lance') ||
      content.contains('**récap**') ||
      content.contains('should i generate') ||
      content.contains('soll ich starten') ||
      content.contains('to generate or');
}

bool _matchesFocusSelection(String content) {
  return content.contains('quelles parties') ||
      content.contains('which parts') ||
      content.contains('welche teile');
}

bool _matchesItemCount(String content) {
  return content.contains('combien de') ||
      content.contains('how many') ||
      content.contains('wie viele');
}

bool _matchesRevisionPlanFollowUp(String content) {
  return content.contains('prochaines étapes') ||
      content.contains('next steps') ||
      content.contains('nächste schritte');
}

List<ChatQuickChip> _defaultChips(AppLocalizations l10n) => [
  ChatQuickChip(
    label: l10n.chatSuggestionSummarize,
    message: l10n.chatSuggestionSummarize,
  ),
  ChatQuickChip(
    label: l10n.chatSuggestionQuiz,
    message: l10n.chatSuggestionQuiz,
  ),
  ChatQuickChip(
    label: l10n.chatSuggestionFlashcards,
    message: l10n.chatSuggestionFlashcards,
  ),
  ChatQuickChip(
    label: l10n.chatSuggestionRevisionPlan,
    message: l10n.chatSuggestionRevisionPlan,
  ),
  ChatQuickChip(
    label: l10n.chatSuggestionExplain,
    message: l10n.chatSuggestionExplain,
  ),
];

List<ChatQuickChip> _revisionFollowUpChips(AppLocalizations l10n) => [
  ChatQuickChip(
    label: l10n.chatSuggestionQuiz,
    message: l10n.chatSuggestionQuiz,
  ),
  ChatQuickChip(
    label: l10n.chatSuggestionFlashcards,
    message: l10n.chatSuggestionFlashcards,
  ),
];

List<ChatQuickChip> _yesCancelChips(AppLocalizations l10n) => [
  ChatQuickChip(
    label: l10n.chatQuickChipYes,
    message: l10n.chatQuickChipYesMessage,
  ),
  ChatQuickChip(
    label: l10n.chatQuickChipCancel,
    message: l10n.chatQuickChipCancelMessage,
  ),
];

List<ChatQuickChip> _focusSelectionChips(AppLocalizations l10n) => [
  ChatQuickChip(
    label: l10n.chatQuickChipAll,
    message: l10n.chatQuickChipAllMessage,
  ),
  ChatQuickChip(
    label: l10n.chatQuickChipMostImportant,
    message: l10n.chatQuickChipMostImportantMessage,
  ),
];

ChatQuickChip _asYouLikeChip(AppLocalizations l10n) => ChatQuickChip(
  label: l10n.chatQuickChipAsYouLike,
  message: l10n.chatQuickChipAsYouLikeMessage,
);
