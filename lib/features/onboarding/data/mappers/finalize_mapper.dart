import '../../domain/entities/finalize_onboarding_result.dart';
import '../../domain/exceptions/onboarding_exception.dart';

abstract final class FinalizeMapper {
  static FinalizeOnboardingResult fromJson(Map<String, dynamic> json) {
    final configured = json['isConfigured'];
    if (configured is bool) {
      return FinalizeOnboardingResult(isConfigured: configured);
    }
    if (configured == null) {
      return const FinalizeOnboardingResult();
    }
    throw const OnboardingException('LLM_RESPONSE_INVALID');
  }
}
