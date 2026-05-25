import 'onboarding_completed_turn.dart';

/// In-progress onboarding mirror in local storage (SPEC §4.7 A16).
class OnboardingLocalDraft {
  const OnboardingLocalDraft({
    required this.uid,
    required this.uiLocale,
    required this.answerDraft,
    required this.currentStepIndex,
    required this.currentQuestionId,
    required this.activeQuestionText,
    required this.phaseName,
    this.pendingTurnSummary,
    this.pendingAnswerText,
    this.isFallbackConfirmation = false,
    this.completedTurns = const [],
  });

  final String uid;
  final String uiLocale;
  final String answerDraft;
  final int currentStepIndex;
  final String currentQuestionId;
  final String activeQuestionText;
  final String phaseName;
  final String? pendingTurnSummary;
  final String? pendingAnswerText;
  final bool isFallbackConfirmation;
  final List<OnboardingCompletedTurn> completedTurns;

  bool get hasResumableContent =>
      completedTurns.isNotEmpty ||
      answerDraft.trim().isNotEmpty ||
      (pendingTurnSummary?.trim().isNotEmpty ?? false);

}
