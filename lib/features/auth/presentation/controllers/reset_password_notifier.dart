import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/utils/auth_error_translator.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/exceptions/auth_exception.dart';
import '../../domain/providers/auth_provider.dart';
import '../pages/reset_password/reset_password_state.dart';

part 'reset_password_notifier.g.dart';

/// Reset password notifier — always shows success for unknown emails (Q13).
@riverpod
class ResetPasswordNotifier extends _$ResetPasswordNotifier {
  @override
  ResetPasswordState build() => const ResetPasswordState();

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void tryAgain() {
    state = const ResetPasswordState();
  }

  Future<void> submitReset(BuildContext context) async {
    if (!state.canSubmit) {
      return;
    }

    final email = state.email.trim();
    state = state.copyWith(isLoading: true);

    try {
      await ref.read(authServiceProvider).sendPasswordResetEmail(email: email);
      _showSuccess(email);
    } on AuthException catch (error) {
      if (error.code == 'user-not-found') {
        _showSuccess(email);
        return;
      }
      if (!context.mounted) {
        return;
      }
      state = state.copyWith(isLoading: false);
      LucySnackBar.showError(
        context,
        message: AuthErrorTranslator.fromException(context, error),
      );
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      state = state.copyWith(isLoading: false);
      LucySnackBar.showError(
        context,
        message: AuthErrorTranslator.fromException(context, error),
      );
    }
  }

  void _showSuccess(String email) {
    state = ResetPasswordState(
      view: ResetPasswordView.success,
      submittedEmail: email,
    );
  }
}
