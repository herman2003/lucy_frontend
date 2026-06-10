import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';

/// Maps settings API error codes to l10n.
abstract final class SettingsErrorTranslator {
  SettingsErrorTranslator._();

  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    return switch (code) {
      'UNAUTHORIZED' => l10n.settingsErrorUnauthorized,
      'VALIDATION_ERROR' => l10n.settingsProfileSaveFailed,
      'ONBOARDING_PROFILE_INCOMPLETE' => l10n.settingsLearnerProfileUnavailable,
      _ => l10n.settingsGenericError,
    };
  }
}
