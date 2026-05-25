import 'package:freezed_annotation/freezed_annotation.dart';

part 'finalize_onboarding_result.freezed.dart';

@freezed
abstract class FinalizeOnboardingResult with _$FinalizeOnboardingResult {
  const factory FinalizeOnboardingResult({
    @Default(true) bool isConfigured,
  }) = _FinalizeOnboardingResult;
}
