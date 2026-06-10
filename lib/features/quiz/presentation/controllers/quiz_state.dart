import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quiz_eligibility.dart';

part 'quiz_state.freezed.dart';

@freezed
abstract class QuizState with _$QuizState {
  const QuizState._();

  const factory QuizState({
    @Default(false) bool isLoading,
    QuizEligibility? eligibility,
    String? errorCode,
  }) = _QuizState;

  bool get canQuiz => eligibility?.canQuiz ?? false;
}
