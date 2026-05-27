// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_eligibility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizEligibilityModel _$QuizEligibilityModelFromJson(
  Map<String, dynamic> json,
) => _QuizEligibilityModel(
  canQuiz: json['canQuiz'] as bool,
  activeDocumentCount: (json['activeDocumentCount'] as num).toInt(),
);

Map<String, dynamic> _$QuizEligibilityModelToJson(
  _QuizEligibilityModel instance,
) => <String, dynamic>{
  'canQuiz': instance.canQuiz,
  'activeDocumentCount': instance.activeDocumentCount,
};
