/// Documents feature limits (spec Q1).
abstract final class DocumentsConstants {
  DocumentsConstants._();

  static const int maxActiveSearchDocuments = 5;
  static const int completeRetryMaxAttempts = 4;
  static const Duration completeRetryDelay = Duration(seconds: 2);

  /// Poll list while documents are uploading or processing (SPEC DOC-11).
  static const Duration processingPollInterval = Duration(seconds: 3);
}
