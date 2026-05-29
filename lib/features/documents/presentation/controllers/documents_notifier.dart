import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';
import '../../domain/exceptions/document_exception.dart';
import '../../domain/providers/documents_provider.dart';
import '../../utils/documents_constants.dart';
import '../../utils/document_error_translator.dart';
import '../utils/document_poll_fields.dart';
import 'documents_state.dart';

part 'documents_notifier.g.dart';

@riverpod
class DocumentsNotifier extends _$DocumentsNotifier {
  final Set<String> _failedSnackbarsShown = {};

  @override
  DocumentsState build() => const DocumentsState();

  Future<void> load({bool showFullPageLoader = false}) async {
    if (showFullPageLoader || state.documents.isEmpty) {
      state = state.copyWith(isLoading: true);
    }
    try {
      final documents = await ref
          .read(documentsServiceProvider)
          .listDocuments();
      state = state.copyWith(isLoading: false, documents: documents);
    } catch (_) {
      state = state.copyWith(isLoading: false, documents: []);
      rethrow;
    }
  }

  Future<void> refresh(BuildContext context) async {
    try {
      final previous = state.documents;
      await load(showFullPageLoader: state.documents.isEmpty);
      _notifyNewlyFailed(context, previous, state.documents);
    } catch (error) {
      _showError(context, error);
    }
  }

  /// Per-document poll — no full-page loader (SPEC DOC-11).
  Future<void> pollForUpdates(BuildContext context) async {
    if (!state.needsProcessingPoll) {
      return;
    }

    final pending = state.documents
        .where(
          (d) =>
              d.status == DocumentStatus.uploading ||
              d.status == DocumentStatus.processing,
        )
        .toList();
    if (pending.isEmpty) {
      return;
    }

    final previous = state.documents;
    final service = ref.read(documentsServiceProvider);
    final updates = <String, Document>{};

    for (final doc in pending) {
      // Refresh status only — `complete` runs during upload flow, not on every poll.
      try {
        updates[doc.id] = await service.getDocument(doc.id);
      } catch (_) {
        // Keep last known row until next poll or pull-to-refresh.
      }
    }

    final merged = mergeDocumentUpdates(state.documents, updates);
    if (merged != null) {
      state = state.copyWith(documents: merged);
    }
    if (!context.mounted) {
      return;
    }
    _notifyNewlyFailed(context, previous, state.documents);
  }

  Future<void> uploadDocument(
    BuildContext context, {
    required String title,
    required String fileName,
    required String mimeType,
    required List<int> bytes,
  }) async {
    if (state.hasBlockingUpload) {
      return;
    }

    state = state.copyWith(isUploading: true);
    try {
      final uploaded = await ref
          .read(documentsServiceProvider)
          .uploadDocument(
            title: title,
            fileName: fileName,
            mimeType: mimeType,
            bytes: bytes,
          );
      state = state.copyWith(
        documents: upsertDocument(state.documents, uploaded),
      );
    } catch (error) {
      _showError(context, error);
      await _refreshSilently(context);
    } finally {
      state = state.copyWith(isUploading: false);
    }
  }

  Future<void> toggleSearchEnabled(
    BuildContext context, {
    required String documentId,
    required bool enabled,
  }) async {
    if (enabled &&
        state.activeSearchCount >=
            DocumentsConstants.maxActiveSearchDocuments) {
      _showError(
        context,
        const DocumentException('SEARCH_ACTIVE_LIMIT_EXCEEDED'),
      );
      return;
    }

    state = state.copyWith(busyDocumentId: documentId);
    try {
      final updated = await ref
          .read(documentsServiceProvider)
          .setSearchEnabled(id: documentId, enabled: enabled);
      state = state.copyWith(
        documents: upsertDocument(state.documents, updated),
        busyDocumentId: null,
      );
    } catch (error) {
      state = state.copyWith(busyDocumentId: null);
      _showError(context, error);
    }
  }

  Future<void> deleteDocument(BuildContext context, String documentId) async {
    Document? doc;
    for (final candidate in state.documents) {
      if (candidate.id == documentId) {
        doc = candidate;
        break;
      }
    }
    if (doc == null) {
      return;
    }
    if (doc.status == DocumentStatus.processing) {
      _showError(
        context,
        const DocumentException('DOCUMENT_PROCESSING_IN_PROGRESS'),
      );
      return;
    }

    state = state.copyWith(busyDocumentId: documentId);
    try {
      await ref.read(documentsServiceProvider).deleteDocument(documentId);
      state = state.copyWith(
        documents: state.documents.where((d) => d.id != documentId).toList(),
        busyDocumentId: null,
      );
    } catch (error) {
      state = state.copyWith(busyDocumentId: null);
      _showError(context, error);
    }
  }

  Future<void> reprocessDocument(
    BuildContext context,
    String documentId,
  ) async {
    state = state.copyWith(busyDocumentId: documentId);
    try {
      await ref.read(documentsServiceProvider).reprocessDocument(documentId);
      _failedSnackbarsShown.remove(documentId);
      final updated = await ref
          .read(documentsServiceProvider)
          .getDocument(documentId);
      state = state.copyWith(
        documents: upsertDocument(state.documents, updated),
        busyDocumentId: null,
      );
    } catch (error) {
      state = state.copyWith(busyDocumentId: null);
      _showError(context, error);
    }
  }

  Future<void> downloadDocument(BuildContext context, String documentId) async {
    state = state.copyWith(busyDocumentId: documentId);
    try {
      final result = await ref
          .read(documentsServiceProvider)
          .getDownloadUrl(documentId);
      final uri = Uri.parse(result.downloadUrl);
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        _showError(context, const DocumentException('INTERNAL_ERROR'));
      }
    } catch (error) {
      _showError(context, error);
    } finally {
      state = state.copyWith(busyDocumentId: null);
    }
  }

  Future<void> _refreshSilently(BuildContext context) async {
    try {
      final previous = state.documents;
      final documents = await ref
          .read(documentsServiceProvider)
          .listDocuments();
      state = state.copyWith(documents: documents);
      if (context.mounted) {
        _notifyNewlyFailed(context, previous, documents);
      }
    } catch (_) {
      // Ignore silent refresh errors during upload recovery.
    }
  }

  void _notifyNewlyFailed(
    BuildContext context,
    List<Document> before,
    List<Document> after,
  ) {
    if (!context.mounted) {
      return;
    }
    final l10n = context.l10n;
    for (final doc in after) {
      if (doc.status != DocumentStatus.failed) {
        continue;
      }
      if (_failedSnackbarsShown.contains(doc.id)) {
        continue;
      }
      final wasAlreadyFailed = before.any(
        (d) => d.id == doc.id && d.status == DocumentStatus.failed,
      );
      if (wasAlreadyFailed) {
        continue;
      }
      _failedSnackbarsShown.add(doc.id);
      final code = doc.errorCode ?? 'DOCUMENT_PROCESSING_FAILED';
      LucySnackBar.showError(
        context,
        message: DocumentErrorTranslator.translate(context, code),
        actionLabel: l10n.authResetTryAgain,
        onAction: () => reprocessDocument(context, doc.id),
      );
    }
  }

  void _showError(BuildContext context, Object error) {
    if (!context.mounted) {
      return;
    }
    LucySnackBar.showError(
      context,
      message: DocumentErrorTranslator.fromException(context, error),
    );
  }
}
