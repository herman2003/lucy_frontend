// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningSessionModel _$LearningSessionModelFromJson(
  Map<String, dynamic> json,
) => _LearningSessionModel(
  id: json['id'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  itemCount: (json['itemCount'] as num).toInt(),
  title: json['title'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  activeDocumentCount: (json['activeDocumentCount'] as num).toInt(),
  sourceChatId: json['sourceChatId'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => LearningSessionItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <LearningSessionItemModel>[],
);

Map<String, dynamic> _$LearningSessionModelToJson(
  _LearningSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'status': instance.status,
  'itemCount': instance.itemCount,
  'title': instance.title,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'activeDocumentCount': instance.activeDocumentCount,
  'sourceChatId': instance.sourceChatId,
  'items': instance.items,
};
