import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_chat_message.dart';
import 'package:frontend/features/onboarding/domain/providers/onboarding_provider.dart';
import 'package:frontend/features/onboarding/presentation/controllers/onboarding_chat_notifier.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_chat_page.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';
import 'package:frontend/features/onboarding/utils/onboarding_question_ids.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_onboarding_repository.dart';

void main() {
  setUp(setTestLocaleFr);
  tearDown(clearTestLocaleOverride);

  testWidgets('browsing completed step shows thread and read-only banner', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onboardingRepositoryProvider.overrideWithValue(
            FakeOnboardingRepository(),
          ),
          onboardingServiceProvider.overrideWithValue(
            OnboardingService(
              repository: FakeOnboardingRepository(),
            ),
          ),
        ],
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
      tester.element(find.byType(OnboardingChatPage)),
    )!;
    final notifier = container.read(onboardingChatProvider.notifier);
    notifier.initialize(l10n: l10n, deviceLocale: const Locale('fr'));
    notifier.state = const OnboardingChatState(
      isInitialized: true,
      currentStepIndex: 2,
      currentQuestionId: OnboardingQuestionIds.qGoal,
      activeQuestionText: 'Objectif?',
      messagesByQuestionId: {
        OnboardingQuestionIds.qRole: [
          OnboardingChatMessage(isFromLucy: true, text: 'Fil étape 1'),
        ],
        OnboardingQuestionIds.qDomains: [
          OnboardingChatMessage(isFromLucy: true, text: 'Fil étape 2'),
        ],
        OnboardingQuestionIds.qGoal: [
          OnboardingChatMessage(isFromLucy: true, text: 'Fil étape 3'),
        ],
      },
      phase: OnboardingChatPhase.awaitingAnswer,
    );

    await tester.pumpAndSettle();

    expect(find.text('Fil étape 3'), findsOneWidget);
    expect(find.text('Étape terminée — consultation seule.'), findsNothing);

    await tester.tap(find.byType(IconButton).at(1));
    await tester.pumpAndSettle();

    expect(find.text('Fil étape 2'), findsOneWidget);
    expect(find.text('Étape terminée — consultation seule.'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
  });
}
