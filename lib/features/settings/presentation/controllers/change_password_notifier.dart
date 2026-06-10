import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/exceptions/auth_exception.dart';
import '../../../auth/domain/providers/auth_provider.dart';

part 'change_password_notifier.g.dart';

@riverpod
class ChangePasswordNotifier extends _$ChangePasswordNotifier {
  @override
  bool build() => false;

  Future<bool> submit({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword != confirmPassword) {
      throw const AuthException(code: 'password-mismatch');
    }
    state = true;
    try {
      await ref
          .read(authServiceProvider)
          .updatePassword(
            currentPassword: currentPassword,
            newPassword: newPassword,
          );
      return true;
    } on AuthException {
      rethrow;
    } catch (_) {
      throw const AuthException(code: 'settings-password-change-failed');
    } finally {
      state = false;
    }
  }
}
