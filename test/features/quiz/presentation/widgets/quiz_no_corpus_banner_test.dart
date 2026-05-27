import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/quiz/presentation/widgets/quiz_no_corpus_banner.dart';

import '../../../../helpers/test_locales.dart';

void main() {
  testWidgets('shows quiz corpus guard and CTA', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: QuizNoCorpusBanner(onGoToDocuments: () => tapped = true),
        ),
      ),
    );

    expect(find.text('Aucun document actif'), findsOneWidget);
    expect(find.text('Aller aux documents'), findsOneWidget);

    await tester.tap(find.text('Aller aux documents'));
    expect(tapped, isTrue);
  });
}
