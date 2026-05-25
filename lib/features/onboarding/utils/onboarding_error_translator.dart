import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/exceptions/onboarding_exception.dart';

/// Maps Lucy onboarding API error codes to l10n (SPEC §4.6–§4.7).
abstract final class OnboardingErrorTranslator {
  OnboardingErrorTranslator._();

  /// Returns a user-facing message for a backend `error` code.
  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    return switch (code) {
      'UNAUTHORIZED' => l10n.onboardingErrorUnauthorized,
      'VALIDATION_ERROR' => l10n.onboardingErrorValidation,
      'ANSWER_TOO_LONG' => l10n.onboardingAnswerTooLong,
      'ONBOARDING_ALREADY_COMPLETE' => l10n.onboardingErrorAlreadyComplete,
      'ONBOARDING_TRANSCRIPT_INCOMPLETE' =>
        l10n.onboardingErrorTranscriptIncomplete,
      'ONBOARDING_PROFILE_INCOMPLETE' => l10n.onboardingErrorProfileIncomplete,
      'ONBOARDING_PENDING_PROFILE_MISSING' =>
        l10n.onboardingErrorPendingProfileMissing,
      'LLM_RESPONSE_INVALID' => l10n.onboardingErrorLlmInvalid,
      'LLM_UNAVAILABLE' => l10n.onboardingErrorLlmUnavailable,
      'INTERNAL_ERROR' => l10n.onboardingErrorInternal,
      _ => l10n.onboardingGenericError,
    };
  }

  /// Resolves any thrown object to a localized onboarding message.
  static String fromException(BuildContext context, Object error) {
    if (error is OnboardingException) {
      return translate(context, error.code);
    }
    return context.l10n.onboardingGenericError;
  }
}
