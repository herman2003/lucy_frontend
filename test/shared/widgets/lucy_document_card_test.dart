import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_document_card.dart';

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

  testWidgets('toggle invokes onToggleSearch callback', (tester) async {
    var toggled = false;
    await tester.pumpWidget(
      wrap(
        LucyDocumentCard(
          title: 'Cours de maths',
          metaLabel: 'cours.pdf · 1,2 Mo',
          statusLabel: 'Prêt',
          visualStatus: LucyDocumentCardVisualStatus.ready,
          typeLabel: 'PDF',
          searchEnabled: false,
          searchToggleEnabled: true,
          onToggleSearch: (enabled) => toggled = enabled,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(toggled, isTrue);
  });

  testWidgets('shows processing progress bar when processing', (tester) async {
    await tester.pumpWidget(
      wrap(
        LucyDocumentCard(
          title: 'Notes',
          metaLabel: 'notes.pdf',
          statusLabel: 'Traitement',
          visualStatus: LucyDocumentCardVisualStatus.processing,
          typeLabel: 'PDF',
          searchEnabled: false,
          searchToggleEnabled: false,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(find.text('Notes'), findsOneWidget);
    expect(find.text('Traitement'), findsOneWidget);
  });
}
