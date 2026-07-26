import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/localization/l10n/app_localizations.dart';
import '../../domain/entities/onboarding_analyze_result.dart';
import '../../domain/entities/onboarding_resume_progress.dart';
import '../../domain/entities/onboarding_chat_message.dart';
import '../../domain/entities/onboarding_completed_turn.dart';
import '../../domain/entities/validate_answer_result.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../domain/providers/onboarding_provider.dart';
import '../../utils/onboarding_api_locale.dart';
import '../../utils/onboarding_local_draft_factory.dart';
import '../../utils/onboarding_local_draft_state_builder.dart';
import '../../utils/onboarding_resume_state_builder.dart';
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

  /// Loads Firestore progress when present, otherwise starts at question 1 (Q3).
  Future<void> bootstrap({
    required AppLocalizations l10n,
    required Locale deviceLocale,
  }) async {
    if (state.isInitialized) {
      return;
    }
    _apiLocale = resolveOnboardingApiLocale(deviceLocale);
    final service = ref.read(onboardingServiceProvider);
    await service.saveUiLocale(_apiLocale);

    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    final progress = await service.fetchResumeProgress(uid: uid);

    if (progress != null && _shouldResumeFromProgress(progress)) {
      state = buildOnboardingResumeState(l10n: l10n, progress: progress);
      if (shouldResumeAnalyze(progress)) {
        await _runAnalyze();
      }
      await _mirrorLocalDraft();
      return;
    }

    if (uid != null) {
      final draft = await service.loadLocalDraft(uid: uid);
      if (draft != null && draft.hasResumableContent) {
        state = buildOnboardingStateFromLocalDraft(l10n: l10n, draft: draft);
        return;
      }
    }

    await _initializeFresh(l10n);
  }

  void initialize({
    required AppLocalizations l10n,
    required Locale deviceLocale,
  }) {
    if (state.isInitialized) {
      return;
    }
    _apiLocale = resolveOnboardingApiLocale(deviceLocale);
    state = _freshChatState(l10n);
  }

  Future<void> _initializeFresh(AppLocalizations l10n) async {
    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    if (uid != null) {
      await ref.read(onboardingServiceProvider).clearLocalDraft(uid: uid);
    }

    state = _freshChatState(l10n);
  }

  OnboardingChatState _freshChatState(AppLocalizations l10n) {
    final questionId = OnboardingQuestionIds.ordered.first;
    final questionText = onboardingQuestionText(l10n, questionId);
    return OnboardingChatState(
      isInitialized: true,
      currentStepIndex: 0,
      currentQuestionId: questionId,
      activeQuestionText: questionText,
      messagesByQuestionId: {
        questionId: [
          OnboardingChatMessage(isFromLucy: true, text: questionText),
        ],
      },
    );
  }

  void updateAnswerDraft(String value) {
    state = state.copyWith(answerDraft: value);
    unawaited(_mirrorLocalDraft());
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
      messagesByQuestionId: _replaceThread(questionId, [
        ..._threadFor(questionId),
        userMessage,
      ]),
      answerDraft: '',
      phase: OnboardingChatPhase.validating,
      isSubmitting: true,
    );

    try {
      final result = await ref
          .read(onboardingServiceProvider)
          .validateAnswer(
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
      final confirmResult = await ref
          .read(onboardingServiceProvider)
          .confirmTurn(
            locale: _apiLocale,
            questionId: state.currentQuestionId,
            answerText: answer,
            confirmationType: state.isFallbackConfirmation
                ? 'fallback'
                : 'normal',
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
        if (state.showRegenerateProfile) {
          state = state.copyWith(
            phase: OnboardingChatPhase.awaitingRegenerateProfile,
            isSubmitting: false,
          );
          return;
        }
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
      final result = await ref
          .read(onboardingServiceProvider)
          .validateAnswer(
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
      messagesByQuestionId: _replaceThread(questionId, [
        ..._threadFor(questionId),
        summaryMessage,
      ]),
      pendingTurnSummary: turnSummary,
      pendingAnswerText: answer,
      isFallbackConfirmation: isFallback,
      phase: OnboardingChatPhase.awaitingConfirmation,
      isSubmitting: false,
    );
    unawaited(_mirrorLocalDraft());
  }

  void _handleNeedsRetry(String rephrasedQuestion) {
    final lucyMessage = OnboardingChatMessage(
      isFromLucy: true,
      text: rephrasedQuestion,
    );
    final questionId = state.currentQuestionId;
    state = state.copyWith(
      activeQuestionText: rephrasedQuestion,
      messagesByQuestionId: _replaceThread(questionId, [
        ..._threadFor(questionId),
        lucyMessage,
      ]),
      phase: OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
    );
    unawaited(_mirrorLocalDraft());
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
    unawaited(_mirrorLocalDraft());
  }

  Future<void> retryAnalyzeWithReducedProfile() async {
    state = state.copyWith(
      phase: OnboardingChatPhase.analyzing,
      isSubmitting: true,
      analyzeResult: null,
    );

    try {
      final result = await ref
          .read(onboardingServiceProvider)
          .analyze(locale: _apiLocale, profileReduced: true);

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
        messagesByQuestionId: _replaceThread(questionId, [
          ..._threadFor(questionId),
          analyzeMessage,
        ]),
      );
    } catch (error) {
      state = state.copyWith(
        phase: OnboardingChatPhase.analysisReady,
        isSubmitting: false,
      );
      rethrow;
    }
  }

  /// Re-opens a completed step for editing without clearing other chats (SPEC §4.5, UX-5).
  void beginEditCompletedStep({
    required int stepIndex,
    required AppLocalizations l10n,
  }) {
    if (stepIndex < 0 ||
        stepIndex >= OnboardingQuestionIds.ordered.length ||
        stepIndex >= state.currentStepIndex) {
      return;
    }

    final questionId = OnboardingQuestionIds.ordered[stepIndex];
    final hadAnalysis = state.analyzeResult != null;
    final preservedTurns = state.completedTurns
        .where(
          (turn) =>
              OnboardingQuestionIds.ordered.indexOf(turn.questionId) <
              stepIndex,
        )
        .toList();

    OnboardingCompletedTurn? existingTurn;
    for (final turn in state.completedTurns) {
      if (turn.questionId == questionId) {
        existingTurn = turn;
        break;
      }
    }
    final questionText =
        existingTurn?.questionText ?? onboardingQuestionText(l10n, questionId);

    state = state.copyWith(
      currentStepIndex: stepIndex,
      currentQuestionId: questionId,
      activeQuestionText: questionText,
      completedTurns: preservedTurns,
      analyzeResult: null,
      showRegenerateProfile: hadAnalysis || state.showRegenerateProfile,
      phase: OnboardingChatPhase.awaitingAnswer,
      pendingTurnSummary: null,
      pendingAnswerText: null,
      isFallbackConfirmation: false,
      isSubmitting: false,
      answerDraft: '',
    );
  }

  Future<void> regenerateProfile() async {
    state = state.copyWith(showRegenerateProfile: false);
    await _runAnalyze();
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
      showRegenerateProfile: state.showRegenerateProfile,
    );
  }

  bool get _allOnboardingStepsCompleted =>
      state.completedTurns.length >= OnboardingQuestionIds.stepCount;

  void _setStateAfterAnalyzeFailure() {
    state = state.copyWith(
      phase: _allOnboardingStepsCompleted
          ? OnboardingChatPhase.awaitingRegenerateProfile
          : OnboardingChatPhase.awaitingAnswer,
      isSubmitting: false,
      showRegenerateProfile:
          _allOnboardingStepsCompleted || state.showRegenerateProfile,
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
        messagesByQuestionId: _replaceThread(questionId, [
          ..._threadFor(questionId),
          summaryMessage,
        ]),
        analyzeResult: result,
        phase: OnboardingChatPhase.analysisReady,
        isSubmitting: false,
      );
    } catch (error) {
      _setStateAfterAnalyzeFailure();
      rethrow;
    }
  }

  void _showValidationSnackBar(BuildContext context, String message) {
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _mirrorLocalDraft() async {
    final uid = ref.read(authRepositoryProvider).currentUser?.uid;
    if (uid == null || !state.isInitialized) {
      return;
    }
    await ref
        .read(onboardingServiceProvider)
        .saveLocalDraft(
          onboardingLocalDraftFromChatState(
            uid: uid,
            uiLocale: _apiLocale,
            state: state,
          ),
        );
  }

  bool _shouldResumeFromProgress(OnboardingResumeProgress progress) {
    if (progress.transcript.isNotEmpty) {
      return true;
    }
    return progress.onboardingStatus == 'awaiting_final_confirm' &&
        progress.pendingLearnerProfile != null &&
        progress.pendingSummaryForUser != null;
  }
}
