import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/core/router/lucy_route_paths.dart';
import 'package:frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:frontend/features/onboarding/domain/providers/onboarding_provider.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_chat_page.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';
import 'package:go_router/go_router.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_onboarding_repository.dart';

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
        overrides: [
          onboardingRepositoryProvider.overrideWithValue(repository),
          onboardingServiceProvider.overrideWithValue(
            OnboardingService(repository: repository),
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
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('fallback summary shows confirm actions and uses fallback confirm', (
    tester,
  ) async {
    final repository = FakeOnboardingRepository(
      validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
        return const ValidateAnswerResult.needsFallback(
          fallbackSummary: 'Lucy retient : apprenant autodidacte.',
        );
      },
    );

    await pumpChat(tester, repository: repository);
    await tester.enterText(find.byType(TextField), 'réponse');
    await tester.pump();
    await tester.tap(find.text('Envoyer'));
    await tester.pumpAndSettle();

    expect(find.text('Lucy retient : apprenant autodidacte.'), findsOneWidget);
    expect(find.text('C’est bon'), findsOneWidget);

    await tester.tap(find.text('C’est bon'));
    await tester.pumpAndSettle();

    expect(repository.lastConfirmationType, 'fallback');
  });

  testWidgets('rejecting fallback requests reduced summary', (tester) async {
    var reducedRequested = false;
    final repository = FakeOnboardingRepository(
      validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
        if (fallbackReduced) {
          reducedRequested = true;
          return const ValidateAnswerResult.needsFallback(
            fallbackSummary: 'Version courte.',
          );
        }
        return const ValidateAnswerResult.needsFallback(
          fallbackSummary: 'Version longue du résumé de secours.',
        );
      },
    );

    await pumpChat(tester, repository: repository);
    await tester.enterText(find.byType(TextField), 'réponse');
    await tester.pump();
    await tester.tap(find.text('Envoyer'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ce n’est pas ça'));
    await tester.pumpAndSettle();

    expect(reducedRequested, isTrue);
    expect(find.text('Version courte.'), findsOneWidget);
  });
}
