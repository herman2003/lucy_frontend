import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/chat/domain/entities/chat_quick_chip.dart';
import 'package:lucy_frontend/features/chat/presentation/widgets/chat_quick_chips_bar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('sends chip message when tapped', (tester) async {
    String? sent;
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: Scaffold(
          body: ChatQuickChipsBar(
            chips: const [
              ChatQuickChip(label: 'Quiz', message: 'fais-moi un quiz'),
            ],
            onChipSelected: (message) => sent = message,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Quiz'));
    await tester.pump();

    expect(sent, 'fais-moi un quiz');
  });
}
