import '../entities/create_document_result.dart';
import '../entities/document.dart';
import '../entities/document_complete_result.dart';
import '../entities/document_download_result.dart';

abstract class DocumentsRepository {
  Future<CreateDocumentResult> createDocument({
    required String title,
    required String fileName,
    required String mimeType,
    required int byteSize,
  });

  Future<List<Document>> listDocuments();

  Future<Document> getDocument(String id);

  Future<void> deleteDocument(String id);

  Future<DocumentCompleteResult> completeDocument(String id);

  Future<void> uploadBinary({
    required String uploadUrl,
    required List<int> bytes,
    required String mimeType,
  });

  Future<Document> setSearchEnabled({
    required String id,
    required bool enabled,
  });

  Future<DocumentDownloadResult> getDownloadUrl(String id);
}
