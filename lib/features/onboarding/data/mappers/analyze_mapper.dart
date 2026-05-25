import '../../domain/entities/learner_profile.dart';
import '../../domain/entities/onboarding_analyze_result.dart';
import '../../domain/exceptions/onboarding_exception.dart';

abstract final class AnalyzeMapper {
  static OnboardingAnalyzeResult fromJson(Map<String, dynamic> json) {
    final profileRaw = json['learnerProfile'];
    final summary = json['summaryForUser'];
    if (profileRaw is! Map<String, dynamic>) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }
    if (summary is! String || summary.trim().isEmpty) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }

    try {
      final profile = LearnerProfile.fromApiJson(profileRaw);
      return OnboardingAnalyzeResult(
        learnerProfile: profile,
        summaryForUser: summary.trim(),
      );
    } on OnboardingException {
      rethrow;
    } on Object {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }
  }
}
