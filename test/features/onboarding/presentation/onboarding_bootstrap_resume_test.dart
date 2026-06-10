import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/auth/domain/entities/auth_user.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_transcript_turn.dart';
import 'package:lucy_frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_local_draft.dart';

import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

void main() {
  test('bootstrap restores remote progress transcript into chat state', () async {
    const resume = OnboardingResumeProgress(
      onboardingStatus: 'in_progress',
      transcript: [
        OnboardingTranscriptTurn(
          questionId: OnboardingQuestionIds.qRole,
          questionText: 'Question rôle',
          answerText: 'Réponse rôle',
          confirmedAt: '2026-01-01T00:00:00Z',
        ),
      ],
    );

    final repository = FakeOnboardingRepository();
    final container = ProviderContainer(
      overrides: [
        ...onboardingChatTestOverrides(
          repository: repository,
          resumeProgress: resume,
          authUser: const AuthUser(uid: 'test-uid', email: 'test@example.com'),
        ),
      ],
    );
    addTearDown(container.dispose);

    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
    final notifier = container.read(onboardingChatProvider.notifier);
    await notifier.bootstrap(l10n: l10n, deviceLocale: const Locale('fr'));

    final state = container.read(onboardingChatProvider);
    expect(state.currentStepIndex, 1);
    expect(state.messagesForStep(0).last.text, 'Réponse rôle');
    expect(state.messagesForStep(1), isNotEmpty);
  });

  test('bootstrap resumes awaiting_final_confirm with pending analysis', () async {
    const profile = LearnerProfile(
      primaryRole: 'student',
      mainDomains: ['sciences'],
      learningGoal: 'exam',
      selfAssessedLevel: 'intermediate',
      explanationStyle: 'step_by_step',
      feedbackTone: 'encouraging',
      tutoringLanguage: 'fr',
    );
    const resume = OnboardingResumeProgress(
      onboardingStatus: 'awaiting_final_confirm',
      pendingLearnerProfile: profile,
      pendingSummaryForUser: 'Profil en attente de validation.',
      transcript: [],
    );

    final repository = FakeOnboardingRepository();
    final container = ProviderContainer(
      overrides: [
        ...onboardingChatTestOverrides(
          repository: repository,
          resumeProgress: resume,
          authUser: const AuthUser(uid: 'test-uid', email: 'test@example.com'),
        ),
      ],
    );
    addTearDown(container.dispose);

    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
    final notifier = container.read(onboardingChatProvider.notifier);
    await notifier.bootstrap(l10n: l10n, deviceLocale: const Locale('fr'));

    final state = container.read(onboardingChatProvider);
    expect(state.phase, OnboardingChatPhase.analysisReady);
    expect(
      state.analyzeResult,
      const OnboardingAnalyzeResult.success(
        learnerProfile: profile,
        summaryForUser: 'Profil en attente de validation.',
      ),
    );
  });

  test('bootstrap runs analyze when awaiting_analyze with full transcript', () async {
    final resume = OnboardingResumeProgress(
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
    );

    final repository = FakeOnboardingRepository(
      analyzeHandler: ({required locale, bool profileReduced = false}) async {
        return const OnboardingAnalyzeResult.success(
          learnerProfile: LearnerProfile(
            primaryRole: 'student',
            mainDomains: ['sciences'],
            learningGoal: 'exam',
            selfAssessedLevel: 'intermediate',
            explanationStyle: 'step_by_step',
            feedbackTone: 'encouraging',
            tutoringLanguage: 'fr',
          ),
          summaryForUser: 'Résumé après reprise analyze.',
        );
      },
    );

    final container = ProviderContainer(
      overrides: [
        ...onboardingChatTestOverrides(
          repository: repository,
          resumeProgress: resume,
          authUser: const AuthUser(uid: 'test-uid', email: 'test@example.com'),
        ),
      ],
    );
    addTearDown(container.dispose);

    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
    final notifier = container.read(onboardingChatProvider.notifier);
    await notifier.bootstrap(l10n: l10n, deviceLocale: const Locale('fr'));

    final state = container.read(onboardingChatProvider);
    expect(repository.analyzeCallCount, 1);
    expect(state.phase, OnboardingChatPhase.analysisReady);
    expect(state.analyzeResult, isA<OnboardingAnalyzeSuccess>());
  });

  test('bootstrap restores local draft when remote progress is empty', () async {
    const draft = OnboardingLocalDraft(
      uid: 'test-uid',
      uiLocale: 'fr',
      answerDraft: 'Ma réponse en cours',
      currentStepIndex: 0,
      currentQuestionId: OnboardingQuestionIds.qRole,
      activeQuestionText: 'Question rôle',
      phaseName: 'awaitingAnswer',
    );

    final localDrafts = {
      'test-uid': draft,
    };

    final container = ProviderContainer(
      overrides: [
        ...onboardingChatTestOverrides(
          repository: FakeOnboardingRepository(),
          resumeProgress: null,
          authUser: const AuthUser(uid: 'test-uid', email: 'test@example.com'),
          localDrafts: localDrafts,
        ),
      ],
    );
    addTearDown(container.dispose);

    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
    final notifier = container.read(onboardingChatProvider.notifier);
    await notifier.bootstrap(l10n: l10n, deviceLocale: const Locale('fr'));

    final state = container.read(onboardingChatProvider);
    expect(state.answerDraft, 'Ma réponse en cours');
    expect(state.currentQuestionId, OnboardingQuestionIds.qRole);
  });
}
