import 'package:freezed_annotation/freezed_annotation.dart';

import 'learner_profile.dart';

part 'onboarding_analyze_result.freezed.dart';

@freezed
sealed class OnboardingAnalyzeResult with _$OnboardingAnalyzeResult {
  const factory OnboardingAnalyzeResult.success({
    required LearnerProfile learnerProfile,
    required String summaryForUser,
  }) = OnboardingAnalyzeSuccess;

  const factory OnboardingAnalyzeResult.fallback({
    required String fallbackProfileSummary,
  }) = OnboardingAnalyzeFallback;
}
