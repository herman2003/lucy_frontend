import '../../domain/entities/confirm_turn_result.dart';
import '../../domain/exceptions/onboarding_exception.dart';

abstract final class ConfirmTurnMapper {
  static ConfirmTurnResult fromJson(Map<String, dynamic> json) {
    final status = json['onboardingStatus'];
    final completed = json['completedTurns'];
    if (status is! String || status.isEmpty) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }
    if (completed is! int || completed < 0) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }
    return ConfirmTurnResult(
      onboardingStatus: status,
      completedTurns: completed,
    );
  }
}
