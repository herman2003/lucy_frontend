import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/constants/lucy_constants.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/auth/presentation/widgets/auth_web_layout.dart';
import 'package:lucy_frontend/shared/widgets/buttons/lucy_primary_button.dart';
import 'package:lucy_frontend/shared/widgets/buttons/lucy_tertiary_button.dart';
import 'package:lucy_frontend/shared/widgets/branding/lucy_logo.dart';

Widget _app(Widget child) {
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
    home: child,
  );
}

void main() {
  testWidgets('LucyPrimaryButton triggers onPressed', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      _app(
        Scaffold(
          body: LucyPrimaryButton(
            text: 'Log In',
            onPressed: () => tapped = true,
            width: 200,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Log In'));
    expect(tapped, isTrue);
  });

  testWidgets('LucyTertiaryButton uses colorScheme primary', (tester) async {
    await tester.pumpWidget(
      _app(const Scaffold(body: LucyTertiaryButton(text: 'Sign Up'))),
    );

    final text = tester.widget<Text>(find.text('Sign Up'));
    final scheme = LucyFlexTheme.lightTheme.colorScheme;
    expect(text.style?.color, scheme.primary);
  });

  testWidgets('AuthWebLayout constrains form card to max 448px', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        MediaQuery(
          data: const MediaQueryData(size: Size(1200, 800)),
          child: AuthWebLayout(
            brandingTitle: 'Title',
            brandingSubtitle: 'Subtitle',
            formContent: const [SizedBox(height: 80)],
          ),
        ),
      ),
    );

    final constrained = tester.widget<ConstrainedBox>(
      find.byWidgetPredicate(
        (widget) =>
            widget is ConstrainedBox &&
            widget.constraints.maxWidth == LucyConstants.kAuthCardMaxWidth,
      ),
    );

    expect(constrained.constraints.maxWidth, LucyConstants.kAuthCardMaxWidth);
  });

  testWidgets('LucyLogo shows localized title', (tester) async {
    await tester.pumpWidget(
      _app(const Scaffold(body: Center(child: LucyLogo()))),
    );

    expect(find.text('Lucy'), findsOneWidget);
    expect(find.byIcon(Icons.psychology_outlined), findsOneWidget);
  });
}
