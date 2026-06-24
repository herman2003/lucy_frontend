import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/utils/auth_error_translator.dart';
import 'package:lucy_frontend/features/auth/domain/exceptions/auth_exception.dart';

void main() {
  group('AuthErrorTranslator', () {
    testWidgets('maps user-not-found to French l10n', (tester) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = AuthErrorTranslator.translate(context, 'user-not-found');
          return const SizedBox.shrink();
        }),
      );
      expect(message, 'Aucun compte ne correspond à cet email.');
    });

    testWidgets('maps email-already-in-use to French l10n', (tester) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = AuthErrorTranslator.translate(
            context,
            'email-already-in-use',
          );
          return const SizedBox.shrink();
        }),
      );
      expect(message, 'Cet email est déjà utilisé.');
    });

    testWidgets('maps profile-write-failed to French l10n', (tester) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = AuthErrorTranslator.translate(
            context,
            'profile-write-failed',
          );
          return const SizedBox.shrink();
        }),
      );
      expect(message, 'Impossible d’enregistrer votre profil. Réessayez.');
    });

    testWidgets('maps user-profile-conflict to French l10n', (tester) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = AuthErrorTranslator.translate(
            context,
            'user-profile-conflict',
          );
          return const SizedBox.shrink();
        }),
      );
      expect(message, 'Cet email est déjà associé à un autre profil.');
    });

    testWidgets('maps unknown code to generic French error', (tester) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = AuthErrorTranslator.translate(context, 'unknown-code');
          return const SizedBox.shrink();
        }),
      );
      expect(message, 'Une erreur est survenue. Réessayez.');
    });

    testWidgets('fromException uses AuthException code', (tester) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = AuthErrorTranslator.fromException(
            context,
            const AuthException(code: 'weak-password'),
          );
          return const SizedBox.shrink();
        }),
      );
      expect(message, 'Le mot de passe est trop faible.');
    });
  });
}

Widget _harness(Widget Function(BuildContext context) builder) {
  return MaterialApp(
    locale: const Locale('fr'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    home: Builder(builder: builder),
  );
}
