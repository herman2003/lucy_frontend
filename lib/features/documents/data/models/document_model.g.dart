// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    _DocumentModel(
      id: json['id'] as String,
      title: json['title'] as String,
      fileName: json['fileName'] as String,
      mimeType: json['mimeType'] as String,
      byteSize: (json['byteSize'] as num).toInt(),
      status: json['status'] as String,
      searchEnabled: json['searchEnabled'] as bool? ?? false,
      errorCode: json['errorCode'] as String?,
      chunkCount: (json['chunkCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$DocumentModelToJson(_DocumentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fileName': instance.fileName,
      'mimeType': instance.mimeType,
      'byteSize': instance.byteSize,
      'status': instance.status,
      'searchEnabled': instance.searchEnabled,
      'errorCode': instance.errorCode,
      'chunkCount': instance.chunkCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
