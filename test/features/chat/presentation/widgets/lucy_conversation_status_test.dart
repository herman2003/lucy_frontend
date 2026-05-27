import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/localization/l10n/app_localizations.dart';
import 'package:frontend/features/chat/presentation/widgets/lucy_conversation_status.dart';

import '../../../../helpers/test_locales.dart';

void main() {
  testWidgets('loading status shows progress indicator', (tester) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(
          body: LucyConversationStatus(
            status: LucyConversationStatusType.loading,
            child: Text('hidden'),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('hidden'), findsNothing);
  });
}
