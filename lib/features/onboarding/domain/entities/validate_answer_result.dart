import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_answer_result.freezed.dart';

@freezed
sealed class ValidateAnswerResult with _$ValidateAnswerResult {
  const factory ValidateAnswerResult.accepted({required String turnSummary}) =
      ValidateAnswerAccepted;

  const factory ValidateAnswerResult.needsRetry({
    required String rephrasedQuestion,
    required String reason,
  }) = ValidateAnswerNeedsRetry;

  const factory ValidateAnswerResult.needsFallback({
    required String fallbackSummary,
  }) = ValidateAnswerNeedsFallback;
}
