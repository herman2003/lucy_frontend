/// Document pipeline status (aligned with backend `DocumentStatus`).
enum DocumentStatus {
  uploading,
  processing,
  ready,
  failed;

  static DocumentStatus fromApi(String raw) {
    return DocumentStatus.values.firstWhere(
      (status) => status.name == raw,
      orElse: () =>
          throw ArgumentError.value(raw, 'raw', 'Unknown document status'),
    );
  }
}
