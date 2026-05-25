import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/features/auth/domain/entities/auth_bootstrap_result.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:frontend/features/onboarding/domain/providers/onboarding_provider.dart';
import 'package:frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_confirm_page.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_onboarding_repository.dart';

void main() {
  setUp(() {
    setTestLocaleFr();
  });

  tearDown(clearTestLocaleOverride);

  OnboardingAnalyzeResult sampleAnalysis() {
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
  }

  Future<void> pumpConfirm(
    WidgetTester tester, {
    required FakeOnboardingRepository repository,
    required OnboardingAnalyzeResult analysis,
  }) async {
    final router = GoRouter(
      initialLocation: LucyRoutePaths.onboardingConfirm,
      routes: [
        GoRoute(
          path: LucyRoutePaths.onboardingConfirm,
          builder: (context, state) => const OnboardingConfirmPage(),
        ),
        GoRoute(
          path: LucyRoutePaths.home,
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
        GoRoute(
          path: LucyRoutePaths.onboarding,
          builder: (context, state) => const Scaffold(body: Text('Chat')),
        ),
      ],
    );

    late ProviderContainer container;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onboardingRepositoryProvider.overrideWithValue(repository),
          onboardingServiceProvider.overrideWithValue(
            OnboardingService(repository: repository),
          ),
          authBootstrapProvider.overrideWith(
            (ref) async => const AuthBootstrapResult(
              user: AuthUser(uid: 'u1', email: 'a@b.c'),
              isConfigured: false,
            ),
          ),
        ],
        child: MaterialApp.router(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );

    await tester.pump();
    container = ProviderScope.containerOf(
      tester.element(find.byType(MaterialApp)),
    );
    container.read(onboardingChatProvider.notifier).state = OnboardingChatState(
      isInitialized: true,
      analyzeResult: analysis,
      phase: OnboardingChatPhase.analysisReady,
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  Future<void> pumpConfirmWithoutAnalysis(WidgetTester tester) async {
    final router = GoRouter(
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
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onboardingRepositoryProvider.overrideWithValue(
            FakeOnboardingRepository(),
          ),
        ],
        child: MaterialApp.router(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('shows summary and profile labels', (tester) async {
    await pumpConfirm(
      tester,
      repository: FakeOnboardingRepository(),
      analysis: sampleAnalysis(),
    );

    expect(find.text('Tu prépares un examen en sciences.'), findsOneWidget);
    expect(find.text('Étudiant·e'), findsOneWidget);
    expect(find.text('Valider et continuer'), findsOneWidget);
  });

  testWidgets('redirects to chat when analysis is missing', (tester) async {
    await pumpConfirmWithoutAnalysis(tester);
    await tester.pumpAndSettle();

    expect(find.text('Chat'), findsOneWidget);
    expect(find.textContaining('analyse disponible'), findsNothing);
  });

  testWidgets('edit navigates back to onboarding chat', (tester) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await pumpConfirm(
      tester,
      repository: FakeOnboardingRepository(),
      analysis: sampleAnalysis(),
    );

    await tester.ensureVisible(find.text('Modifier mes réponses'));
    await tester.tap(find.text('Modifier mes réponses'));
    await tester.pumpAndSettle();

    expect(find.text('Chat'), findsOneWidget);
    expect(find.text('Valider et continuer'), findsNothing);
  });
}
