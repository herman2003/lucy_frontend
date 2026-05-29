import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document_status.dart';
import 'package:lucy_frontend/features/documents/presentation/controllers/documents_state.dart';

void main() {
  const baseDoc = Document(
    id: '1',
    title: 'Notes',
    fileName: 'notes.pdf',
    mimeType: 'application/pdf',
    byteSize: 100,
    status: DocumentStatus.ready,
    searchEnabled: true,
    createdAt: '2026-01-01T00:00:00.000Z',
    updatedAt: '2026-01-01T00:00:00.000Z',
  );

  test('hasBlockingUpload is true when uploading flag is set', () {
    const state = DocumentsState(isUploading: true);
    expect(state.hasBlockingUpload, isTrue);
  });

  test('hasBlockingUpload is true when a document is processing', () {
    const state = DocumentsState(
      documents: [
        Document(
          id: '1',
          title: 'Notes',
          fileName: 'notes.pdf',
          mimeType: 'application/pdf',
          byteSize: 100,
          status: DocumentStatus.processing,
          searchEnabled: false,
          createdAt: '2026-01-01T00:00:00.000Z',
          updatedAt: '2026-01-01T00:00:00.000Z',
        ),
      ],
    );
    expect(state.hasBlockingUpload, isTrue);
    expect(state.hasProcessingDocument, isTrue);
  });

  test('activeSearchCount counts only ready documents with search enabled', () {
    const state = DocumentsState(
      documents: [
        baseDoc,
        const Document(
          id: '2',
          title: 'Other',
          fileName: 'other.pdf',
          mimeType: 'application/pdf',
          byteSize: 50,
          status: DocumentStatus.ready,
          searchEnabled: false,
          createdAt: '2026-01-01T00:00:00.000Z',
          updatedAt: '2026-01-01T00:00:00.000Z',
        ),
        const Document(
          id: '3',
          title: 'Draft',
          fileName: 'draft.pdf',
          mimeType: 'application/pdf',
          byteSize: 50,
          status: DocumentStatus.processing,
          searchEnabled: true,
          createdAt: '2026-01-01T00:00:00.000Z',
          updatedAt: '2026-01-01T00:00:00.000Z',
        ),
      ],
    );
    expect(state.activeSearchCount, 1);
  });

  test('needsProcessingPoll is true when uploading or processing', () {
    const state = DocumentsState(
      documents: [
        Document(
          id: '1',
          title: 'A',
          fileName: 'a.txt',
          mimeType: 'text/plain',
          byteSize: 1,
          status: DocumentStatus.uploading,
          searchEnabled: false,
          createdAt: '2026-01-01T00:00:00.000Z',
          updatedAt: '2026-01-01T00:00:00.000Z',
        ),
      ],
    );
    expect(state.needsProcessingPoll, isTrue);
  });
}
