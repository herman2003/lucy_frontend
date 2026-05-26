/// Response from `GET /v1/documents/:id/download`.
class DocumentDownloadResult {
  const DocumentDownloadResult({
    required this.downloadUrl,
    required this.expiresAt,
  });

  final String downloadUrl;
  final String expiresAt;
}
