import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_completed_turn.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_local_draft.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_local_draft_state_builder.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

void main() {
  test('buildOnboardingStateFromLocalDraft restores pending confirmation', () async {
    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));

    final state = buildOnboardingStateFromLocalDraft(
      l10n: l10n,
      draft: const OnboardingLocalDraft(
        uid: 'uid-1',
        uiLocale: 'fr',
        answerDraft: '',
        currentStepIndex: 0,
        currentQuestionId: OnboardingQuestionIds.qRole,
        activeQuestionText: 'Question rôle',
        phaseName: 'awaitingConfirmation',
        pendingTurnSummary: 'Tu es étudiant.',
        pendingAnswerText: 'Je suis étudiant',
        completedTurns: [],
      ),
    );

    expect(state.phase, OnboardingChatPhase.awaitingConfirmation);
    expect(state.pendingTurnSummary, 'Tu es étudiant.');
    expect(
      state.messagesForStep(0).map((m) => m.text).toList(),
      ['Question rôle', 'Je suis étudiant', 'Tu es étudiant.'],
    );
  });

  test('buildOnboardingStateFromLocalDraft restores completed turn threads', () async {
    final l10n = await AppLocalizations.delegate.load(const Locale('fr'));

    final state = buildOnboardingStateFromLocalDraft(
      l10n: l10n,
      draft: const OnboardingLocalDraft(
        uid: 'uid-1',
        uiLocale: 'fr',
        answerDraft: 'Brouillon',
        currentStepIndex: 1,
        currentQuestionId: OnboardingQuestionIds.qDomains,
        activeQuestionText: 'Question domaines',
        phaseName: 'awaitingAnswer',
        completedTurns: [
          OnboardingCompletedTurn(
            questionId: OnboardingQuestionIds.qRole,
            questionText: 'Question rôle',
            answerText: 'Réponse rôle',
            turnSummary: 'Résumé rôle',
          ),
        ],
      ),
    );

    expect(state.answerDraft, 'Brouillon');
    expect(
      state.messagesForStep(0).map((m) => m.text).toList(),
      ['Question rôle', 'Réponse rôle'],
    );
    expect(state.messagesForStep(1), isNotEmpty);
  });
}
