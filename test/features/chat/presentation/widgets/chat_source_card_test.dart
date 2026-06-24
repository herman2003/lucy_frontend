import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/chat/domain/entities/chat_source.dart';
import 'package:lucy_frontend/features/chat/presentation/widgets/chat_source_card.dart';

import '../../../../helpers/test_locales.dart';

void main() {
  testWidgets('shows title, page range, and excerpt', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    const source = ChatSource(
      documentId: 'doc-1',
      title: 'Manuel biologie',
      chunkId: 'chunk-1',
      excerpt: 'La photosynthèse convertit la lumière.',
      pageStart: 12,
      pageEnd: 14,
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: ChatSourceCard(source: source)),
      ),
    );

    expect(find.text('Manuel biologie'), findsOneWidget);
    expect(find.text('Pages 12–14'), findsOneWidget);
    expect(find.text('La photosynthèse convertit la lumière.'), findsOneWidget);
  });
}
