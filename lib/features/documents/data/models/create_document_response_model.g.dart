// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_document_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateDocumentResponseModel _$CreateDocumentResponseModelFromJson(
  Map<String, dynamic> json,
) => _CreateDocumentResponseModel(
  id: json['id'] as String,
  uploadUrl: json['uploadUrl'] as String,
  expiresAt: json['expiresAt'] as String,
);

Map<String, dynamic> _$CreateDocumentResponseModelToJson(
  _CreateDocumentResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uploadUrl': instance.uploadUrl,
  'expiresAt': instance.expiresAt,
};
