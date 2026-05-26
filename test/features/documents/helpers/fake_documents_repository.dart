import 'package:frontend/features/documents/domain/entities/create_document_result.dart';
import 'package:frontend/features/documents/domain/entities/document.dart';
import 'package:frontend/features/documents/domain/entities/document_complete_result.dart';
import 'package:frontend/features/documents/domain/entities/document_download_result.dart';
import 'package:frontend/features/documents/domain/entities/document_status.dart';
import 'package:frontend/features/documents/domain/repositories/documents_repository.dart';

/// In-memory [DocumentsRepository] for widget and service tests.
class FakeDocumentsRepository implements DocumentsRepository {
  FakeDocumentsRepository({List<Document>? initialDocuments})
      : _documents = List<Document>.from(initialDocuments ?? const []);

  final List<Document> _documents;
  int uploadBinaryCallCount = 0;

  @override
  Future<CreateDocumentResult> createDocument({
    required String title,
    required String fileName,
    required String mimeType,
    required int byteSize,
  }) async {
    final id = 'doc-${_documents.length + 1}';
    final now = DateTime.now().toUtc().toIso8601String();
    _documents.add(
      Document(
        id: id,
        title: title,
        fileName: fileName,
        mimeType: mimeType,
        byteSize: byteSize,
        status: DocumentStatus.uploading,
        searchEnabled: false,
        createdAt: now,
        updatedAt: now,
      ),
    );
    return CreateDocumentResult(
      id: id,
      uploadUrl: 'https://example.test/upload/$id',
      expiresAt: now,
    );
  }

  @override
  Future<List<Document>> listDocuments() async =>
      List<Document>.unmodifiable(_documents);

  @override
  Future<Document> getDocument(String id) async {
    return _documents.firstWhere((d) => d.id == id);
  }

  @override
  Future<void> deleteDocument(String id) async {
    _documents.removeWhere((d) => d.id == id);
  }

  @override
  Future<DocumentCompleteResult> completeDocument(String id) async {
    final index = _documents.indexWhere((d) => d.id == id);
    if (index < 0) {
      throw StateError('Document not found: $id');
    }
    final current = _documents[index];
    final updated = Document(
      id: current.id,
      title: current.title,
      fileName: current.fileName,
      mimeType: current.mimeType,
      byteSize: current.byteSize,
      status: DocumentStatus.ready,
      searchEnabled: current.searchEnabled,
      createdAt: current.createdAt,
      updatedAt: DateTime.now().toUtc().toIso8601String(),
    );
    _documents[index] = updated;
    return DocumentCompleteResult(id: id, status: DocumentStatus.ready.name);
  }

  @override
  Future<void> uploadBinary({
    required String uploadUrl,
    required List<int> bytes,
    required String mimeType,
  }) async {
    uploadBinaryCallCount++;
  }

  @override
  Future<Document> setSearchEnabled({
    required String id,
    required bool enabled,
  }) async {
    final index = _documents.indexWhere((d) => d.id == id);
    final current = _documents[index];
    final updated = Document(
      id: current.id,
      title: current.title,
      fileName: current.fileName,
      mimeType: current.mimeType,
      byteSize: current.byteSize,
      status: current.status,
      searchEnabled: enabled,
      createdAt: current.createdAt,
      updatedAt: DateTime.now().toUtc().toIso8601String(),
    );
    _documents[index] = updated;
    return updated;
  }

  @override
  Future<DocumentDownloadResult> getDownloadUrl(String id) async {
    return DocumentDownloadResult(
      downloadUrl: 'https://example.test/download/$id',
      expiresAt: DateTime.now().toUtc().toIso8601String(),
    );
  }
}
