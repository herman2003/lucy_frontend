import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/chat/lucy_formatted_message_text.dart';

void main() {
  Future<void> pumpFormattedText(
    WidgetTester tester, {
    required String text,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: Scaffold(
          body: LucyFormattedMessageText(text: text, color: Colors.black),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('renders plain text', (tester) async {
    await pumpFormattedText(tester, text: 'Bonjour');

    expect(find.text('Bonjour'), findsOneWidget);
  });

  testWidgets('renders bold markdown without literal asterisks', (
    tester,
  ) async {
    await pumpFormattedText(tester, text: 'Voici un **terme clé**.');

    expect(find.textContaining('terme clé'), findsOneWidget);
    expect(find.text('**terme clé**'), findsNothing);
  });

  testWidgets('renders paragraph breaks as separate blocks', (tester) async {
    await pumpFormattedText(
      tester,
      text: 'Premier paragraphe.\n\nDeuxième paragraphe.',
    );

    expect(find.textContaining('Premier paragraphe.'), findsOneWidget);
    expect(find.textContaining('Deuxième paragraphe.'), findsOneWidget);
  });

  testWidgets('renders numbered list items on separate blocks', (tester) async {
    await pumpFormattedText(
      tester,
      text:
          'Voici la liste :\n\n'
          '1. **Premier point** — *priorité haute* — Raison.\n\n'
          '2. **Deuxième point** — *priorité moyenne* — Autre raison.',
    );

    expect(find.textContaining('Premier point'), findsOneWidget);
    expect(find.textContaining('Deuxième point'), findsOneWidget);
  });

  testWidgets('renders unordered list items on separate blocks', (tester) async {
    await pumpFormattedText(
      tester,
      text: 'Points clés :\n- Premier élément\n- Deuxième élément',
    );

    expect(find.textContaining('Premier élément'), findsOneWidget);
    expect(find.textContaining('Deuxième élément'), findsOneWidget);
  });

  testWidgets('empty text renders nothing', (tester) async {
    await pumpFormattedText(tester, text: '');

    expect(find.byType(LucyFormattedMessageText), findsOneWidget);
    expect(find.byType(RichText), findsNothing);
  });
}
