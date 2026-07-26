import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_composer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Widget wrap(LucyComposer composer) {
    return MaterialApp(
      theme: LucyFlexTheme.lightTheme,
      locale: const Locale('fr'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: composer),
    );
  }

  testWidgets('submits on enter key', (tester) async {
    String? sent;
    await tester.pumpWidget(
      wrap(
        LucyComposer(
          enabled: true,
          hintText: 'Posez votre question…',
          onSend: (text) => sent = text,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Bonjour Lucy');
    await tester.testTextInput.receiveAction(TextInputAction.send);
    await tester.pump();

    expect(sent, 'Bonjour Lucy');
  });

  testWidgets('send button invokes onSend', (tester) async {
    String? sent;
    await tester.pumpWidget(
      wrap(
        LucyComposer(
          enabled: true,
          hintText: 'Posez votre question…',
          onSend: (text) => sent = text,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Question');
    await tester.tap(find.byIcon(Icons.arrow_upward));
    await tester.pump();

    expect(sent, 'Question');
  });
}
