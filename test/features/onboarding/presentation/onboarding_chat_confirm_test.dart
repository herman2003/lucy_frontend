import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat_page.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

void main() {
  setUp(() {
    setTestLocaleFr();
  });

  tearDown(clearTestLocaleOverride);

  Future<void> pumpChat(
    WidgetTester tester, {
    required FakeOnboardingRepository repository,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: onboardingChatTestOverrides(repository: repository),
        child: MaterialApp.router(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: GoRouter(
            initialLocation: LucyRoutePaths.onboarding,
            routes: [
              GoRoute(
                path: LucyRoutePaths.onboarding,
                builder: (context, state) => const OnboardingChatPage(),
              ),
              GoRoute(
                path: LucyRoutePaths.onboardingConfirm,
                builder: (context, state) =>
                    const Scaffold(body: Text('Confirm')),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  Future<void> submitAcceptedAnswer(WidgetTester tester) async {
    await tester.enterText(find.byType(TextField), 'Réponse claire.');
    await tester.pump();
    await tester.tap(find.text('Envoyer'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();
  }

  testWidgets('confirmTurn advances to second question', (tester) async {
    final repository = FakeOnboardingRepository(
      validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
        return const ValidateAnswerResult.accepted(turnSummary: 'Résumé tour 1.');
      },
    );

    await pumpChat(tester, repository: repository);
    await submitAcceptedAnswer(tester);

    await tester.tap(find.text('C’est bon'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(repository.confirmCallCount, 1);
    expect(find.text('2 / 7'), findsOneWidget);
    expect(find.textContaining('domaines'), findsOneWidget);
    expect(repository.analyzeCallCount, 0);
  });

  testWidgets('after seventh confirm calls analyze and shows summary', (
    tester,
  ) async {
    const analyzeSummary = 'Tu prépares un examen en sciences.';

    final repository = FakeOnboardingRepository(
      validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
        return const ValidateAnswerResult.accepted(turnSummary: 'OK');
      },
      analyzeHandler: ({required locale, bool profileReduced = false}) async {
        return OnboardingAnalyzeResult.success(
          learnerProfile: const LearnerProfile(
            primaryRole: 'student',
            mainDomains: ['sciences'],
            learningGoal: 'exam',
            selfAssessedLevel: 'intermediate',
            explanationStyle: 'step_by_step',
            feedbackTone: 'encouraging',
            tutoringLanguage: 'fr',
          ),
          summaryForUser: analyzeSummary,
        );
      },
    );

    await pumpChat(tester, repository: repository);

    for (var step = 0; step < OnboardingQuestionIds.stepCount; step++) {
      await submitAcceptedAnswer(tester);
      await tester.tap(find.text('C’est bon'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
    }

    expect(repository.confirmCallCount, OnboardingQuestionIds.stepCount);
    expect(repository.analyzeCallCount, 1);
    expect(find.text('Confirm'), findsOneWidget);
  });
}
