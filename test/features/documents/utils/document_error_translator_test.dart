import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/documents/domain/exceptions/document_exception.dart';
import 'package:lucy_frontend/features/documents/utils/document_error_translator.dart';

void main() {
  group('DocumentErrorTranslator', () {
    testWidgets('maps DOCUMENT_UPLOAD_IN_PROGRESS to French l10n', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final message = DocumentErrorTranslator.translate(
                context,
                'DOCUMENT_UPLOAD_IN_PROGRESS',
              );
              expect(
                message,
                'Un autre téléversement est déjà en cours. Attendez la fin.',
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('fromException uses DocumentException code', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final message = DocumentErrorTranslator.fromException(
                context,
                const DocumentException('DOCUMENT_NOT_FOUND'),
              );
              expect(message, 'Document introuvable.');
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}
