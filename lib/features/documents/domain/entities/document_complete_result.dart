/// Response from `POST /v1/documents/:id/complete`.
class DocumentCompleteResult {
  const DocumentCompleteResult({required this.id, required this.status});

  final String id;
  final String status;
}
