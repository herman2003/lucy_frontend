import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/chat/presentation/widgets/chat_no_corpus_banner.dart';

import '../../../../helpers/test_locales.dart';

void main() {
  testWidgets('shows title, message, and CTA', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    var ctaTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ChatNoCorpusBanner(
            onGoToDocuments: () => ctaTapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Aucun document actif'), findsOneWidget);
    expect(
      find.text(
        'Activez la recherche sur au moins un document prêt dans l’onglet Documents.',
      ),
      findsOneWidget,
    );
    expect(find.text('Aller aux documents'), findsOneWidget);

    await tester.tap(find.text('Aller aux documents'));
    expect(ctaTapped, isTrue);
  });
}
