import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context.dart';
import '../controllers/documents_notifier.dart';
import '../widgets/add_document_sheet.dart';
import '../widgets/document_list_tile.dart';

/// Documents corpus — list, upload, search activation (SPEC §3 P1).
class DocumentsPage extends ConsumerStatefulWidget {
  const DocumentsPage({super.key});

  @override
  ConsumerState<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends ConsumerState<DocumentsPage> {
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

  Future<void> _openAddSheet() async {
    final notifier = ref.read(documentsProvider.notifier);
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => AddDocumentSheet(
        onSubmit: ({
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
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.documentsDialogCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.documentsDelete),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.documentsTitle),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.hasBlockingUpload ? null : _openAddSheet,
        icon: const Icon(Icons.add),
        label: Text(l10n.documentsAdd),
      ),
      body: RefreshIndicator(
        onRefresh: () => notifier.refresh(context),
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (state.hasProcessingDocument)
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
                                l10n.documentsProcessingHint,
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
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final doc = state.documents[index];
                          final isBusy = state.busyDocumentId == doc.id;
                          return DocumentListTile(
                            document: doc,
                            activeSearchCount: state.activeSearchCount,
                            isBusy: isBusy || state.isUploading,
                            onSearchToggled: (enabled) => notifier.toggleSearchEnabled(
                              context,
                              documentId: doc.id,
                              enabled: enabled,
                            ),
                            onDownload: () => notifier.downloadDocument(
                              context,
                              doc.id,
                            ),
                            onDelete: () => _confirmDelete(doc.id, doc.title),
                          );
                        },
                        childCount: state.documents.length,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
