import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_eligibility_model.freezed.dart';
part 'quiz_eligibility_model.g.dart';

@freezed
abstract class QuizEligibilityModel with _$QuizEligibilityModel {
  const factory QuizEligibilityModel({
    required bool canQuiz,
    required int activeDocumentCount,
  }) = _QuizEligibilityModel;

  factory QuizEligibilityModel.fromJson(Map<String, dynamic> json) =>
      _$QuizEligibilityModelFromJson(json);
}
