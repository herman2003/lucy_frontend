import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document_status.dart';
import 'package:lucy_frontend/features/documents/presentation/utils/document_poll_fields.dart';

void main() {
  const base = Document(
    id: 'doc-1',
    title: 'Notes',
    fileName: 'notes.txt',
    mimeType: 'text/plain',
    byteSize: 10,
    status: DocumentStatus.uploading,
    searchEnabled: false,
    createdAt: '2026-01-01T00:00:00.000Z',
    updatedAt: '2026-01-01T00:00:00.000Z',
  );

  test('mergeDocumentUpdates returns null when nothing changed', () {
    final result = mergeDocumentUpdates([base], {'doc-1': base});
    expect(result, isNull);
  });

  test('mergeDocumentUpdates replaces only changed document', () {
    const updated = Document(
      id: 'doc-1',
      title: 'Notes',
      fileName: 'notes.txt',
      mimeType: 'text/plain',
      byteSize: 10,
      status: DocumentStatus.processing,
      searchEnabled: false,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-02T00:00:00.000Z',
    );
    const other = Document(
      id: 'doc-2',
      title: 'Other',
      fileName: 'other.txt',
      mimeType: 'text/plain',
      byteSize: 5,
      status: DocumentStatus.ready,
      searchEnabled: false,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
    );

    final merged = mergeDocumentUpdates([base, other], {'doc-1': updated});
    expect(merged, isNotNull);
    expect(merged![0].status, DocumentStatus.processing);
    expect(merged[1], other);
  });
}
