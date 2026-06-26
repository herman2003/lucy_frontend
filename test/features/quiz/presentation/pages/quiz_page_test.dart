import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:lucy_frontend/core/constants/flashcard_sm2_storage_keys.dart';
import 'package:lucy_frontend/core/constants/quiz_attempt_storage_keys.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/fake_learning_session_repository.dart';
import '../../helpers/fake_quiz_repository.dart';

void main() {
  tearDown(LucySnackBar.hideAll);

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

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

  Future<void> pumpQuizPage(WidgetTester tester, {Size? viewport}) async {
    if (viewport != null) {
      tester.view.physicalSize = viewport;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
    }
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
          theme: LucyFlexTheme.lightTheme,
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

  testWidgets('shows generate actions when canQuiz is true and history is empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quizServiceProvider.overrideWithValue(
            QuizService(
              repository: FakeQuizRepository(
                eligibility: const QuizEligibility(
                  canQuiz: true,
                  activeDocumentCount: 2,
                ),
              ),
            ),
          ),
          learningSessionServiceProvider.overrideWithValue(
            LearningSessionService(
              repository: FakeLearningSessionRepository()..setSessions(const []),
            ),
          ),
        ],
        child: MaterialApp.router(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(path: '/', builder: (context, state) => const QuizPage()),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Générer un quiz'), findsOneWidget);
    expect(find.text('Générer des cartes'), findsOneWidget);
    expect(
      find.textContaining('Lucy analysera vos documents'),
      findsOneWidget,
    );
  });

  testWidgets('shows corpus banner and history when canQuiz is false', (
    tester,
  ) async {
    await pumpQuizPage(tester, viewport: const Size(390, 844));

    expect(find.text('Quiz & cartes mémoire'), findsOneWidget);
    expect(find.text('Quiz · test'), findsOneWidget);
    expect(find.textContaining('questions'), findsOneWidget);
    expect(find.textContaining('document'), findsWidgets);
  });

  testWidgets('opens session route from history when canQuiz is false', (
    tester,
  ) async {
    await pumpQuizPage(tester, viewport: const Size(390, 844));

    await tester.tap(find.text('Démarrer le quiz'));
    await tester.pumpAndSettle();

    expect(find.text('session:learn_1'), findsOneWidget);
  });

  testWidgets('shows last attempt score in library when history exists', (
    tester,
  ) async {
    final completedAt = DateTime.utc(2026, 5, 29, 12);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      QuizAttemptStorageKeys.sessionAttempts('learn_1'),
      jsonEncode([
        {
          'id': 'attempt_1',
          'sessionId': 'learn_1',
          'startedAt': '2026-05-29T11:00:00.000Z',
          'completedAt': completedAt.toIso8601String(),
          'scoreCorrect': 4,
          'scoreTotal': 5,
          'answers': [],
        },
      ]),
    );

    await pumpQuizPage(tester, viewport: const Size(390, 844));

    expect(find.textContaining('Dernier score sur Quiz · test'), findsOneWidget);
    expect(find.textContaining('4/5'), findsNWidgets(2));
  });

  testWidgets('shows learning reminder banner for due flashcards', (
    tester,
  ) async {
    const flashSession = LearningSessionListItem(
      id: 'learn_flash_1',
      type: LearningSessionType.flashcards,
      status: LearningSessionStatus.ready,
      itemCount: 2,
      title: 'Cartes · entropie',
      createdAt: '2026-05-29T10:00:00.000Z',
      updatedAt: '2026-05-29T10:00:00.000Z',
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      FlashcardSm2StorageKeys.sessionStates('learn_flash_1'),
      jsonEncode({
        'item-1': {
          'easeFactor': 2.5,
          'repetitions': 1,
          'intervalDays': 1,
          'dueAt': '2026-06-09T00:00:00.000Z',
        },
      }),
    );

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
                ..setSessions(const [flashSession]),
            ),
          ),
        ],
        child: MaterialApp.router(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(path: '/', builder: (context, state) => const QuizPage()),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('cartes à revoir'), findsOneWidget);
    expect(find.textContaining('Reprends ta session'), findsOneWidget);
  });

  testWidgets('shows admin card grid on tablet width', (tester) async {
    await pumpQuizPage(tester, viewport: const Size(1280, 800));

    expect(find.byType(QuizSessionCard), findsOneWidget);
    expect(find.byType(QuizSessionListTile), findsNothing);
  });
}
