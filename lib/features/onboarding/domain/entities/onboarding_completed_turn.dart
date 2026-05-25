import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_completed_turn.freezed.dart';

/// Locally stored turn after user confirms Lucy's summary (before confirm-turn API in F06).
@freezed
abstract class OnboardingCompletedTurn with _$OnboardingCompletedTurn {
  const factory OnboardingCompletedTurn({
    required String questionId,
    required String questionText,
    required String answerText,
    required String turnSummary,
  }) = _OnboardingCompletedTurn;
}
