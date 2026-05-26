/// Response from `POST /v1/documents` (signed upload URL).
class CreateDocumentResult {
  const CreateDocumentResult({
    required this.id,
    required this.uploadUrl,
    required this.expiresAt,
  });

  final String id;
  final String uploadUrl;
  final String expiresAt;
}
