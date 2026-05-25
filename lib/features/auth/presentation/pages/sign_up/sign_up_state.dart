import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

/// Sign up form state (T09).
@freezed
abstract class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default(false) bool isLoading,
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String password,
  }) = _SignUpState;

  bool get canSubmit =>
      !isLoading &&
      fullName.trim().isNotEmpty &&
      email.trim().isNotEmpty &&
      password.isNotEmpty;
}
