import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/onboarding/presentation/widgets/onboarding_lucy_bubble.dart';
import 'package:frontend/features/onboarding/presentation/widgets/onboarding_lucy_typing_row.dart';
import 'package:frontend/features/onboarding/presentation/widgets/onboarding_user_bubble.dart';
import 'package:frontend/shared/widgets/branding/lucy_avatar.dart';

import '../../../helpers/test_locales.dart';

void main() {
  setUp(setTestLocaleFr);
  tearDown(clearTestLocaleOverride);

  Future<void> pumpMessaging(WidgetTester tester, Widget child) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: child),
      ),
    );
    await tester.pump();
  }

  testWidgets('Lucy bubble shows shared avatar and colorScheme bubble', (
    tester,
  ) async {
    await pumpMessaging(
      tester,
      const OnboardingLucyBubble(text: 'Bonjour'),
    );

    expect(find.byType(LucyAvatar), findsOneWidget);
    expect(find.text('Bonjour'), findsOneWidget);
    expect(find.byType(OnboardingLucyBubble), findsOneWidget);
  });

  testWidgets('user bubble aligns right with learner avatar', (tester) async {
    await pumpMessaging(
      tester,
      const OnboardingUserBubble(text: 'Ma réponse'),
    );

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(OnboardingUserBubble), findsOneWidget);
    expect(find.text('Ma réponse'), findsOneWidget);
  });

  testWidgets('typing row shows Lucy avatar, l10n label and animated dots', (
    tester,
  ) async {
    await pumpMessaging(tester, const OnboardingLucyTypingRow());

    expect(find.byType(LucyAvatar), findsOneWidget);
    expect(find.text('Lucy écrit…'), findsOneWidget);
    expect(find.byKey(const Key('onboarding_typing_dots')), findsOneWidget);
  });
}
