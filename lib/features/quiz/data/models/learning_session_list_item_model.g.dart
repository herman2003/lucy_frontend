// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningSessionListItemModel _$LearningSessionListItemModelFromJson(
  Map<String, dynamic> json,
) => _LearningSessionListItemModel(
  id: json['id'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  itemCount: (json['itemCount'] as num).toInt(),
  title: json['title'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$LearningSessionListItemModelToJson(
  _LearningSessionListItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'status': instance.status,
  'itemCount': instance.itemCount,
  'title': instance.title,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
