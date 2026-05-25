import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/utils/auth_error_translator.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/providers/auth_provider.dart';
import '../pages/sign_up/sign_up_state.dart';

part 'sign_up_notifier.g.dart';

/// Sign up form notifier (UI → Notifier → [AuthService]).
@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  SignUpState build() => const SignUpState();

  void updateFullName(String value) {
    state = state.copyWith(fullName: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> submitSignUp(BuildContext context) async {
    if (!state.canSubmit) {
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      await ref.read(authServiceProvider).signUpWithEmail(
            email: state.email.trim(),
            password: state.password,
            fullName: state.fullName.trim(),
          );
      state = const SignUpState();
      if (!context.mounted) {
        return;
      }
      context.go(LucyRoutePaths.home);
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
}
