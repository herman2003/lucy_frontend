import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/localization/l10n/app_localizations.dart';
import '../../domain/entities/onboarding_analyze_result.dart';
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

  List<OnboardingChatMessage> _threadFor(String questionId) =>
      state.messagesByQuestionId[questionId] ?? const [];

  Map<String, List<OnboardingChatMessage>> _replaceThread(
    String questionId,
    List<OnboardingChatMessage> messages,
  ) {
    return {...state.messagesByQuestionId, questionId: messages};
  }

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
      messagesByQuestionId: {
        questionId: [OnboardingChatMessage(isFromLucy: true, text: questionText)],
      },
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

    final questionId = state.currentQuestionId;
    state = state.copyWith(
      messagesByQuestionId: _replaceThread(
        questionId,
        [..._threadFor(questionId), userMessage],
      ),
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
          _handleAccepted(turnSummary, answer, isFallback: false);
        case ValidateAnswerNeedsFallback(:final fallbackSummary):
          _handleAccepted(fallbackSummary, answer, isFallback: true);
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
                confirmationType:
                    state.isFallbackConfirmation ? 'fallback' : 'normal',
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
        isFallbackConfirmation: false,
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
    if (state.isFallbackConfirmation) {
      rejectFallbackSummary();
      return;
    }
    state = state.copyWith(
      pendingTurnSummary: null,
      pendingAnswerText: null,
      isFallbackConfirmation: false,
      phase: OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
    );
  }

  Future<void> rejectFallbackSummary() async {
    final answer = state.pendingAnswerText;
    if (answer == null) {
      return;
    }

    state = state.copyWith(
      pendingTurnSummary: null,
      phase: OnboardingChatPhase.validating,
      isSubmitting: true,
    );

    try {
      final result = await ref.read(onboardingServiceProvider).validateAnswer(
            locale: _apiLocale,
            questionId: state.currentQuestionId,
            answerText: answer,
            fallbackReduced: true,
          );

      switch (result) {
        case ValidateAnswerNeedsFallback(:final fallbackSummary):
          _handleAccepted(fallbackSummary, answer, isFallback: true);
        case ValidateAnswerAccepted(:final turnSummary):
          _handleAccepted(turnSummary, answer, isFallback: false);
        case ValidateAnswerNeedsRetry(:final rephrasedQuestion):
          _handleNeedsRetry(rephrasedQuestion);
      }
    } catch (error) {
      state = state.copyWith(
        phase: OnboardingChatPhase.awaitingConfirmation,
        isSubmitting: false,
      );
      rethrow;
    }
  }

  void _handleAccepted(
    String turnSummary,
    String answer, {
    required bool isFallback,
  }) {
    final summaryMessage = OnboardingChatMessage(
      isFromLucy: true,
      text: turnSummary,
    );
    final questionId = state.currentQuestionId;
    state = state.copyWith(
      messagesByQuestionId: _replaceThread(
        questionId,
        [..._threadFor(questionId), summaryMessage],
      ),
      pendingTurnSummary: turnSummary,
      pendingAnswerText: answer,
      isFallbackConfirmation: isFallback,
      phase: OnboardingChatPhase.awaitingConfirmation,
      isSubmitting: false,
    );
  }

  void _handleNeedsRetry(String rephrasedQuestion) {
    final lucyMessage = OnboardingChatMessage(
      isFromLucy: true,
      text: rephrasedQuestion,
    );
    final questionId = state.currentQuestionId;
    state = state.copyWith(
      activeQuestionText: rephrasedQuestion,
      messagesByQuestionId: _replaceThread(
        questionId,
        [..._threadFor(questionId), lucyMessage],
      ),
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
      messagesByQuestionId: {
        ...state.messagesByQuestionId,
        nextId: [OnboardingChatMessage(isFromLucy: true, text: questionText)],
      },
      phase: OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
    );
  }

  Future<void> retryAnalyzeWithReducedProfile() async {
    state = state.copyWith(
      phase: OnboardingChatPhase.analyzing,
      isSubmitting: true,
      analyzeResult: null,
    );

    try {
      final result = await ref.read(onboardingServiceProvider).analyze(
            locale: _apiLocale,
            profileReduced: true,
          );

      final summaryText = switch (result) {
        OnboardingAnalyzeSuccess(:final summaryForUser) => summaryForUser,
        OnboardingAnalyzeFallback(:final fallbackProfileSummary) =>
          fallbackProfileSummary,
      };

      final questionId = state.currentQuestionId;
      final analyzeMessage = OnboardingChatMessage(
        isFromLucy: true,
        text: summaryText,
      );
      state = state.copyWith(
        analyzeResult: result,
        phase: OnboardingChatPhase.analysisReady,
        isSubmitting: false,
        messagesByQuestionId: _replaceThread(
          questionId,
          [..._threadFor(questionId), analyzeMessage],
        ),
      );
    } catch (error) {
      state = state.copyWith(
        phase: OnboardingChatPhase.analysisReady,
        isSubmitting: false,
      );
      rethrow;
    }
  }

  void returnToEditFromConfirm(AppLocalizations l10n) {
    final lastIndex = OnboardingQuestionIds.ordered.length - 1;
    final lastId = OnboardingQuestionIds.ordered[lastIndex];
    final questionText = onboardingQuestionText(l10n, lastId);

    final preservedThreads = Map<String, List<OnboardingChatMessage>>.from(
      state.messagesByQuestionId,
    );
    if (!preservedThreads.containsKey(lastId)) {
      preservedThreads[lastId] = [
        OnboardingChatMessage(isFromLucy: true, text: questionText),
      ];
    }

    state = OnboardingChatState(
      isInitialized: true,
      currentStepIndex: lastIndex,
      currentQuestionId: lastId,
      activeQuestionText: questionText,
      messagesByQuestionId: preservedThreads,
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
      final result = await ref
          .read(onboardingServiceProvider)
          .analyze(locale: _apiLocale);

      final summaryText = switch (result) {
        OnboardingAnalyzeSuccess(:final summaryForUser) => summaryForUser,
        OnboardingAnalyzeFallback(:final fallbackProfileSummary) =>
          fallbackProfileSummary,
      };

      final summaryMessage = OnboardingChatMessage(
        isFromLucy: true,
        text: summaryText,
      );

      final questionId = state.currentQuestionId;
      state = state.copyWith(
        messagesByQuestionId: _replaceThread(
          questionId,
          [..._threadFor(questionId), summaryMessage],
        ),
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
