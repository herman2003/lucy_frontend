import 'document_status.dart';

/// Learner document metadata (domain).
class Document {
  const Document({
    required this.id,
    required this.title,
    required this.fileName,
    required this.mimeType,
    required this.byteSize,
    required this.status,
    required this.searchEnabled,
    required this.createdAt,
    required this.updatedAt,
    this.errorCode,
    this.chunkCount,
  });

  final String id;
  final String title;
  final String fileName;
  final String mimeType;
  final int byteSize;
  final DocumentStatus status;
  final bool searchEnabled;
  final String createdAt;
  final String updatedAt;
  final String? errorCode;
  final int? chunkCount;
}
