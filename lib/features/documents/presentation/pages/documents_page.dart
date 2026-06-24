import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_tertiary_button.dart';
import '../../utils/documents_constants.dart';
import '../controllers/documents_notifier.dart';
import '../controllers/documents_state.dart';
import '../../domain/entities/document_status.dart';
import '../widgets/add_document_sheet.dart';
import '../widgets/document_list_tile.dart';

/// Documents corpus — list, upload, search activation (SPEC §3 P1).
class DocumentsPage extends ConsumerStatefulWidget {
  const DocumentsPage({super.key});

  @override
  ConsumerState<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends ConsumerState<DocumentsPage> {
  Timer? _processingPollTimer;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) {
        return;
      }
      ref.read(documentsProvider.notifier).refresh(context);
    });
  }

  @override
  void dispose() {
    _processingPollTimer?.cancel();
    super.dispose();
  }

  void _syncProcessingPoll(DocumentsState state) {
    if (!state.needsProcessingPoll) {
      _processingPollTimer?.cancel();
      _processingPollTimer = null;
      return;
    }
    if (_processingPollTimer != null) {
      return;
    }
    _processingPollTimer = Timer.periodic(
      DocumentsConstants.processingPollInterval,
      (_) {
        if (!mounted) {
          return;
        }
        ref.read(documentsProvider.notifier).pollForUpdates(context);
      },
    );
  }

  Future<void> _openAddSheet() async {
    final notifier = ref.read(documentsProvider.notifier);
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => AddDocumentSheet(
        onSubmit:
            ({
              required title,
              required fileName,
              required mimeType,
              required bytes,
            }) {
              notifier.uploadDocument(
                context,
                title: title,
                fileName: fileName,
                mimeType: mimeType,
                bytes: bytes,
              );
            },
      ),
    );
  }

  Future<void> _confirmDelete(String documentId, String title) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.documentsDeleteConfirmTitle),
        content: Text(l10n.documentsDeleteConfirmMessage(title)),
        actions: [
          LucyTertiaryButton(
            text: l10n.documentsDialogCancel,
            onPressed: () => Navigator.of(dialogContext).pop(false),
          ),
          LucyTertiaryButton(
            text: l10n.documentsDelete,
            onPressed: () => Navigator.of(dialogContext).pop(true),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      await ref
          .read(documentsProvider.notifier)
          .deleteDocument(context, documentId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(documentsProvider);
    final l10n = context.l10n;
    final notifier = ref.read(documentsProvider.notifier);

    _syncProcessingPoll(state);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.documentsTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.hasBlockingUpload ? null : _openAddSheet,
        backgroundColor: context.colorScheme.primary,
        icon: Icon(Icons.add, color: context.colorScheme.surface),
        label: Text(
          l10n.documentsAdd,
          style: TextStyle(color: context.colorScheme.surface),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => notifier.refresh(context),
        child: state.isLoading && state.documents.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (state.hasProcessingDocument || state.isUploading)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                state.isUploading
                                    ? l10n.documentsStatusUploading
                                    : l10n.documentsProcessingHint,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (state.documents.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            l10n.documentsEmpty,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final doc = state.documents[index];
                        final isBusy = state.busyDocumentId == doc.id;
                        return DocumentListTile(
                          key: ValueKey(doc.id),
                          document: doc,
                          activeSearchCount: state.activeSearchCount,
                          isBusy: isBusy,
                          onSearchToggled: (enabled) =>
                              notifier.toggleSearchEnabled(
                                context,
                                documentId: doc.id,
                                enabled: enabled,
                              ),
                          onDownload: () =>
                              notifier.downloadDocument(context, doc.id),
                          onDelete: () => _confirmDelete(doc.id, doc.title),
                          onReprocess: doc.status == DocumentStatus.failed
                              ? () =>
                                    notifier.reprocessDocument(context, doc.id)
                              : null,
                        );
                      }, childCount: state.documents.length),
                    ),
                ],
              ),
      ),
    );
  }
}
