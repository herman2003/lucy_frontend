// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningSessionItemModel _$LearningSessionItemModelFromJson(
  Map<String, dynamic> json,
) => _LearningSessionItemModel(
  id: json['id'] as String,
  sources:
      (json['sources'] as List<dynamic>?)
          ?.map(
            (e) =>
                LearningSessionSourceModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <LearningSessionSourceModel>[],
  question: json['question'] as String?,
  choices: (json['choices'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  correctIndex: (json['correctIndex'] as num?)?.toInt(),
  explanation: json['explanation'] as String?,
  front: json['front'] as String?,
  back: json['back'] as String?,
);

Map<String, dynamic> _$LearningSessionItemModelToJson(
  _LearningSessionItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'sources': instance.sources,
  'question': instance.question,
  'choices': instance.choices,
  'correctIndex': instance.correctIndex,
  'explanation': instance.explanation,
  'front': instance.front,
  'back': instance.back,
};
