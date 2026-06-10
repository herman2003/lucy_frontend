import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/domain/exceptions/onboarding_exception.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_error_translator.dart';

void main() {
  group('OnboardingErrorTranslator', () {
    testWidgets('maps UNAUTHORIZED to French l10n', (tester) async {
      expectMessage(
        tester,
        code: 'UNAUTHORIZED',
        expected: 'Votre session a expiré. Reconnectez-vous.',
      );
    });

    testWidgets('maps VALIDATION_ERROR to French l10n', (tester) async {
      expectMessage(
        tester,
        code: 'VALIDATION_ERROR',
        expected: 'Requête invalide. Réessayez.',
      );
    });

    testWidgets('maps ANSWER_TOO_LONG to French l10n', (tester) async {
      expectMessage(
        tester,
        code: 'ANSWER_TOO_LONG',
        expected:
            'Votre réponse est trop longue (2000 caractères maximum).',
      );
    });

    testWidgets('maps ONBOARDING_ALREADY_COMPLETE to French l10n', (
      tester,
    ) async {
      expectMessage(
        tester,
        code: 'ONBOARDING_ALREADY_COMPLETE',
        expected: 'Votre profil est déjà configuré.',
      );
    });

    testWidgets('maps ONBOARDING_TRANSCRIPT_INCOMPLETE to French l10n', (
      tester,
    ) async {
      expectMessage(
        tester,
        code: 'ONBOARDING_TRANSCRIPT_INCOMPLETE',
        expected:
            'Terminez les 7 questions avant de lancer l’analyse.',
      );
    });

    testWidgets('maps ONBOARDING_PROFILE_INCOMPLETE to French l10n', (
      tester,
    ) async {
      expectMessage(
        tester,
        code: 'ONBOARDING_PROFILE_INCOMPLETE',
        expected:
            'Le profil généré est incomplet. Réessayez ou modifiez vos réponses.',
      );
    });

    testWidgets('maps ONBOARDING_PENDING_PROFILE_MISSING to French l10n', (
      tester,
    ) async {
      expectMessage(
        tester,
        code: 'ONBOARDING_PENDING_PROFILE_MISSING',
        expected:
            'Aucun profil en attente de validation. Relancez l’analyse.',
      );
    });

    testWidgets('maps LLM_RESPONSE_INVALID to French l10n', (tester) async {
      expectMessage(
        tester,
        code: 'LLM_RESPONSE_INVALID',
        expected:
            'Lucy n’a pas pu interpréter la réponse. Réessayez dans un instant.',
      );
    });

    testWidgets('maps LLM_UNAVAILABLE to French l10n', (tester) async {
      expectMessage(
        tester,
        code: 'LLM_UNAVAILABLE',
        expected:
            'Lucy est temporairement indisponible. Réessayez plus tard.',
      );
    });

    testWidgets('maps INTERNAL_ERROR to French l10n', (tester) async {
      expectMessage(
        tester,
        code: 'INTERNAL_ERROR',
        expected: 'Une erreur est survenue. Réessayez.',
      );
    });

    testWidgets('maps unknown code to generic French error', (tester) async {
      expectMessage(
        tester,
        code: 'UNKNOWN_CODE',
        expected: 'Une erreur est survenue. Réessayez.',
      );
    });

    testWidgets('fromException uses OnboardingException code', (
      tester,
    ) async {
      late String message;
      await tester.pumpWidget(
        _harness((context) {
          message = OnboardingErrorTranslator.fromException(
            context,
            const OnboardingException('LLM_UNAVAILABLE', statusCode: 503),
          );
          return const SizedBox.shrink();
        }),
      );
      expect(
        message,
        'Lucy est temporairement indisponible. Réessayez plus tard.',
      );
    });
  });
}

Future<void> expectMessage(
  WidgetTester tester, {
  required String code,
  required String expected,
}) async {
  late String message;
  await tester.pumpWidget(
    _harness((context) {
      message = OnboardingErrorTranslator.translate(context, code);
      return const SizedBox.shrink();
    }),
  );
  expect(message, expected);
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
