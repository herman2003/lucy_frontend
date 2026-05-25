import 'package:flutter/material.dart';

import '../extensions/context.dart';

/// Form validators for auth flows (messages via l10n).
class Validators {
  Validators._();

  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? validateEmail(BuildContext context, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return context.l10n.authEmailRequired;
    }
    if (!_emailPattern.hasMatch(trimmed)) {
      return context.l10n.authInvalidEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.authPasswordRequired;
    }
    if (value.length < 6) {
      return context.l10n.authWeakPassword;
    }
    return null;
  }
}
