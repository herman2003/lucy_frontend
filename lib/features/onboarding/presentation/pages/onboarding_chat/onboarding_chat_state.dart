import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/onboarding_analyze_result.dart';
import '../../../domain/entities/onboarding_chat_message.dart';
import '../../../domain/entities/onboarding_completed_turn.dart';
import '../../../utils/onboarding_question_ids.dart';

part 'onboarding_chat_state.freezed.dart';

enum OnboardingChatPhase {
  awaitingAnswer,
  validating,
  awaitingConfirmation,
  confirming,
  analyzing,
  analysisReady,
  awaitingRegenerateProfile,
}

/// Visual state for one of the seven onboarding step dots (SPEC §4.5.1).
enum OnboardingStepStatus { completed, current, locked }

@freezed
abstract class OnboardingChatState with _$OnboardingChatState {
  const OnboardingChatState._();

  const factory OnboardingChatState({
    @Default(false) bool isInitialized,
    @Default(0) int currentStepIndex,
    @Default('') String currentQuestionId,
    @Default('') String activeQuestionText,
    @Default({}) Map<String, List<OnboardingChatMessage>> messagesByQuestionId,
    @Default(OnboardingChatPhase.awaitingAnswer) OnboardingChatPhase phase,
    @Default('') String answerDraft,
    @Default(false) bool isSubmitting,
    String? pendingTurnSummary,
    String? pendingAnswerText,
    @Default(false) bool isFallbackConfirmation,
    @Default([]) List<OnboardingCompletedTurn> completedTurns,
    OnboardingAnalyzeResult? analyzeResult,
    @Default(false) bool showRegenerateProfile,
  }) = _OnboardingChatState;

  /// Messages for the active step only (backward-compatible accessor).
  List<OnboardingChatMessage> get messages => messagesForStep(currentStepIndex);

  /// Chat thread for step [stepIndex] (`q_role` … `q_language`).
  List<OnboardingChatMessage> messagesForStep(int stepIndex) {
    if (stepIndex < 0 || stepIndex >= OnboardingQuestionIds.stepCount) {
      return const [];
    }
    final questionId = OnboardingQuestionIds.ordered[stepIndex];
    return messagesByQuestionId[questionId] ?? const [];
  }

  /// Swipe / dot tap allowed for completed steps and the current step (SPEC §4.5.1).
  bool canNavigateToStepIndex(int stepIndex) {
    if (!isInitialized) {
      return false;
    }
    if (stepIndex < 0 || stepIndex >= OnboardingQuestionIds.stepCount) {
      return false;
    }
    return stepIndex <= currentStepIndex;
  }

  OnboardingStepStatus stepStatus(int stepIndex) {
    if (stepIndex > currentStepIndex) {
      return OnboardingStepStatus.locked;
    }
    if (stepIndex < currentStepIndex) {
      return OnboardingStepStatus.completed;
    }
    return OnboardingStepStatus.current;
  }

  bool get canSendAnswer =>
      isInitialized &&
      phase == OnboardingChatPhase.awaitingAnswer &&
      !isSubmitting &&
      answerDraft.trim().isNotEmpty;

  bool get showTypingIndicator =>
      phase == OnboardingChatPhase.validating ||
      phase == OnboardingChatPhase.confirming ||
      phase == OnboardingChatPhase.analyzing;

  bool get showConfirmationActions =>
      phase == OnboardingChatPhase.awaitingConfirmation;

  bool get isAnalysisReady => phase == OnboardingChatPhase.analysisReady;

  bool get isAwaitingRegenerateProfile =>
      phase == OnboardingChatPhase.awaitingRegenerateProfile;
}
