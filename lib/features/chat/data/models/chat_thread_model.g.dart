// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_thread_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatThreadModel _$ChatThreadModelFromJson(Map<String, dynamic> json) =>
    _ChatThreadModel(
      id: json['id'] as String,
      title: json['title'] as String,
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String?,
      lastMessagePreview: json['lastMessagePreview'] as String?,
    );

Map<String, dynamic> _$ChatThreadModelToJson(_ChatThreadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'lastMessagePreview': instance.lastMessagePreview,
    };
