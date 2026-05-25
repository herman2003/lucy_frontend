import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/exceptions/onboarding_exception.dart';

/// Maps onboarding error codes to l10n (SPEC §4.7; full mapper in F08).
abstract final class OnboardingErrorTranslator {
  static String fromException(BuildContext context, Object error) {
    if (error is OnboardingException) {
      return switch (error.code) {
        'ANSWER_TOO_LONG' => context.l10n.onboardingAnswerTooLong,
        'UNAUTHORIZED' => context.l10n.authNetworkError,
        _ => context.l10n.onboardingGenericError,
      };
    }
    return context.l10n.onboardingGenericError;
  }
}
