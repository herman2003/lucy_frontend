import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/shell/lucy_bottom_nav.dart';
import 'package:lucy_frontend/core/shell/lucy_shell_navigation.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });
  Widget wrap(Widget child, {required int activeIndex, void Function(int)? onTap}) {
    return MaterialApp(
      theme: LucyFlexTheme.lightTheme,
      locale: const Locale('fr'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        bottomNavigationBar: LucyBottomNav(
          activeIndex: activeIndex,
          onTap: onTap ?? (_) {},
        ),
      ),
    );
  }

  testWidgets('shows four emoji nav items with labels', (tester) async {
    await tester.pumpWidget(wrap(const SizedBox(), activeIndex: 0));
    await tester.pumpAndSettle();

    expect(find.text('📄'), findsOneWidget);
    expect(find.text('💬'), findsOneWidget);
    expect(find.text('🎯'), findsOneWidget);
    expect(find.text('⚙️'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
  });

  testWidgets('invokes onTap with branch index', (tester) async {
    var tapped = -1;
    await tester.pumpWidget(
      wrap(const SizedBox(), activeIndex: 0, onTap: (i) => tapped = i),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Quiz'));
    await tester.pumpAndSettle();

    expect(tapped, LucyShellNavigation.branchQuiz);
  });

  test('indexForPath resolves nested routes', () {
    expect(LucyShellNavigation.indexForPath('/documents'), 0);
    expect(LucyShellNavigation.indexForPath('/chat/thread-1'), 1);
    expect(LucyShellNavigation.indexForPath('/quiz/session/abc'), 2);
    expect(LucyShellNavigation.indexForPath('/settings/profile'), 3);
  });
}
