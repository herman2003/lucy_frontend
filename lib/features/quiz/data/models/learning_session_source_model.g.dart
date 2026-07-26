// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_session_source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningSessionSourceModel _$LearningSessionSourceModelFromJson(
  Map<String, dynamic> json,
) => _LearningSessionSourceModel(
  chunkId: json['chunkId'] as String,
  documentId: json['documentId'] as String,
  title: json['title'] as String,
  excerpt: json['excerpt'] as String,
  pageStart: (json['pageStart'] as num?)?.toInt(),
  pageEnd: (json['pageEnd'] as num?)?.toInt(),
);

Map<String, dynamic> _$LearningSessionSourceModelToJson(
  _LearningSessionSourceModel instance,
) => <String, dynamic>{
  'chunkId': instance.chunkId,
  'documentId': instance.documentId,
  'title': instance.title,
  'excerpt': instance.excerpt,
  'pageStart': instance.pageStart,
  'pageEnd': instance.pageEnd,
};
