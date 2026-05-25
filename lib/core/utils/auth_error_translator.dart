import 'package:flutter/material.dart';

import '../extensions/context.dart';
import '../../features/auth/domain/exceptions/auth_exception.dart';

/// Maps Firebase [AuthException.code] values to localized UI messages.
class AuthErrorTranslator {
  AuthErrorTranslator._();

  /// Returns a user-facing message for a Firebase/auth error [code].
  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    switch (code) {
      case 'user-not-found':
        return l10n.authUserNotFound;
      case 'wrong-password':
        return l10n.authWrongPassword;
      case 'invalid-credential':
        return l10n.authInvalidCredentials;
      case 'email-already-in-use':
        return l10n.authEmailAlreadyInUse;
      case 'weak-password':
        return l10n.authWeakPassword;
      case 'invalid-email':
        return l10n.authInvalidEmail;
      case 'network-request-failed':
        return l10n.authNetworkError;
      case 'too-many-requests':
        return l10n.authTooManyRequests;
      case 'user-disabled':
        return l10n.authUserDisabled;
      case 'operation-not-allowed':
        return l10n.authOperationNotAllowed;
      case 'profile-write-failed':
        return l10n.authProfileWriteFailed;
      case 'user-profile-conflict':
        return l10n.authUserProfileConflict;
      default:
        return l10n.authUnknownError;
    }
  }

  /// Resolves any thrown object to a localized auth message.
  static String fromException(BuildContext context, Object error) {
    if (error is AuthException) {
      return translate(context, error.code);
    }
    return context.l10n.authUnknownError;
  }
}
