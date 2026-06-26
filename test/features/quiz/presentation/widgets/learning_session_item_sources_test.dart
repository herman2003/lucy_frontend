import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_source.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/learning_session_item_sources.dart';

const _source = LearningSessionSource(
  chunkId: 'chunk_1',
  documentId: 'doc_1',
  title: 'Thermodynamique',
  excerpt: "L'entropie mesure le désordre.",
  pageStart: 12,
  pageEnd: 14,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Future<void> pumpSources(
    WidgetTester tester, {
    required List<LearningSessionSource> sources,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        locale: const Locale('fr'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LearningSessionItemSources(sources: sources),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('renders nothing when sources are empty', (tester) async {
    await pumpSources(tester, sources: const []);

    expect(find.text('Sources'), findsNothing);
    expect(find.text('Thermodynamique'), findsNothing);
  });

  testWidgets('shows section title, excerpt, document title and pages', (
    tester,
  ) async {
    await pumpSources(tester, sources: const [_source]);

    expect(find.text('Sources'), findsOneWidget);
    expect(find.text('Thermodynamique'), findsOneWidget);
    expect(find.text('Pages 12–14'), findsOneWidget);
    expect(
      find.text("« L'entropie mesure le désordre. »"),
      findsOneWidget,
    );
  });
}
