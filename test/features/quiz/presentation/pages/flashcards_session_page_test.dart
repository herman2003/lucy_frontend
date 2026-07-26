import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_source.dart';
import 'package:lucy_frontend/features/quiz/presentation/pages/flashcards_session_page.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/flashcard_rating_bar.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/flashcard_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _flashcardsSession = LearningSession(
  id: 'learn_flash_1',
  type: LearningSessionType.flashcards,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Cartes · thermo',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  items: [
    LearningSessionItem(
      id: 'item-1',
      front: 'Entropie',
      back: 'Mesure du désordre',
      sources: [
        LearningSessionSource(
          chunkId: 'chunk_1',
          documentId: 'doc_1',
          title: 'Thermodynamique',
          excerpt: "L'entropie mesure le désordre.",
          pageStart: 3,
          pageEnd: 5,
        ),
      ],
    ),
    LearningSessionItem(
      id: 'item-2',
      front: 'Enthalpie',
      back: 'Chaleur à pression constante',
      sources: [],
    ),
  ],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Future<void> pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          locale: Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: FlashcardsSessionPage(
            sessionId: 'learn_flash_1',
            initialSession: _flashcardsSession,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
  }

  testWidgets('flips card when tapped', (tester) async {
    await pumpPage(tester);

    expect(find.text('Entropie'), findsOneWidget);

    await tester.tap(find.byType(FlashcardWidget));
    await tester.pumpAndSettle();

    expect(find.text('Mesure du désordre'), findsOneWidget);
  });

  testWidgets('shows source cards for the current flashcard', (tester) async {
    await pumpPage(tester);

    expect(find.text('Sources'), findsOneWidget);
    expect(find.text('Thermodynamique'), findsOneWidget);
    expect(find.text('Pages 3–5'), findsOneWidget);
    expect(
      find.text("« L'entropie mesure le désordre. »"),
      findsOneWidget,
    );
  });

  testWidgets('shows SM-2 rating buttons after flipping', (tester) async {
    await pumpPage(tester);

    await tester.tap(find.byType(FlashcardWidget));
    await tester.pumpAndSettle();

    expect(find.byType(FlashcardRatingBar), findsOneWidget);
    expect(find.text('Bien'), findsOneWidget);
  });

  testWidgets('advances to the next card after a good rating', (tester) async {
    await pumpPage(tester);

    await tester.tap(find.byType(FlashcardWidget));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Bien'));
    await tester.pumpAndSettle();

    expect(find.text('Enthalpie'), findsOneWidget);
  });
}
