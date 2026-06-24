import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_l10n.dart';

void main() {
  group('OnboardingQuestionIds', () {
    test('ordered list has seven unique steps', () {
      expect(
        OnboardingQuestionIds.ordered,
        hasLength(OnboardingQuestionIds.stepCount),
      );
      expect(OnboardingQuestionIds.ordered.toSet(), hasLength(7));
    });
  });

  group('onboardingQuestionText', () {
    for (final locale in [
      const Locale('fr'),
      const Locale('en'),
      const Locale('de'),
    ]) {
      test(
        'returns non-empty labels for every question in ${locale.languageCode}',
        () {
          final l10n = lookupAppLocalizations(locale);
          for (final questionId in OnboardingQuestionIds.ordered) {
            final text = onboardingQuestionText(l10n, questionId);
            expect(text.trim(), isNotEmpty, reason: questionId);
          }
        },
      );
    }

    test('throws for unknown questionId', () {
      final l10n = lookupAppLocalizations(const Locale('en'));
      expect(
        () => onboardingQuestionText(l10n, 'unknown'),
        throwsArgumentError,
      );
    });
  });
}
