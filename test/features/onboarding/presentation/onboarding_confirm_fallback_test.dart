import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:lucy_frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_confirm_page.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_onboarding_repository.dart';
import '../helpers/onboarding_chat_test_overrides.dart';

Future<void> pumpConfirmWithAnalysis(
  WidgetTester tester, {
  required FakeOnboardingRepository repository,
  required OnboardingAnalyzeResult analysis,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: onboardingChatTestOverrides(repository: repository),
      child: MaterialApp.router(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: GoRouter(
          initialLocation: LucyRoutePaths.onboardingConfirm,
          routes: [
            GoRoute(
              path: LucyRoutePaths.onboardingConfirm,
              builder: (context, state) => const OnboardingConfirmPage(),
            ),
            GoRoute(
              path: LucyRoutePaths.onboarding,
              builder: (context, state) => const Scaffold(body: Text('Chat')),
            ),
          ],
        ),
      ),
    ),
  );

  await tester.pump();
  final container = ProviderScope.containerOf(
    tester.element(find.byType(MaterialApp)),
  );
  final l10n = AppLocalizations.of(
    tester.element(find.byType(OnboardingConfirmPage)),
  )!;
  final notifier = container.read(onboardingChatProvider.notifier);
  notifier.initialize(l10n: l10n, deviceLocale: const Locale('fr'));
  notifier.state = OnboardingChatState(
    isInitialized: true,
    analyzeResult: analysis,
    phase: OnboardingChatPhase.analysisReady,
  );

  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
}

void main() {
  setUp(() {
    setTestLocaleFr();
  });

  tearDown(clearTestLocaleOverride);

  testWidgets('shows fallback summary without profile enum rows', (
    tester,
  ) async {
    await pumpConfirmWithAnalysis(
      tester,
      repository: FakeOnboardingRepository(),
      analysis: const OnboardingAnalyzeResult.fallback(
        fallbackProfileSummary: 'Profil de secours initial.',
      ),
    );

    expect(find.text('Profil de secours initial.'), findsOneWidget);
    expect(find.text('Étudiant·e'), findsNothing);
  });

  testWidgets('edit on fallback analyze retries with profileReduced', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

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

    await pumpConfirmWithAnalysis(
      tester,
      repository: repository,
      analysis: const OnboardingAnalyzeResult.fallback(
        fallbackProfileSummary: 'Profil de secours initial.',
      ),
    );

    final container = ProviderScope.containerOf(
      tester.element(find.byType(MaterialApp)),
    );
    expect(
      container.read(onboardingChatProvider).analyzeResult,
      isA<OnboardingAnalyzeFallback>(),
    );

    await container
        .read(onboardingChatProvider.notifier)
        .retryAnalyzeWithReducedProfile();
    await tester.pumpAndSettle();

    expect(repository.analyzeCallCount, greaterThan(0));
    expect(repository.lastAnalyzeProfileReduced, isTrue);
    expect(reducedRequested, isTrue);

    final result = container.read(onboardingChatProvider).analyzeResult;
    expect(result, isA<OnboardingAnalyzeSuccess>());
    expect(
      (result! as OnboardingAnalyzeSuccess).summaryForUser,
      'Profil complet après retry.',
    );
  });
}
