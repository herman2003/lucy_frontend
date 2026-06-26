import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/localization/l10n/app_localizations.dart';
import 'core/localization/lucy_app_locale_provider.dart';
import 'core/router/app_router.dart';
import 'features/chat/domain/providers/chat_mirror_provider.dart';
import 'features/quiz/domain/providers/learning_reminder_notification_provider.dart';
import 'core/theme/lucy_theme_provider.dart';

/// Root application widget for Lucy.
class LucyApp extends ConsumerWidget {
  const LucyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(chatMirrorLogoutListenerProvider);
    ref.watch(learningReminderNotificationSyncListenerProvider);
    final router = ref.watch(lucyRouterProvider);
    final locale = ref.watch(lucyAppLocaleProvider);
    final lightTheme = ref.watch(lucyLightThemeProvider);
    final darkTheme = ref.watch(lucyDarkThemeProvider);
    final themeMode = ref.watch(lucyThemeModeProvider);
    return MaterialApp.router(
      title: 'Lucy',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localeListResolutionCallback: (_, __) => locale,
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
