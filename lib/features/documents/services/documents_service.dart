import 'package:flutter/foundation.dart';

import '../domain/entities/document.dart';
import '../domain/entities/document_download_result.dart';
import '../domain/exceptions/document_exception.dart';
import '../domain/repositories/documents_repository.dart';
import '../utils/documents_constants.dart';

/// Documents upload and listing orchestration (UI → notifier → service → repository).
class DocumentsService {
  DocumentsService({required DocumentsRepository repository})
    : _repository = repository;

  final DocumentsRepository _repository;

  Future<List<Document>> listDocuments() => _repository.listDocuments();

  Future<Document> getDocument(String id) => _repository.getDocument(id);

  /// Single `complete` attempt during poll (avoid hammering the API).
  Future<Document?> tryCompleteUpload(String documentId) async {
    try {
      await _repository.completeDocument(documentId);
      return _repository.getDocument(documentId);
    } on DocumentException catch (error) {
      if (error.code == 'DOCUMENT_UPLOAD_NOT_READY') {
        return null;
      }
      rethrow;
    }
  }

  Future<Document> uploadDocument({
    required String title,
    required String fileName,
    required String mimeType,
    required List<int> bytes,
  }) async {
    final created = await _repository.createDocument(
      title: title,
      fileName: fileName,
      mimeType: mimeType,
      byteSize: bytes.length,
    );
    if (kIsWeb) {
      await _repository.uploadDocumentFile(
        documentId: created.id,
        bytes: bytes,
        mimeType: mimeType,
        fileName: fileName,
      );
    } else {
      await _repository.uploadBinary(
        uploadUrl: created.uploadUrl,
        bytes: bytes,
        mimeType: mimeType,
      );
    }
    await _completeWithRetry(created.id);
    return _repository.getDocument(created.id);
  }

  Future<Document> setSearchEnabled({
    required String id,
    required bool enabled,
  }) => _repository.setSearchEnabled(id: id, enabled: enabled);

  Future<void> deleteDocument(String id) => _repository.deleteDocument(id);

  Future<void> reprocessDocument(String id) async {
    await _repository.reprocessDocument(id);
  }

  Future<DocumentDownloadResult> getDownloadUrl(String id) =>
      _repository.getDownloadUrl(id);

  Future<void> _completeWithRetry(String documentId) async {
    for (
      var attempt = 0;
      attempt < DocumentsConstants.completeRetryMaxAttempts;
      attempt++
    ) {
      try {
        await _repository.completeDocument(documentId);
        return;
      } on DocumentException catch (error) {
        if (error.code != 'DOCUMENT_UPLOAD_NOT_READY' ||
            attempt == DocumentsConstants.completeRetryMaxAttempts - 1) {
          rethrow;
        }
        await Future<void>.delayed(DocumentsConstants.completeRetryDelay);
      }
    }
  }
}
