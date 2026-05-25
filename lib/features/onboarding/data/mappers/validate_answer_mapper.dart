import '../../domain/entities/validate_answer_result.dart';
import '../../domain/exceptions/onboarding_exception.dart';

abstract final class ValidateAnswerMapper {
  static ValidateAnswerResult fromJson(Map<String, dynamic> json) {
    final valid = json['valid'];
    if (valid is! bool) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }

    if (valid) {
      final turnSummary = json['turnSummary'];
      if (turnSummary is! String || turnSummary.trim().isEmpty) {
        throw const OnboardingException('LLM_RESPONSE_INVALID');
      }
      return ValidateAnswerResult.accepted(turnSummary: turnSummary.trim());
    }

    final rephrasedQuestion = json['rephrasedQuestion'];
    final reason = json['reason'];
    if (rephrasedQuestion is! String || rephrasedQuestion.trim().isEmpty) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }
    if (reason is! String || reason.isEmpty) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }

    return ValidateAnswerResult.needsRetry(
      rephrasedQuestion: rephrasedQuestion.trim(),
      reason: reason,
    );
  }
}
