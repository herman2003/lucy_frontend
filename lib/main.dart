import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap/firebase_bootstrap.dart';
import 'core/localization/lucy_app_locale_provider.dart';
import 'core/localization/lucy_ui_locale_storage.dart';
import 'core/theme/lucy_interface_style_storage.dart';
import 'core/theme/lucy_theme_mode_storage.dart';
import 'core/theme/lucy_theme_provider.dart';


Future<void> main() async {
  await bootstrapFirebase();
  final savedLocale = await LucyUiLocaleStorage.read();
  final savedInterfaceStyle = await LucyInterfaceStyleStorage.read();
  final savedThemeMode = await LucyThemeModeStorage.read();
  LucyAppLocale.bootstrap(savedLocale);
  LucyAppTheme.bootstrap(
    interfaceStyle: savedInterfaceStyle,
    themeMode: savedThemeMode,
  );
  runApp(const ProviderScope(child: LucyApp()));
}
