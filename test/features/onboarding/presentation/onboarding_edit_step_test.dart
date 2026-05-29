import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_chat_message.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_completed_turn.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

void main() {
  test('beginEditCompletedStep keeps other step threads and truncates turns', () async {
    final container = ProviderContainer(
      overrides: onboardingProviderOverrides(
        repository: FakeOnboardingRepository(),
      ),
    );
    addTearDown(container.dispose);

    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
    final notifier = container.read(onboardingChatProvider.notifier);
    notifier.initialize(l10n: l10n, deviceLocale: const Locale('fr'));

    notifier.state = OnboardingChatState(
      isInitialized: true,
      currentStepIndex: 3,
      currentQuestionId: OnboardingQuestionIds.qLevel,
      activeQuestionText: 'Niveau?',
      messagesByQuestionId: {
        OnboardingQuestionIds.qRole: [
          const OnboardingChatMessage(isFromLucy: true, text: 'Fil rôle'),
        ],
        OnboardingQuestionIds.qDomains: [
          const OnboardingChatMessage(isFromLucy: true, text: 'Fil domaines'),
        ],
        OnboardingQuestionIds.qGoal: [
          const OnboardingChatMessage(isFromLucy: true, text: 'Fil objectif'),
        ],
        OnboardingQuestionIds.qLevel: [
          const OnboardingChatMessage(isFromLucy: true, text: 'Fil niveau'),
        ],
      },
      completedTurns: const [
        OnboardingCompletedTurn(
          questionId: OnboardingQuestionIds.qRole,
          questionText: 'Rôle',
          answerText: 'a',
          turnSummary: 's',
        ),
        OnboardingCompletedTurn(
          questionId: OnboardingQuestionIds.qDomains,
          questionText: 'Domaines',
          answerText: 'b',
          turnSummary: 's',
        ),
        OnboardingCompletedTurn(
          questionId: OnboardingQuestionIds.qGoal,
          questionText: 'Objectif',
          answerText: 'c',
          turnSummary: 's',
        ),
      ],
      analyzeResult: const OnboardingAnalyzeResult.success(
        learnerProfile: LearnerProfile(
          primaryRole: 'student',
          mainDomains: ['sciences'],
          learningGoal: 'exam',
          selfAssessedLevel: 'intermediate',
          explanationStyle: 'step_by_step',
          feedbackTone: 'encouraging',
          tutoringLanguage: 'fr',
        ),
        summaryForUser: 'Profil ok',
      ),
    );

    notifier.beginEditCompletedStep(stepIndex: 1, l10n: l10n);

    final state = container.read(onboardingChatProvider);
    expect(state.currentStepIndex, 1);
    expect(state.currentQuestionId, OnboardingQuestionIds.qDomains);
    expect(state.completedTurns, hasLength(1));
    expect(state.completedTurns.first.questionId, OnboardingQuestionIds.qRole);
    expect(state.messagesByQuestionId[OnboardingQuestionIds.qRole], isNotEmpty);
    expect(state.messagesByQuestionId[OnboardingQuestionIds.qGoal], isNotEmpty);
    expect(state.analyzeResult, isNull);
    expect(state.showRegenerateProfile, isTrue);
    expect(state.phase, OnboardingChatPhase.awaitingAnswer);
  });
}
