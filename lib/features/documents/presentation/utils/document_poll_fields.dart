import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';

/// Fields refreshed during processing poll — used for selective UI rebuilds.
typedef DocumentPollFields = ({
  DocumentStatus status,
  bool searchEnabled,
  String? errorCode,
  int? chunkCount,
  String updatedAt,
});

DocumentPollFields documentPollFields(Document document) => (
  status: document.status,
  searchEnabled: document.searchEnabled,
  errorCode: document.errorCode,
  chunkCount: document.chunkCount,
  updatedAt: document.updatedAt,
);

bool documentPollFieldsEqual(Document a, Document b) {
  final fa = documentPollFields(a);
  final fb = documentPollFields(b);
  return fa.status == fb.status &&
      fa.searchEnabled == fb.searchEnabled &&
      fa.errorCode == fb.errorCode &&
      fa.chunkCount == fb.chunkCount &&
      fa.updatedAt == fb.updatedAt;
}

/// Merges [updates] into [current]; returns null if nothing changed.
List<Document>? mergeDocumentUpdates(
  List<Document> current,
  Map<String, Document> updates,
) {
  if (updates.isEmpty) {
    return null;
  }
  var changed = false;
  final next = <Document>[];
  for (final doc in current) {
    final updated = updates[doc.id];
    if (updated != null && !documentPollFieldsEqual(doc, updated)) {
      next.add(updated);
      changed = true;
    } else {
      next.add(doc);
    }
  }
  return changed ? next : null;
}

List<Document> upsertDocument(List<Document> current, Document document) {
  final index = current.indexWhere((d) => d.id == document.id);
  if (index < 0) {
    return [document, ...current];
  }
  final next = [...current];
  next[index] = document;
  return next;
}
