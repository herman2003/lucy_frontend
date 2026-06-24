import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

/// Reset password UI phase (T10).
enum ResetPasswordView { form, success }

/// Reset password form / success state.
@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const ResetPasswordState._();

  const factory ResetPasswordState({
    @Default(ResetPasswordView.form) ResetPasswordView view,
    @Default(false) bool isLoading,
    @Default('') String email,
    String? submittedEmail,
  }) = _ResetPasswordState;

  bool get canSubmit => !isLoading && email.trim().isNotEmpty;
}
