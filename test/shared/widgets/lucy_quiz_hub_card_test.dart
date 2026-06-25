import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_chip.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_quiz_hub_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Widget wrap(Widget child) {
    return MaterialApp(
      theme: LucyFlexTheme.lightTheme,
      locale: const Locale('fr'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(body: child),
    );
  }

  testWidgets('shows title, meta, and quiz type chip', (tester) async {
    await tester.pumpWidget(
      wrap(
        LucyQuizHubCard(
          title: 'Quiz · dérivées',
          metaLabel: '5 questions · hier',
          typeLabel: 'Quiz',
          type: LucyQuizHubCardType.quiz,
          onTap: () {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Quiz · dérivées'), findsOneWidget);
    expect(find.text('5 questions · hier'), findsOneWidget);
    expect(find.text('Quiz'), findsOneWidget);
    expect(find.byType(LucyChip), findsOneWidget);
  });

  testWidgets('invokes onTap when card is tapped', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      wrap(
        LucyQuizHubCard(
          title: 'Cartes · bio',
          metaLabel: '10 cartes',
          typeLabel: 'Cartes',
          type: LucyQuizHubCardType.flashcards,
          onTap: () => tapped = true,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cartes · bio'));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });

  testWidgets('shows delete action when onDelete is provided', (tester) async {
    var deleted = false;
    await tester.pumpWidget(
      wrap(
        LucyQuizHubCard(
          title: 'Quiz · test',
          metaLabel: '3 questions',
          typeLabel: 'Quiz',
          type: LucyQuizHubCardType.quiz,
          onTap: () {},
          onDelete: () => deleted = true,
          deleteLabel: 'Supprimer',
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Supprimer'));
    await tester.pumpAndSettle();

    expect(deleted, isTrue);
  });
}
