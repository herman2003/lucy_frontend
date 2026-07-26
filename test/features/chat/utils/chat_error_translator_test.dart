import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/chat/domain/exceptions/chat_exception.dart';
import 'package:lucy_frontend/features/chat/utils/chat_error_translator.dart';

void main() {
  group('ChatErrorTranslator', () {
    testWidgets('maps CHAT_NO_ACTIVE_DOCUMENTS to French l10n', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final message = ChatErrorTranslator.translate(
                context,
                'CHAT_NO_ACTIVE_DOCUMENTS',
              );
              expect(
                message,
                'Activez au moins un document pour discuter avec Lucy.',
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('fromException uses ChatException code', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              final message = ChatErrorTranslator.fromException(
                context,
                const ChatException('CHAT_STREAM_IN_PROGRESS'),
              );
              expect(message, 'Un message est déjà en cours de génération.');
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}
