import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_source_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('shows title and pages label', (tester) async {
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
        home: const Scaffold(
          body: LucySourceCard(
            title: 'Manuel biologie',
            excerpt: 'La photosynthèse convertit la lumière.',
            pagesLabel: 'Pages 12–14',
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Manuel biologie'), findsOneWidget);
    expect(find.text('Pages 12–14'), findsOneWidget);
    expect(find.text('La photosynthèse convertit la lumière.'), findsOneWidget);
  });
}
