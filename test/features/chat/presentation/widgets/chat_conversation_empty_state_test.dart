import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/chat/presentation/widgets/chat_conversation_empty_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('invokes callback when tapping a suggestion chip', (
    tester,
  ) async {
    String? selected;
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: Scaffold(
          body: ChatConversationEmptyState(
            greeting: 'Bonjour',
            message: 'Posez une question',
            suggestions: const ['Résume mes documents', 'Propose-moi un quiz'],
            onSuggestionSelected: (value) => selected = value,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Propose-moi un quiz'));
    await tester.pump();

    expect(selected, 'Propose-moi un quiz');
  });
}
