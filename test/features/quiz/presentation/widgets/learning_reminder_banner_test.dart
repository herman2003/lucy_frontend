import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/learning_reminder_banner.dart';

import '../../../../helpers/test_locales.dart';

void main() {
  testWidgets('shows flashcards reminder and handles CTA', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    var tapped = false;
    const reminder = LearningReminder(
      kind: LearningReminderKind.flashcardsDue,
      sessionId: 'learn_flash_1',
      sessionTitle: 'Cartes · entropie',
      dueFlashcardCount: 3,
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LearningReminderBanner(
            reminder: reminder,
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.textContaining('3'), findsWidgets);
    expect(find.text('Ouvrir les cartes'), findsOneWidget);

    await tester.tap(find.text('Ouvrir les cartes'));
    expect(tapped, isTrue);
  });
}
