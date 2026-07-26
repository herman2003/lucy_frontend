import '../../../../core/localization/l10n/app_localizations.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';
import '../../../../shared/widgets/lucy/lucy_document_card.dart';
import '../../utils/documents_constants.dart';

/// Maps [Document] entities to [LucyDocumentCard] presentation props.
abstract final class DocumentPresentationUtil {
  static String metaLabel(Document document) {
    return '${document.fileName} · ${formatByteSize(document.byteSize)}';
  }

  static String formatByteSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes o';
    }
    if (bytes < 1024 * 1024) {
      final kb = bytes / 1024;
      return '${kb.toStringAsFixed(kb < 10 ? 1 : 0)} Ko';
    }
    final mb = bytes / (1024 * 1024);
    return '${mb.toStringAsFixed(mb < 10 ? 1 : 0)} Mo';
  }

  static String typeLabelForMime(String mimeType) {
    final lower = mimeType.toLowerCase();
    if (lower.contains('pdf')) {
      return 'PDF';
    }
    if (lower.contains('word') || lower.contains('docx')) {
      return 'DOCX';
    }
    if (lower.contains('markdown')) {
      return 'MD';
    }
    if (lower.contains('text')) {
      return 'TXT';
    }
    return 'FILE';
  }

  static LucyDocumentCardVisualStatus visualStatus(DocumentStatus status) {
    return switch (status) {
      DocumentStatus.uploading => LucyDocumentCardVisualStatus.uploading,
      DocumentStatus.processing => LucyDocumentCardVisualStatus.processing,
      DocumentStatus.ready => LucyDocumentCardVisualStatus.ready,
      DocumentStatus.failed => LucyDocumentCardVisualStatus.failed,
    };
  }

  static String statusLabel(AppLocalizations l10n, DocumentStatus status) {
    return switch (status) {
      DocumentStatus.uploading => l10n.documentsStatusUploading,
      DocumentStatus.processing => l10n.documentsStatusProcessing,
      DocumentStatus.ready => l10n.documentsStatusReady,
      DocumentStatus.failed => l10n.documentsStatusFailed,
    };
  }

  static bool searchToggleEnabled({
    required Document document,
    required int activeSearchCount,
    required bool isBusy,
  }) {
    if (document.status != DocumentStatus.ready || isBusy) {
      return false;
    }
    return document.searchEnabled ||
        activeSearchCount < DocumentsConstants.maxActiveSearchDocuments;
  }
}
