import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/onboarding_analyze_result.dart';
import '../../../domain/entities/onboarding_chat_message.dart';
import '../../../domain/entities/onboarding_completed_turn.dart';

part 'onboarding_chat_state.freezed.dart';

enum OnboardingChatPhase {
  awaitingAnswer,
  validating,
  awaitingConfirmation,
  confirming,
  analyzing,
  analysisReady,
}

@freezed
abstract class OnboardingChatState with _$OnboardingChatState {
  const OnboardingChatState._();

  const factory OnboardingChatState({
    @Default(false) bool isInitialized,
    @Default(0) int currentStepIndex,
    @Default('') String currentQuestionId,
    @Default('') String activeQuestionText,
    @Default([]) List<OnboardingChatMessage> messages,
    @Default(OnboardingChatPhase.awaitingAnswer) OnboardingChatPhase phase,
    @Default('') String answerDraft,
    @Default(false) bool isSubmitting,
    String? pendingTurnSummary,
    String? pendingAnswerText,
    @Default([]) List<OnboardingCompletedTurn> completedTurns,
    OnboardingAnalyzeResult? analyzeResult,
  }) = _OnboardingChatState;

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
}
