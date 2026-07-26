import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/app.dart';
import 'package:lucy_frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:lucy_frontend/features/documents/presentation/pages/documents_page.dart';
import 'package:lucy_frontend/features/auth/presentation/pages/login/login_page.dart';
import 'package:lucy_frontend/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/finalize_onboarding_result.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat_page.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_confirm_page.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

import '../../../helpers/test_locales.dart';
import '../../auth/helpers/fake_auth_repository.dart';
import '../../documents/helpers/documents_test_overrides.dart';
import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

/// CP-4 — automated E2E (signup → 7 Q/R → confirm → home) with fakes.
void main() {
  tearDown(() {
    clearTestLocaleOverride();
  });

  testWidgets('signup through finalize reaches home with configured profile', (
    tester,
  ) async {
    setTestLocaleFr();
    tester.view.physicalSize = const Size(1200, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final authRepository = FakeAuthRepository(null);
    final onboardingRepository = FakeOnboardingRepository(
      validateHandler:
          ({
            required locale,
            required questionId,
            required answerText,
            bool fallbackReduced = false,
          }) async {
            return const ValidateAnswerResult.accepted(
              turnSummary: 'Résumé accepté.',
            );
          },
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
          summaryForUser: 'Tu prépares un examen en sciences.',
        );
      },
      finalizeHandler: () async {
        authRepository.isConfigured = true;
        return const FinalizeOnboardingResult();
      },
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(authRepository),
          authStateChangesProvider.overrideWith(
            (ref) => authRepository.authStateChanges(),
          ),
          ...onboardingProviderOverrides(repository: onboardingRepository),
          ...documentsProviderOverrides(),
        ],
        child: const LucyApp(),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(LoginPage), findsOneWidget);
    await tester.tap(find.text('Créer un compte'));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpPage), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Lucy E2E');
    await tester.enterText(fields.at(1), 'e2e@lucy.test');
    await tester.enterText(fields.at(2), 'password123');

    await tester.tap(find.text('Créer mon compte'));
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingChatPage), findsOneWidget);
    expect(authRepository.isConfigured, isFalse);

    for (var step = 0; step < OnboardingQuestionIds.stepCount; step++) {
      await tester.enterText(
        find.byType(TextField),
        'Réponse détaillée tour ${step + 1}.',
      );
      await tester.pump();
      await tester.tap(find.text('Envoyer'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();

      await tester.tap(find.text('C’est bon'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
    }

    expect(
      onboardingRepository.confirmCallCount,
      OnboardingQuestionIds.stepCount,
    );
    expect(onboardingRepository.analyzeCallCount, 1);
    expect(find.byType(OnboardingConfirmPage), findsOneWidget);
    expect(find.text('Tu prépares un examen en sciences.'), findsOneWidget);

    await tester.tap(find.text('Valider et continuer'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(onboardingRepository.finalizeCallCount, 1);
    expect(authRepository.isConfigured, isTrue);
    expect(find.byType(DocumentsPage), findsOneWidget);
    expect(find.text('Ajouter'), findsOneWidget);
    expect(find.byType(OnboardingChatPage), findsNothing);
  });
}
