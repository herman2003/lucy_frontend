import '../domain/entities/onboarding_completed_turn.dart';
import '../domain/entities/onboarding_local_draft.dart';
import '../presentation/pages/onboarding_chat/onboarding_chat_state.dart';

OnboardingLocalDraft onboardingLocalDraftFromChatState({
  required String uid,
  required String uiLocale,
  required OnboardingChatState state,
}) {
  return OnboardingLocalDraft(
    uid: uid,
    uiLocale: uiLocale,
    answerDraft: state.answerDraft,
    currentStepIndex: state.currentStepIndex,
    currentQuestionId: state.currentQuestionId,
    activeQuestionText: state.activeQuestionText,
    phaseName: state.phase.name,
    pendingTurnSummary: state.pendingTurnSummary,
    pendingAnswerText: state.pendingAnswerText,
    isFallbackConfirmation: state.isFallbackConfirmation,
    completedTurns: List<OnboardingCompletedTurn>.from(state.completedTurns),
  );
}
