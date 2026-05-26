import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/core/theme/lucy_flex_theme.dart';
import 'package:frontend/shared/widgets/placeholders/lucy_under_development_page.dart';

void main() {
  testWidgets('shows pageUnderDevelopment in French', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        locale: const Locale('fr'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const LucyUnderDevelopmentPage(title: 'Documents'),
      ),
    );

    expect(find.text('En cours de réalisation'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
  });
}
