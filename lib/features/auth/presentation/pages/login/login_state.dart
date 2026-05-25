import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

/// Login form state (T08).
@freezed
abstract class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState({
    @Default(false) bool isLoading,
    @Default('') String email,
    @Default('') String password,
    String? errorMessage,
  }) = _LoginState;

  bool get canSubmit =>
      !isLoading && email.trim().isNotEmpty && password.isNotEmpty;
}
