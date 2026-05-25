import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/utils/auth_error_translator.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/providers/auth_provider.dart';
import '../pages/login/login_state.dart';

part 'login_notifier.g.dart';

/// Login form notifier (UI → Notifier → [AuthService]).
@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() => const LoginState();

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  Future<void> submitLogin(BuildContext context) async {
    if (!state.canSubmit) {
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      await ref.read(authServiceProvider).loginWithEmail(
            email: state.email.trim(),
            password: state.password,
          );
      state = const LoginState();
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
