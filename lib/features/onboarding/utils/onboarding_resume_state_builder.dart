import '../../../../core/localization/l10n/app_localizations.dart';
import '../domain/entities/onboarding_analyze_result.dart';
import '../domain/entities/onboarding_chat_message.dart';
import '../domain/entities/onboarding_completed_turn.dart';
import '../domain/entities/onboarding_resume_progress.dart';
import '../presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'onboarding_question_ids.dart';
import 'onboarding_question_l10n.dart';

/// True when Firestore says all turns are done and [analyze] should run (SPEC Q3).
bool shouldResumeAnalyze(OnboardingResumeProgress progress) {
  return progress.onboardingStatus == 'awaiting_analyze' &&
      progress.transcript.length >= OnboardingQuestionIds.stepCount;
}

/// Rebuilds chat UI state from Firestore transcript (SPEC §4.5 Q3).
OnboardingChatState buildOnboardingResumeState({
  required AppLocalizations l10n,
  required OnboardingResumeProgress progress,
}) {
  final transcriptById = {
    for (final turn in progress.transcript) turn.questionId: turn,
  };

  final completedTurns = <OnboardingCompletedTurn>[];
  final messagesByQuestionId = <String, List<OnboardingChatMessage>>{};

  for (final questionId in OnboardingQuestionIds.ordered) {
    final turn = transcriptById[questionId];
    if (turn == null) {
      break;
    }
    completedTurns.add(
      OnboardingCompletedTurn(
        questionId: turn.questionId,
        questionText: turn.questionText,
        answerText: turn.answerText,
        turnSummary: turn.answerText,
      ),
    );
    messagesByQuestionId[questionId] = [
      OnboardingChatMessage(isFromLucy: true, text: turn.questionText),
      OnboardingChatMessage(isFromLucy: false, text: turn.answerText),
    ];
  }

  final stepIndex = completedTurns.length.clamp(
    0,
    OnboardingQuestionIds.stepCount - 1,
  );
  final currentQuestionId = OnboardingQuestionIds.ordered[stepIndex];

  if (!messagesByQuestionId.containsKey(currentQuestionId)) {
    final questionText = onboardingQuestionText(l10n, currentQuestionId);
    messagesByQuestionId[currentQuestionId] = [
      OnboardingChatMessage(isFromLucy: true, text: questionText),
    ];
  }

  final pendingProfile = progress.pendingLearnerProfile;
  final pendingSummary = progress.pendingSummaryForUser;
  if (progress.onboardingStatus == 'awaiting_final_confirm' &&
      pendingProfile != null &&
      pendingSummary != null) {
    final lastStepIndex = OnboardingQuestionIds.stepCount - 1;
    return OnboardingChatState(
      isInitialized: true,
      currentStepIndex: lastStepIndex,
      currentQuestionId: OnboardingQuestionIds.ordered[lastStepIndex],
      activeQuestionText: onboardingQuestionText(
        l10n,
        OnboardingQuestionIds.ordered[lastStepIndex],
      ),
      messagesByQuestionId: messagesByQuestionId,
      completedTurns: completedTurns,
      phase: OnboardingChatPhase.analysisReady,
      analyzeResult: OnboardingAnalyzeResult.success(
        learnerProfile: pendingProfile,
        summaryForUser: pendingSummary,
      ),
    );
  }

  if (shouldResumeAnalyze(progress)) {
    final lastStepIndex = OnboardingQuestionIds.stepCount - 1;
    final lastQuestionId = OnboardingQuestionIds.ordered[lastStepIndex];
    return OnboardingChatState(
      isInitialized: true,
      currentStepIndex: lastStepIndex,
      currentQuestionId: lastQuestionId,
      activeQuestionText: onboardingQuestionText(l10n, lastQuestionId),
      messagesByQuestionId: messagesByQuestionId,
      completedTurns: completedTurns,
      phase: OnboardingChatPhase.analyzing,
      isSubmitting: true,
    );
  }

  return OnboardingChatState(
    isInitialized: true,
    currentStepIndex: stepIndex,
    currentQuestionId: currentQuestionId,
    activeQuestionText: onboardingQuestionText(l10n, currentQuestionId),
    messagesByQuestionId: messagesByQuestionId,
    completedTurns: completedTurns,
    phase: OnboardingChatPhase.awaitingAnswer,
  );
}
