import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/core/theme/lucy_interface_style.dart';
import 'package:lucy_frontend/core/theme/lucy_interface_style_storage.dart';
import 'package:lucy_frontend/core/theme/lucy_theme_mode_storage.dart';
import 'package:lucy_frontend/core/theme/lucy_theme_provider.dart';
import 'package:lucy_frontend/features/settings/presentation/widgets/settings_appearance_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LucyAppTheme.bootstrap();
  });

  testWidgets('style selection persists to storage', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: SettingsAppearanceSection()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Premium sombre'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 50));

    expect(
      await LucyInterfaceStyleStorage.read(),
      LucyInterfaceStyle.premiumDark,
    );
  });

  testWidgets('brightness selection persists to storage', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(body: SettingsAppearanceSection()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sombre'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 50));

    final stored = await LucyThemeModeStorage.read();
    expect(stored, ThemeMode.dark);
  });
}
