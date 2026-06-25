import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/shell/lucy_app_shell.dart';
import 'package:lucy_frontend/core/shell/lucy_bottom_nav.dart';
import 'package:lucy_frontend/core/shell/lucy_desktop_sidebar.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/auth/domain/entities/auth_user.dart';
import 'package:lucy_frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/helpers/fake_auth_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  Widget app(GoRouter router) {
    return ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          FakeAuthRepository(
            const AuthUser(uid: 'u1', email: 'marie@example.com'),
            isConfigured: true,
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: LucyFlexTheme.lightTheme,
        locale: const Locale('fr'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: router,
      ),
    );
  }

  testWidgets('desktop width shows sidebar with emoji nav labels', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final router = GoRouter(
      initialLocation: '/documents',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return LucyAppShell(
              navigationShell: navigationShell,
              state: state,
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/documents',
                  builder: (context, state) =>
                      const Scaffold(body: Text('docs')),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/chat',
                  builder: (context, state) =>
                      const Scaffold(body: Text('chat')),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/quiz',
                  builder: (context, state) =>
                      const Scaffold(body: Text('quiz')),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) =>
                      const Scaffold(body: Text('settings')),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(app(router));
    await tester.pumpAndSettle();

    expect(find.text('Documents'), findsWidgets);
    expect(find.text('📄'), findsWidgets);
    expect(find.byType(LucyDesktopSidebar), findsOneWidget);
    expect(find.byType(LucyBottomNav), findsNothing);
  });

  testWidgets('mobile width shows bottom nav with emojis', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final router = GoRouter(
      initialLocation: '/documents',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return LucyAppShell(
              navigationShell: navigationShell,
              state: state,
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/documents',
                  builder: (context, state) =>
                      const Scaffold(body: Text('docs')),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/chat',
                  builder: (context, state) =>
                      const Scaffold(body: Text('chat')),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/quiz',
                  builder: (context, state) =>
                      const Scaffold(body: Text('quiz')),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) =>
                      const Scaffold(body: Text('settings')),
                ),
              ],
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(app(router));
    await tester.pumpAndSettle();

    expect(find.byType(LucyBottomNav), findsOneWidget);
    expect(find.text('💬'), findsOneWidget);
    expect(find.byType(LucyDesktopSidebar), findsNothing);
  });
}
