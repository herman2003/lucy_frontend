import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_transcript_turn.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_resume_state_builder.dart';

void main() {
  test(
    'buildOnboardingResumeState restores threads and opens next step',
    () async {
      final l10n = await AppLocalizations.delegate.load(const Locale('fr'));

      final state = buildOnboardingResumeState(
        l10n: l10n,
        progress: const OnboardingResumeProgress(
          onboardingStatus: 'in_progress',
          transcript: [
            OnboardingTranscriptTurn(
              questionId: OnboardingQuestionIds.qRole,
              questionText: 'Question rôle',
              answerText: 'Je suis étudiant',
              confirmedAt: '2026-01-01T00:00:00Z',
            ),
            OnboardingTranscriptTurn(
              questionId: OnboardingQuestionIds.qDomains,
              questionText: 'Question domaines',
              answerText: 'Sciences',
              confirmedAt: '2026-01-01T00:01:00Z',
            ),
          ],
        ),
      );

      expect(state.currentStepIndex, 2);
      expect(state.currentQuestionId, OnboardingQuestionIds.qGoal);
      expect(state.completedTurns, hasLength(2));
      expect(state.messagesForStep(0).map((m) => m.text).toList(), [
        'Question rôle',
        'Je suis étudiant',
      ]);
      expect(state.messagesForStep(1).map((m) => m.text).toList(), [
        'Question domaines',
        'Sciences',
      ]);
      expect(state.messagesForStep(2), isNotEmpty);
      expect(state.phase, OnboardingChatPhase.awaitingAnswer);
    },
  );

  test(
    'buildOnboardingResumeState restores confirm screen when awaiting_final_confirm',
    () async {
      final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
      const profile = LearnerProfile(
        primaryRole: 'student',
        mainDomains: ['sciences'],
        learningGoal: 'exam',
        selfAssessedLevel: 'intermediate',
        explanationStyle: 'step_by_step',
        feedbackTone: 'encouraging',
        tutoringLanguage: 'fr',
      );

      final state = buildOnboardingResumeState(
        l10n: l10n,
        progress: OnboardingResumeProgress(
          onboardingStatus: 'awaiting_final_confirm',
          pendingLearnerProfile: profile,
          pendingSummaryForUser: 'Récap en attente.',
          transcript: List.generate(
            OnboardingQuestionIds.stepCount,
            (index) => OnboardingTranscriptTurn(
              questionId: OnboardingQuestionIds.ordered[index],
              questionText: 'Q$index',
              answerText: 'A$index',
              confirmedAt: '2026-01-01T00:0$index:00Z',
            ),
          ),
        ),
      );

      expect(state.phase, OnboardingChatPhase.analysisReady);
      expect(state.currentStepIndex, OnboardingQuestionIds.stepCount - 1);
      expect(
        state.analyzeResult,
        const OnboardingAnalyzeResult.success(
          learnerProfile: profile,
          summaryForUser: 'Récap en attente.',
        ),
      );
    },
  );

  test(
    'buildOnboardingResumeState sets analyzing when awaiting_analyze with 7 turns',
    () async {
      final l10n = await AppLocalizations.delegate.load(const Locale('fr'));

      final state = buildOnboardingResumeState(
        l10n: l10n,
        progress: OnboardingResumeProgress(
          onboardingStatus: 'awaiting_analyze',
          transcript: List.generate(
            OnboardingQuestionIds.stepCount,
            (index) => OnboardingTranscriptTurn(
              questionId: OnboardingQuestionIds.ordered[index],
              questionText: 'Q$index',
              answerText: 'A$index',
              confirmedAt: '2026-01-01T00:0$index:00Z',
            ),
          ),
        ),
      );

      expect(state.completedTurns, hasLength(7));
      expect(state.currentStepIndex, OnboardingQuestionIds.stepCount - 1);
      expect(state.phase, OnboardingChatPhase.analyzing);
      expect(state.isSubmitting, isTrue);
    },
  );
}
