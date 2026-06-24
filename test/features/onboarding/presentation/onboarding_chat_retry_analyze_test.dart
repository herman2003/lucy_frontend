import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';

import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

void main() {
  test(
    'retryAnalyzeWithReducedProfile calls analyze with profileReduced',
    () async {
      var reducedRequested = false;
      final repository = FakeOnboardingRepository(
        analyzeHandler: ({required locale, bool profileReduced = false}) async {
          if (profileReduced) {
            reducedRequested = true;
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
              summaryForUser: 'Profil complet après retry.',
            );
          }
          return const OnboardingAnalyzeResult.fallback(
            fallbackProfileSummary: 'Profil de secours initial.',
          );
        },
      );

      final container = ProviderContainer(
        overrides: onboardingProviderOverrides(repository: repository),
      );
      addTearDown(container.dispose);

      final l10n = await AppLocalizations.delegate.load(const Locale('fr'));
      final notifier = container.read(onboardingChatProvider.notifier);
      notifier.initialize(l10n: l10n, deviceLocale: const Locale('fr'));
      notifier.state = const OnboardingChatState(
        isInitialized: true,
        analyzeResult: OnboardingAnalyzeResult.fallback(
          fallbackProfileSummary: 'Profil de secours initial.',
        ),
        phase: OnboardingChatPhase.analysisReady,
      );

      await notifier.retryAnalyzeWithReducedProfile();

      expect(reducedRequested, isTrue);
      expect(repository.lastAnalyzeProfileReduced, isTrue);
      expect(
        container.read(onboardingChatProvider).analyzeResult,
        isA<OnboardingAnalyzeSuccess>(),
      );
    },
  );
}
