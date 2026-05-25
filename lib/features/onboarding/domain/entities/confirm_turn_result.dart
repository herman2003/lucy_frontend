import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_turn_result.freezed.dart';

@freezed
abstract class ConfirmTurnResult with _$ConfirmTurnResult {
  const factory ConfirmTurnResult({
    required String onboardingStatus,
    required int completedTurns,
  }) = _ConfirmTurnResult;
}
