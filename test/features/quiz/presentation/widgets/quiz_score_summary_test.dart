import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/presentation/controllers/quiz_session_state.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/quiz_score_summary.dart';

const _session = LearningSession(
  id: 'learn_quiz_1',
  type: LearningSessionType.quiz,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Quiz · thermo',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  items: [
    LearningSessionItem(
      id: 'item-1',
      question: 'Q1?',
      choices: ['A', 'B'],
      correctIndex: 0,
      sources: [],
    ),
    LearningSessionItem(
      id: 'item-2',
      question: 'Q2?',
      choices: ['A', 'B'],
      correctIndex: 0,
      sources: [],
    ),
  ],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Future<void> pumpSummary(
    WidgetTester tester, {
    required QuizSessionState state,
    VoidCallback? onReviewWeakPoints,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: QuizScoreSummary(
            state: state,
            onClose: () {},
            onRetry: () {},
            onReviewWeakPoints: onReviewWeakPoints,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('shows weak points CTA when quiz has incorrect answers', (
    tester,
  ) async {
    await pumpSummary(
      tester,
      state: const QuizSessionState(
        session: _session,
        isComplete: true,
        selectedAnswers: {'item-1': 0, 'item-2': 1},
      ),
      onReviewWeakPoints: () {},
    );

    expect(find.text('Renforce tes points faibles'), findsOneWidget);
    expect(find.text('Cartes sur mes erreurs'), findsOneWidget);
  });

  testWidgets('hides weak points CTA on perfect score', (tester) async {
    await pumpSummary(
      tester,
      state: const QuizSessionState(
        session: _session,
        isComplete: true,
        selectedAnswers: {'item-1': 0, 'item-2': 0},
      ),
    );

    expect(find.text('Renforce tes points faibles'), findsNothing);
    expect(find.text('Cartes sur mes erreurs'), findsNothing);
  });
}
