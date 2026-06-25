import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/flashcard_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('toggles between front and back when tapped', (tester) async {
    var isFlipped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) {
              return FlashcardWidget(
                front: 'Entropie',
                back: 'Désordre',
                isFlipped: isFlipped,
                onFlip: () => setState(() => isFlipped = !isFlipped),
              );
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Entropie'), findsOneWidget);
    expect(find.text('Recto'), findsOneWidget);

    await tester.tap(find.byType(FlashcardWidget));
    await tester.pumpAndSettle();

    expect(find.text('Désordre'), findsOneWidget);
    expect(find.text('Verso'), findsOneWidget);
  });
}
