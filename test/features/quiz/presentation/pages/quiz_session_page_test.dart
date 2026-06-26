import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/presentation/pages/quiz_session_page.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/quiz_choice_tile.dart';

const _quizSession = LearningSession(
  id: 'learn_quiz_1',
  type: LearningSessionType.quiz,
  status: LearningSessionStatus.ready,
  itemCount: 1,
  title: 'Quiz · thermo',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  items: [
    LearningSessionItem(
      id: 'item-1',
      question: "Qu'est-ce que l'entropie ?",
      choices: ['Ordre', 'Désordre', 'Chaleur', 'Pression'],
      correctIndex: 1,
      explanation: "L'entropie mesure le désordre.",
      sources: [
        LearningSessionSource(
          chunkId: 'chunk_1',
          documentId: 'doc_1',
          title: 'Thermodynamique',
          excerpt: "L'entropie mesure le désordre.",
          pageStart: 12,
          pageEnd: 14,
        ),
      ],
    ),
  ],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Future<void> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: QuizSessionPage(
            sessionId: 'learn_quiz_1',
            initialSession: _quizSession,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
  }

  testWidgets('shows source cards after answering a question', (tester) async {
    await pumpPage(tester);

    expect(find.text('Sources'), findsNothing);

    await tester.tap(find.byType(QuizChoiceTile).at(1));
    await tester.pumpAndSettle();

    expect(find.text('Sources'), findsOneWidget);
    expect(find.text('Thermodynamique'), findsOneWidget);
    expect(find.text('Pages 12–14'), findsOneWidget);
    expect(
      find.text("« L'entropie mesure le désordre. »"),
      findsOneWidget,
    );
  });
}
