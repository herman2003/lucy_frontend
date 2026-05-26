import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_document_response_model.freezed.dart';
part 'create_document_response_model.g.dart';

/// `POST /v1/documents` response.
@freezed
abstract class CreateDocumentResponseModel with _$CreateDocumentResponseModel {
  const factory CreateDocumentResponseModel({
    required String id,
    required String uploadUrl,
    required String expiresAt,
  }) = _CreateDocumentResponseModel;

  factory CreateDocumentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDocumentResponseModelFromJson(json);
}
