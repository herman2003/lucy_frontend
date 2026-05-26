import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/document_status.dart';
import '../../domain/exceptions/document_exception.dart';
import '../../domain/providers/documents_provider.dart';
import '../../utils/documents_constants.dart';
import '../../utils/document_error_translator.dart';
import 'documents_state.dart';

part 'documents_notifier.g.dart';

@riverpod
class DocumentsNotifier extends _$DocumentsNotifier {
  @override
  DocumentsState build() => const DocumentsState();

  Future<void> load() async {
    state = state.copyWith(isLoading: true);
    try {
      final documents = await ref.read(documentsServiceProvider).listDocuments();
      state = state.copyWith(isLoading: false, documents: documents);
    } catch (_) {
      state = state.copyWith(isLoading: false, documents: []);
      rethrow;
    }
  }

  Future<void> refresh(BuildContext context) async {
    try {
      await load();
    } catch (error) {
      _showError(context, error);
    }
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
      await ref.read(documentsServiceProvider).uploadDocument(
            title: title,
            fileName: fileName,
            mimeType: mimeType,
            bytes: bytes,
          );
      await load();
    } catch (error) {
      _showError(context, error);
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
        state.activeSearchCount >= DocumentsConstants.maxActiveSearchDocuments) {
      _showError(
        context,
        const DocumentException('SEARCH_ACTIVE_LIMIT_EXCEEDED'),
      );
      return;
    }

    state = state.copyWith(busyDocumentId: documentId);
    try {
      final updated = await ref.read(documentsServiceProvider).setSearchEnabled(
            id: documentId,
            enabled: enabled,
          );
      final next = state.documents
          .map((d) => d.id == documentId ? updated : d)
          .toList();
      state = state.copyWith(documents: next, busyDocumentId: null);
    } catch (error) {
      state = state.copyWith(busyDocumentId: null);
      _showError(context, error);
    }
  }

  Future<void> deleteDocument(BuildContext context, String documentId) async {
    final doc = state.documents.firstWhere((d) => d.id == documentId);
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
      await load();
    } catch (error) {
      _showError(context, error);
    } finally {
      state = state.copyWith(busyDocumentId: null);
    }
  }

  Future<void> downloadDocument(BuildContext context, String documentId) async {
    state = state.copyWith(busyDocumentId: documentId);
    try {
      final result =
          await ref.read(documentsServiceProvider).getDownloadUrl(documentId);
      final uri = Uri.parse(result.downloadUrl);
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched && context.mounted) {
        _showError(context, const DocumentException('INTERNAL_ERROR'));
      }
    } catch (error) {
      _showError(context, error);
    } finally {
      state = state.copyWith(busyDocumentId: null);
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
