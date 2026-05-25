import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/localization/l10n/app_localizations.dart';
import '../../domain/entities/onboarding_chat_message.dart';
import '../../domain/entities/onboarding_completed_turn.dart';
import '../../domain/entities/validate_answer_result.dart';
import '../../domain/providers/onboarding_provider.dart';
import '../../utils/onboarding_api_locale.dart';
import '../../utils/onboarding_constants.dart';
import '../../utils/onboarding_question_ids.dart';
import '../../utils/onboarding_question_l10n.dart';
import '../pages/onboarding_chat/onboarding_chat_state.dart';

part 'onboarding_chat_notifier.g.dart';

@riverpod
class OnboardingChatNotifier extends _$OnboardingChatNotifier {
  late String _apiLocale;

  @override
  OnboardingChatState build() => const OnboardingChatState();

  void initialize({
    required AppLocalizations l10n,
    required Locale deviceLocale,
  }) {
    if (state.isInitialized) {
      return;
    }
    _apiLocale = resolveOnboardingApiLocale(deviceLocale);
    final questionId = OnboardingQuestionIds.ordered.first;
    final questionText = onboardingQuestionText(l10n, questionId);
    state = OnboardingChatState(
      isInitialized: true,
      currentStepIndex: 0,
      currentQuestionId: questionId,
      activeQuestionText: questionText,
      messages: [
        OnboardingChatMessage(isFromLucy: true, text: questionText),
      ],
    );
  }

  void updateAnswerDraft(String value) {
    state = state.copyWith(answerDraft: value);
  }

  Future<void> submitAnswer(BuildContext context) async {
    final answer = state.answerDraft.trim();
    if (!state.canSendAnswer) {
      return;
    }
    if (answer.length > OnboardingConstants.maxAnswerLength) {
      _showValidationSnackBar(
        context,
        AppLocalizations.of(context)!.onboardingAnswerTooLong,
      );
      return;
    }

    final userMessage = OnboardingChatMessage(isFromLucy: false, text: answer);

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      answerDraft: '',
      phase: OnboardingChatPhase.validating,
      isSubmitting: true,
    );

    try {
      final result = await ref.read(onboardingServiceProvider).validateAnswer(
            locale: _apiLocale,
            questionId: state.currentQuestionId,
            answerText: answer,
          );

      switch (result) {
        case ValidateAnswerAccepted(:final turnSummary):
          _handleAccepted(turnSummary, answer);
        case ValidateAnswerNeedsRetry(:final rephrasedQuestion):
          _handleNeedsRetry(rephrasedQuestion);
      }
    } catch (error) {
      state = state.copyWith(
        phase: OnboardingChatPhase.awaitingAnswer,
        isSubmitting: false,
      );
      rethrow;
    }
  }

  Future<void> confirmTurn(AppLocalizations l10n) async {
    final summary = state.pendingTurnSummary;
    final answer = state.pendingAnswerText;
    if (summary == null || answer == null) {
      return;
    }

    state = state.copyWith(
      phase: OnboardingChatPhase.confirming,
      isSubmitting: true,
    );

    try {
      final confirmResult =
          await ref.read(onboardingServiceProvider).confirmTurn(
                locale: _apiLocale,
                questionId: state.currentQuestionId,
                answerText: answer,
              );

      final completed = OnboardingCompletedTurn(
        questionId: state.currentQuestionId,
        questionText: state.activeQuestionText,
        answerText: answer,
        turnSummary: summary,
      );

      final updatedTurns = [...state.completedTurns, completed];

      state = state.copyWith(
        completedTurns: updatedTurns,
        pendingTurnSummary: null,
        pendingAnswerText: null,
      );

      if (confirmResult.onboardingStatus == 'awaiting_analyze') {
        await _runAnalyze();
        return;
      }

      _advanceToNextQuestion(l10n);
    } catch (error) {
      state = state.copyWith(
        phase: OnboardingChatPhase.awaitingConfirmation,
        isSubmitting: false,
      );
      rethrow;
    }
  }

  void rejectTurnSummary() {
    state = state.copyWith(
      pendingTurnSummary: null,
      pendingAnswerText: null,
      phase: OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
    );
  }

  void _handleAccepted(String turnSummary, String answer) {
    final summaryMessage = OnboardingChatMessage(
      isFromLucy: true,
      text: turnSummary,
    );
    state = state.copyWith(
      messages: [...state.messages, summaryMessage],
      pendingTurnSummary: turnSummary,
      pendingAnswerText: answer,
      phase: OnboardingChatPhase.awaitingConfirmation,
      isSubmitting: false,
    );
  }

  void _handleNeedsRetry(String rephrasedQuestion) {
    final lucyMessage = OnboardingChatMessage(
      isFromLucy: true,
      text: rephrasedQuestion,
    );
    state = state.copyWith(
      activeQuestionText: rephrasedQuestion,
      messages: [...state.messages, lucyMessage],
      phase: OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
    );
  }

  void _advanceToNextQuestion(AppLocalizations l10n) {
    final nextIndex = state.currentStepIndex + 1;
    if (nextIndex >= OnboardingQuestionIds.ordered.length) {
      state = state.copyWith(
        phase: OnboardingChatPhase.awaitingAnswer,
        isSubmitting: false,
      );
      return;
    }

    final nextId = OnboardingQuestionIds.ordered[nextIndex];
    final questionText = onboardingQuestionText(l10n, nextId);

    state = state.copyWith(
      currentStepIndex: nextIndex,
      currentQuestionId: nextId,
      activeQuestionText: questionText,
      messages: [OnboardingChatMessage(isFromLucy: true, text: questionText)],
      phase: OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
    );
  }

  void returnToEditFromConfirm(AppLocalizations l10n) {
    final lastIndex = OnboardingQuestionIds.ordered.length - 1;
    final lastId = OnboardingQuestionIds.ordered[lastIndex];
    final questionText = onboardingQuestionText(l10n, lastId);

    state = OnboardingChatState(
      isInitialized: true,
      currentStepIndex: lastIndex,
      currentQuestionId: lastId,
      activeQuestionText: questionText,
      messages: [OnboardingChatMessage(isFromLucy: true, text: questionText)],
      phase: OnboardingChatPhase.awaitingAnswer,
      completedTurns: state.completedTurns,
      analyzeResult: null,
    );
  }

  Future<void> _runAnalyze() async {
    state = state.copyWith(
      phase: OnboardingChatPhase.analyzing,
      isSubmitting: true,
    );

    try {
      final result =
          await ref.read(onboardingServiceProvider).analyze(locale: _apiLocale);

      final summaryMessage = OnboardingChatMessage(
        isFromLucy: true,
        text: result.summaryForUser,
      );

      state = state.copyWith(
        messages: [...state.messages, summaryMessage],
        analyzeResult: result,
        phase: OnboardingChatPhase.analysisReady,
        isSubmitting: false,
      );
    } catch (error) {
      state = state.copyWith(
        phase: OnboardingChatPhase.awaitingAnswer,
        isSubmitting: false,
      );
      rethrow;
    }
  }

  void _showValidationSnackBar(BuildContext context, String message) {
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
