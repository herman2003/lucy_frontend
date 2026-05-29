import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/documents/data/mappers/document_mapper.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document_status.dart';

void main() {
  group('DocumentMapper', () {
    test('fromJson maps API document fields', () {
      final doc = DocumentMapper.fromJson({
        'id': 'doc-1',
        'title': 'Grammaire',
        'fileName': 'a.pdf',
        'mimeType': 'application/pdf',
        'byteSize': 1024,
        'status': 'uploading',
        'searchEnabled': false,
        'chunkCount': 3,
        'createdAt': '2026-05-26T10:00:00.000Z',
        'updatedAt': '2026-05-26T10:01:00.000Z',
      });

      expect(doc.id, 'doc-1');
      expect(doc.title, 'Grammaire');
      expect(doc.status, DocumentStatus.uploading);
      expect(doc.chunkCount, 3);
    });

    test('createResponseFromJson maps upload payload', () {
      final result = DocumentMapper.createResponseFromJson({
        'id': 'doc-2',
        'uploadUrl': 'https://storage.example/upload',
        'expiresAt': '2026-05-26T11:00:00.000Z',
      });

      expect(result.id, 'doc-2');
      expect(result.uploadUrl, contains('upload'));
    });
  });
}
