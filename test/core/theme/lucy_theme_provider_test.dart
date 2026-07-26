import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/theme/lucy_colors.dart';
import 'package:lucy_frontend/core/theme/lucy_interface_style.dart';
import 'package:lucy_frontend/core/theme/lucy_interface_style_storage.dart';
import 'package:lucy_frontend/core/theme/lucy_theme_mode_storage.dart';
import 'package:lucy_frontend/core/theme/lucy_theme_palette.dart';
import 'package:lucy_frontend/core/theme/lucy_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('LucyInterfaceStyleStorage', () {
    test('round-trips academic style', () async {
      await LucyInterfaceStyleStorage.write(LucyInterfaceStyle.academic);
      expect(
        await LucyInterfaceStyleStorage.read(),
        LucyInterfaceStyle.academic,
      );
    });

    test('returns null when unset', () async {
      expect(await LucyInterfaceStyleStorage.read(), isNull);
    });
  });

  group('LucyThemePalette', () {
    test('academic light uses design-system seeds', () {
      final palette = LucyThemePalette.resolve(
        brightness: Brightness.light,
        style: LucyInterfaceStyle.academic,
      );
      expect(palette.primarySeed, LucyColors.primary);
      expect(palette.scaffoldBackground, LucyColors.scaffoldAcademicLight);
    });

    test('premium dark style has dedicated light scaffold', () {
      final palette = LucyThemePalette.resolve(
        brightness: Brightness.light,
        style: LucyInterfaceStyle.premiumDark,
      );
      expect(palette.scaffoldBackground, LucyColors.scaffoldPremiumLight);
    });
  });

  group('LucyAppTheme', () {
    test('defaults to academic and system mode', () {
      LucyAppTheme.bootstrap();
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final prefs = container.read(lucyAppThemeProvider);
      expect(prefs.interfaceStyle, LucyInterfaceStyle.academic);
      expect(prefs.themeMode, ThemeMode.system);
    });

    test('setInterfaceStyle updates state', () {
      LucyAppTheme.bootstrap();
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(lucyAppThemeProvider.notifier)
          .setInterfaceStyle(LucyInterfaceStyle.motivant);
      expect(
        container.read(lucyAppThemeProvider).interfaceStyle,
        LucyInterfaceStyle.motivant,
      );
    });
    test('setInterfaceStyle persists to storage', () async {
      LucyAppTheme.bootstrap();
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(lucyAppThemeProvider.notifier)
          .setInterfaceStyle(LucyInterfaceStyle.premiumDark);
      await Future<void>.delayed(Duration.zero);

      expect(
        await LucyInterfaceStyleStorage.read(),
        LucyInterfaceStyle.premiumDark,
      );
    });

    test('setThemeMode persists to storage', () async {
      LucyAppTheme.bootstrap();
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(lucyAppThemeProvider.notifier).setThemeMode(ThemeMode.dark);
      await Future<void>.delayed(Duration.zero);

      expect(await LucyThemeModeStorage.read(), ThemeMode.dark);
    });
  });
}
