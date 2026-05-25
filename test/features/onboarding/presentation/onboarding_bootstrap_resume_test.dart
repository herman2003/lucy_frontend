import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_transcript_turn.dart';
import 'package:frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:frontend/features/onboarding/utils/onboarding_question_ids.dart';

import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

void main() {
  test('bootstrap restores Firestore transcript into chat state', () async {
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
}
