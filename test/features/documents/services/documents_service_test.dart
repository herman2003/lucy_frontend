import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/documents/domain/entities/document_status.dart';
import 'package:frontend/features/documents/services/documents_service.dart';

import '../helpers/fake_documents_repository.dart';

void main() {
  test('uploadDocument runs create, binary upload, and complete', () async {
    final repository = FakeDocumentsRepository();
    final service = DocumentsService(repository: repository);

    final doc = await service.uploadDocument(
      title: 'Notes',
      fileName: 'notes.txt',
      mimeType: 'text/plain',
      bytes: [1, 2, 3],
    );

    expect(repository.uploadBinaryCallCount, 1);
    expect(doc.status, DocumentStatus.ready);
    expect(doc.title, 'Notes');

    final list = await service.listDocuments();
    expect(list, hasLength(1));
    expect(list.first.id, doc.id);
  });

  test('setSearchEnabled delegates to repository', () async {
    final repository = FakeDocumentsRepository();
    final service = DocumentsService(repository: repository);

    final created = await service.uploadDocument(
      title: 'Doc',
      fileName: 'a.txt',
      mimeType: 'text/plain',
      bytes: [1],
    );

    final updated = await service.setSearchEnabled(
      id: created.id,
      enabled: true,
    );
    expect(updated.searchEnabled, isTrue);
  });

  test('getDownloadUrl returns signed URL from repository', () async {
    final repository = FakeDocumentsRepository();
    final service = DocumentsService(repository: repository);

    final created = await service.uploadDocument(
      title: 'Doc',
      fileName: 'a.txt',
      mimeType: 'text/plain',
      bytes: [1],
    );

    final result = await service.getDownloadUrl(created.id);
    expect(result.downloadUrl, contains(created.id));
  });
}
