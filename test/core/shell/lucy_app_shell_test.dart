import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/shell/lucy_sidebar.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:go_router/go_router.dart';

void main() {
  Widget _app(GoRouter router) {
    return MaterialApp.router(
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
    );
  }

  testWidgets('desktop width shows sidebar with nav labels', (tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final router = GoRouter(
      initialLocation: '/documents',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return Scaffold(
              body: Row(
                children: [
                  LucySidebar(
                    navigationShell: navigationShell,
                    currentPath: state.uri.path,
                  ),
                  Expanded(child: navigationShell),
                ],
              ),
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
          ],
        ),
      ],
    );

    await tester.pumpWidget(_app(router));
    await tester.pumpAndSettle();

    expect(find.text('Documents'), findsWidgets);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.byType(LucySidebar), findsOneWidget);
  });
}
