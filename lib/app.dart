import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/localization/l10n/app_localizations.dart';
import 'core/localization/lucy_locale_resolution.dart';
import 'core/router/app_router.dart';
import 'features/chat/domain/providers/chat_mirror_provider.dart';
import 'core/theme/lucy_flex_theme.dart';

/// Root application widget for Lucy.
class LucyApp extends ConsumerWidget {
  const LucyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(chatMirrorLogoutListenerProvider);
    final router = ref.watch(lucyRouterProvider);
    return MaterialApp.router(
      title: 'Lucy',
      theme: LucyFlexTheme.lightTheme,
      darkTheme: LucyFlexTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: kLucyAppLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localeListResolutionCallback: (_, __) => kLucyAppLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}
