import 'package:freezed_annotation/freezed_annotation.dart';

import 'learner_profile.dart';

part 'onboarding_analyze_result.freezed.dart';

@freezed
abstract class OnboardingAnalyzeResult with _$OnboardingAnalyzeResult {
  const factory OnboardingAnalyzeResult({
    required LearnerProfile learnerProfile,
    required String summaryForUser,
  }) = _OnboardingAnalyzeResult;
}
