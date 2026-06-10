import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:go_router/go_router.dart';
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

  testWidgets('shows first onboarding question on load', (tester) async {
    await pumpChat(tester, repository: FakeOnboardingRepository());

    expect(find.textContaining('étudiant'), findsOneWidget);
    expect(find.text('1 / 7'), findsOneWidget);
  });

  testWidgets('shows rephrasedQuestion when validate returns invalid', (
    tester,
  ) async {
    const rephrased =
        'Tu es plutôt étudiant, en reconversion, ou tu apprends seul ?';

    final repository = FakeOnboardingRepository(
      validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
        return const ValidateAnswerResult.needsRetry(
          rephrasedQuestion: rephrased,
          reason: 'too_vague',
        );
      },
    );

    await pumpChat(tester, repository: repository);

    await tester.enterText(find.byType(TextField), 'euh');
    await tester.pump();
    await tester.tap(find.text('Envoyer'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(repository.validateCallCount, 1, reason: 'send button should call validate');
    expect(find.text(rephrased), findsOneWidget);
    expect(repository.lastQuestionId, OnboardingQuestionIds.qRole);
  });

  testWidgets('shows turnSummary when validate accepts answer', (
    tester,
  ) async {
    const summary = 'Tu es étudiant en biologie en L2.';

    final repository = FakeOnboardingRepository(
      validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
        return const ValidateAnswerResult.accepted(turnSummary: summary);
      },
    );

    await pumpChat(tester, repository: repository);

    await tester.enterText(
      find.byType(TextField),
      'Je suis étudiant en L2 biologie.',
    );
    await tester.pump();
    await tester.tap(find.text('Envoyer'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    expect(find.text(summary), findsOneWidget);
    expect(find.text('C’est bon'), findsOneWidget);
    expect(find.text('Ce n’est pas ça'), findsOneWidget);
  });
}
