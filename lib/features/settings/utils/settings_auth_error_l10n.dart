import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../../auth/domain/exceptions/auth_exception.dart';

/// Maps Firebase auth errors for settings password change.
abstract final class SettingsAuthErrorL10n {
  SettingsAuthErrorL10n._();

  static String fromException(BuildContext context, Object error) {
    final l10n = context.l10n;
    if (error is AuthException) {
      return switch (error.code) {
        'wrong-password' ||
        'invalid-credential' => l10n.settingsInvalidCurrentPassword,
        'weak-password' => l10n.authWeakPassword,
        'password-mismatch' => l10n.settingsPasswordMismatch,
        _ => l10n.settingsPasswordChangeFailed,
      };
    }
    return l10n.settingsPasswordChangeFailed;
  }
}
