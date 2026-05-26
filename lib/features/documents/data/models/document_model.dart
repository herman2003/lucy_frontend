import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

/// API document metadata (`GET /v1/documents`, `GET /v1/documents/:id`).
@freezed
abstract class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    required String id,
    required String title,
    required String fileName,
    required String mimeType,
    required int byteSize,
    required String status,
    @Default(false) bool searchEnabled,
    String? errorCode,
    int? chunkCount,
    required String createdAt,
    required String updatedAt,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
}
