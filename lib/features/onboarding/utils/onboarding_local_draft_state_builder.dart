import '../../../../core/localization/l10n/app_localizations.dart';
import '../domain/entities/onboarding_chat_message.dart';
import '../domain/entities/onboarding_local_draft.dart';
import '../presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'onboarding_question_ids.dart';
import 'onboarding_question_l10n.dart';

OnboardingChatPhase _phaseFromName(String name) {
  return OnboardingChatPhase.values.firstWhere(
    (phase) => phase.name == name,
    orElse: () => OnboardingChatPhase.awaitingAnswer,
  );
}

/// Restores chat UI from local draft when Firestore has no transcript (SPEC A16).
OnboardingChatState buildOnboardingStateFromLocalDraft({
  required AppLocalizations l10n,
  required OnboardingLocalDraft draft,
}) {
  final messagesByQuestionId = <String, List<OnboardingChatMessage>>{};

  for (final turn in draft.completedTurns) {
    messagesByQuestionId[turn.questionId] = [
      OnboardingChatMessage(isFromLucy: true, text: turn.questionText),
      OnboardingChatMessage(isFromLucy: false, text: turn.answerText),
    ];
  }

  final questionId = draft.currentQuestionId;
  final phase = _phaseFromName(draft.phaseName);
  final baseThread =
      messagesByQuestionId[questionId] ??
      [OnboardingChatMessage(isFromLucy: true, text: draft.activeQuestionText)];

  final currentThread = List<OnboardingChatMessage>.from(baseThread);
  final pendingAnswer = draft.pendingAnswerText;
  final pendingSummary = draft.pendingTurnSummary;

  if (pendingAnswer != null &&
      pendingAnswer.isNotEmpty &&
      !currentThread.any((m) => !m.isFromLucy && m.text == pendingAnswer)) {
    currentThread.add(
      OnboardingChatMessage(isFromLucy: false, text: pendingAnswer),
    );
  }

  if (pendingSummary != null &&
      pendingSummary.isNotEmpty &&
      phase == OnboardingChatPhase.awaitingConfirmation) {
    currentThread.add(
      OnboardingChatMessage(isFromLucy: true, text: pendingSummary),
    );
  }

  if (currentThread.isEmpty) {
    currentThread.add(
      OnboardingChatMessage(
        isFromLucy: true,
        text: onboardingQuestionText(l10n, questionId),
      ),
    );
  }

  messagesByQuestionId[questionId] = currentThread;

  return OnboardingChatState(
    isInitialized: true,
    currentStepIndex: draft.currentStepIndex.clamp(
      0,
      OnboardingQuestionIds.stepCount - 1,
    ),
    currentQuestionId: questionId,
    activeQuestionText: draft.activeQuestionText,
    messagesByQuestionId: messagesByQuestionId,
    completedTurns: List.from(draft.completedTurns),
    phase: phase,
    answerDraft: draft.answerDraft,
    pendingTurnSummary: pendingSummary,
    pendingAnswerText: pendingAnswer,
    isFallbackConfirmation: draft.isFallbackConfirmation,
  );
}
