/// Maps file extensions to API mime types (spec V1).
abstract final class DocumentMimeUtil {
  DocumentMimeUtil._();

  static const allowedExtensions = ['pdf', 'docx', 'txt', 'md'];

  static String? mimeTypeForFileName(String fileName) {
    final lower = fileName.toLowerCase();
    if (lower.endsWith('.pdf')) {
      return 'application/pdf';
    }
    if (lower.endsWith('.docx')) {
      return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    }
    if (lower.endsWith('.txt')) {
      return 'text/plain';
    }
    if (lower.endsWith('.md')) {
      return 'text/markdown';
    }
    return null;
  }
}
