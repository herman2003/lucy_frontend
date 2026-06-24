import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/quiz_eligibility.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_session_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/quiz_provider.dart';
import 'package:lucy_frontend/features/quiz/presentation/pages/quiz_page.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/quiz_session_card.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/quiz_session_list_tile.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_service.dart';
import 'package:lucy_frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../../helpers/fake_learning_session_repository.dart';
import '../../helpers/fake_quiz_repository.dart';

void main() {
  tearDown(LucySnackBar.hideAll);

  const sessions = [
    LearningSessionListItem(
      id: 'learn_1',
      type: LearningSessionType.quiz,
      status: LearningSessionStatus.ready,
      itemCount: 5,
      title: 'Quiz · test',
      createdAt: '2026-05-29T10:00:00.000Z',
      updatedAt: '2026-05-29T10:00:00.000Z',
    ),
  ];

  Future<void> pumpQuizPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizServiceProvider.overrideWithValue(
            QuizService(
              repository: FakeQuizRepository(
                eligibility: const QuizEligibility(
                  canQuiz: false,
                  activeDocumentCount: 0,
                ),
              ),
            ),
          ),
          learningSessionServiceProvider.overrideWithValue(
            LearningSessionService(
              repository: FakeLearningSessionRepository()
                ..setSessions(sessions),
            ),
          ),
        ],
        child: MaterialApp.router(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(path: '/', builder: (context, state) => const QuizPage()),
              GoRoute(
                path: LucyRoutePaths.quizSession(':sessionId'),
                builder: (context, state) =>
                    Text('session:${state.pathParameters['sessionId']}'),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('shows corpus banner and history when canQuiz is false', (
    tester,
  ) async {
    await pumpQuizPage(tester);

    expect(find.text('Historique'), findsOneWidget);
    expect(find.text('Quiz · test'), findsOneWidget);
    expect(find.textContaining('questions'), findsOneWidget);
    expect(find.textContaining('document'), findsWidgets);
  });

  testWidgets('opens session route from history when canQuiz is false', (
    tester,
  ) async {
    await pumpQuizPage(tester);

    await tester.tap(find.text('Quiz · test'));
    await tester.pumpAndSettle();

    expect(find.text('session:learn_1'), findsOneWidget);
  });

  testWidgets('shows admin card grid on tablet width', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpQuizPage(tester);

    expect(find.byType(QuizSessionCard), findsOneWidget);
    expect(find.byType(QuizSessionListTile), findsNothing);
  });
}
