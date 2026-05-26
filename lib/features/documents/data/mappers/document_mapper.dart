import '../../domain/entities/create_document_result.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';
import '../models/create_document_response_model.dart';
import '../models/document_model.dart';

abstract final class DocumentMapper {
  static Document fromJson(Map<String, dynamic> json) {
    final model = DocumentModel.fromJson(json);
    return fromModel(model);
  }

  static Document fromModel(DocumentModel model) {
    return Document(
      id: model.id,
      title: model.title,
      fileName: model.fileName,
      mimeType: model.mimeType,
      byteSize: model.byteSize,
      status: DocumentStatus.fromApi(model.status),
      searchEnabled: model.searchEnabled,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      errorCode: model.errorCode,
      chunkCount: model.chunkCount,
    );
  }

  static CreateDocumentResult createResponseFromJson(
    Map<String, dynamic> json,
  ) {
    final model = CreateDocumentResponseModel.fromJson(json);
    return CreateDocumentResult(
      id: model.id,
      uploadUrl: model.uploadUrl,
      expiresAt: model.expiresAt,
    );
  }
}
