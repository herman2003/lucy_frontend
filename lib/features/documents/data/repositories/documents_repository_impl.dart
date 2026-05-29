import '../../domain/entities/create_document_result.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/document_complete_result.dart';
import '../../domain/entities/document_download_result.dart';
import '../../domain/repositories/documents_repository.dart';
import '../datasources/documents_api_remote_data_source.dart';
import '../mappers/document_mapper.dart';

class DocumentsRepositoryImpl implements DocumentsRepository {
  DocumentsRepositoryImpl(this._remote);

  final DocumentsApiRemoteDataSource _remote;

  @override
  Future<CreateDocumentResult> createDocument({
    required String title,
    required String fileName,
    required String mimeType,
    required int byteSize,
  }) async {
    final response = await _remote.createDocument(
      title: title,
      fileName: fileName,
      mimeType: mimeType,
      byteSize: byteSize,
    );
    return CreateDocumentResult(
      id: response.id,
      uploadUrl: response.uploadUrl,
      expiresAt: response.expiresAt,
    );
  }

  @override
  Future<List<Document>> listDocuments() async {
    final models = await _remote.listDocuments();
    return models.map(DocumentMapper.fromModel).toList();
  }

  @override
  Future<Document> getDocument(String id) async {
    final model = await _remote.getDocument(id);
    return DocumentMapper.fromModel(model);
  }

  @override
  Future<void> deleteDocument(String id) => _remote.deleteDocument(id);

  @override
  Future<DocumentCompleteResult> completeDocument(String id) =>
      _remote.completeDocument(id);

  @override
  Future<DocumentCompleteResult> reprocessDocument(String id) =>
      _remote.reprocessDocument(id);

  @override
  Future<void> uploadBinary({
    required String uploadUrl,
    required List<int> bytes,
    required String mimeType,
  }) => _remote.uploadBinary(
    uploadUrl: uploadUrl,
    bytes: bytes,
    mimeType: mimeType,
  );

  @override
  Future<void> uploadDocumentFile({
    required String documentId,
    required List<int> bytes,
    required String mimeType,
    required String fileName,
  }) => _remote.uploadDocumentFile(
    documentId: documentId,
    bytes: bytes,
    mimeType: mimeType,
    fileName: fileName,
  );

  @override
  Future<Document> setSearchEnabled({
    required String id,
    required bool enabled,
  }) async {
    final model = await _remote.patchSearchEnabled(
      id: id,
      searchEnabled: enabled,
    );
    return DocumentMapper.fromModel(model);
  }

  @override
  Future<DocumentDownloadResult> getDownloadUrl(String id) =>
      _remote.getDownloadUrl(id);
}
