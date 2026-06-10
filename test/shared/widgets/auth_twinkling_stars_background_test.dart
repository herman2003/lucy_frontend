import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/branding/auth_twinkling_stars_background.dart';

void main() {
  testWidgets('AuthTwinklingStarsBackground paints animated stars', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: const Scaffold(
          body: AuthTwinklingStarsBackground(child: SizedBox.expand()),
        ),
      ),
    );

    expect(
      find.descendant(
        of: find.byType(AuthTwinklingStarsBackground),
        matching: find.byType(CustomPaint),
      ),
      findsOneWidget,
    );
  });

  testWidgets(
    'AuthTwinklingStarsBackground skips animation when motion reduced',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          home: MediaQuery(
            data: const MediaQueryData(disableAnimations: true),
            child: const Scaffold(
              body: AuthTwinklingStarsBackground(child: SizedBox.expand()),
            ),
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(AuthTwinklingStarsBackground),
          matching: find.byType(CustomPaint),
        ),
        findsNothing,
      );
    },
  );
}
