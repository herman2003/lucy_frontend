// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatSourceModel _$ChatSourceModelFromJson(Map<String, dynamic> json) =>
    _ChatSourceModel(
      documentId: json['documentId'] as String,
      title: json['title'] as String,
      chunkId: json['chunkId'] as String,
      excerpt: json['excerpt'] as String,
      pageStart: (json['pageStart'] as num?)?.toInt(),
      pageEnd: (json['pageEnd'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ChatSourceModelToJson(_ChatSourceModel instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'title': instance.title,
      'chunkId': instance.chunkId,
      'excerpt': instance.excerpt,
      'pageStart': instance.pageStart,
      'pageEnd': instance.pageEnd,
      'score': instance.score,
    };
