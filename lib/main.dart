import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'bootstrap/firebase_bootstrap.dart';
import 'core/localization/lucy_app_locale_provider.dart';
import 'core/localization/lucy_ui_locale_storage.dart';

Future<void> main() async {
  await bootstrapFirebase();
  final savedLocale = await LucyUiLocaleStorage.read();
  LucyAppLocale.bootstrap(savedLocale);
  runApp(const ProviderScope(child: LucyApp()));
}
