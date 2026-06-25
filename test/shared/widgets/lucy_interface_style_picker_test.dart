import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/core/theme/lucy_interface_style.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_interface_style_picker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('invokes onSelected when tapping a style preview', (tester) async {
    LucyInterfaceStyle? selected;
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LucyInterfaceStylePicker(
            selected: LucyInterfaceStyle.academic,
            onSelected: (style) => selected = style,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Motivant'));
    await tester.pumpAndSettle();

    expect(selected, LucyInterfaceStyle.motivant);
  });

  testWidgets('shows Aa preview on each style card', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LucyInterfaceStylePicker(
            selected: LucyInterfaceStyle.academic,
            onSelected: _noop,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Aa'), findsNWidgets(3));
  });
}

void _noop(LucyInterfaceStyle _) {}
