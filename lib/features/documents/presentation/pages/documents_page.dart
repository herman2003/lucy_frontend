import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/constants/responsive_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/buttons/lucy_tertiary_button.dart';
import '../../../../shared/widgets/lucy/lucy_document_card.dart';
import '../../../../shared/widgets/lucy/lucy_empty_state.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';
import '../../utils/documents_constants.dart';
import '../controllers/documents_notifier.dart';
import '../controllers/documents_state.dart';
import '../utils/document_presentation_util.dart';
import '../widgets/add_document_sheet.dart';

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

  bool _useDocumentGrid(BuildContext context) {
    return MediaQuery.sizeOf(context).width >=
        ResponsiveConstants.kDesktopBreakpoint;
  }

  Widget _buildDocumentCard(
    Document doc,
    DocumentsState state,
    DocumentsNotifier notifier,
  ) {
    final l10n = context.l10n;
    final isBusy = state.busyDocumentId == doc.id;
    final toggleEnabled = DocumentPresentationUtil.searchToggleEnabled(
      document: doc,
      activeSearchCount: state.activeSearchCount,
      isBusy: isBusy,
    );

    return LucyDocumentCard(
      key: ValueKey(doc.id),
      title: doc.title,
      metaLabel: DocumentPresentationUtil.metaLabel(doc),
      statusLabel: DocumentPresentationUtil.statusLabel(l10n, doc.status),
      visualStatus: DocumentPresentationUtil.visualStatus(doc.status),
      typeLabel: DocumentPresentationUtil.typeLabelForMime(doc.mimeType),
      mimeType: doc.mimeType,
      searchEnabled: doc.searchEnabled,
      searchToggleEnabled: toggleEnabled,
      isBusy: isBusy,
      onToggleSearch: (enabled) => notifier.toggleSearchEnabled(
        context,
        documentId: doc.id,
        enabled: enabled,
      ),
      onDownload: () => notifier.downloadDocument(context, doc.id),
      onDelete: () => _confirmDelete(doc.id, doc.title),
      onReprocess: doc.status == DocumentStatus.failed
          ? () => notifier.reprocessDocument(context, doc.id)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(documentsProvider);
    final l10n = context.l10n;
    final notifier = ref.read(documentsProvider.notifier);
    final lucy = context.lucyTheme;
    final useGrid = _useDocumentGrid(context);

    _syncProcessingPoll(state);

    return Scaffold(
      backgroundColor: lucy.scaffoldBackground,
      body: RefreshIndicator(
        onRefresh: () => notifier.refresh(context),
        child: state.isLoading && state.documents.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: _DocumentsPageHeader(
                      title: l10n.documentsTitle,
                      countLabel: l10n.documentsCount(state.documents.length),
                      addLabel: l10n.documentsAdd,
                      onAdd: state.hasBlockingUpload ? null : _openAddSheet,
                    ),
                  ),
                  if (state.hasProcessingDocument || state.isUploading)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          LucySpacing.spaceLg,
                          0,
                          LucySpacing.spaceLg,
                          LucySpacing.spaceMd,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            const SizedBox(width: LucySpacing.spaceMd),
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
                      child: LucyEmptyState(
                        message: l10n.documentsEmpty,
                        actionLabel: l10n.documentsAdd,
                        onAction: state.hasBlockingUpload ? null : _openAddSheet,
                      ),
                    )
                  else if (useGrid)
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        LucySpacing.spaceLg,
                        0,
                        LucySpacing.spaceLg,
                        LucySpacing.spaceXl,
                      ),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: LucySpacing.spaceMd,
                          crossAxisSpacing: LucySpacing.spaceMd,
                          mainAxisExtent: 188,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _buildDocumentCard(
                            state.documents[index],
                            state,
                            notifier,
                          ),
                          childCount: state.documents.length,
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(
                        LucySpacing.spaceLg,
                        0,
                        LucySpacing.spaceLg,
                        LucySpacing.spaceXl,
                      ),
                      sliver: SliverList.separated(
                        itemCount: state.documents.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: LucySpacing.spaceMd),
                        itemBuilder: (context, index) => _buildDocumentCard(
                          state.documents[index],
                          state,
                          notifier,
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

class _DocumentsPageHeader extends StatelessWidget {
  const _DocumentsPageHeader({
    required this.title,
    required this.countLabel,
    required this.addLabel,
    this.onAdd,
  });

  final String title;
  final String countLabel;
  final String addLabel;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        LucySpacing.spaceLg,
        LucySpacing.spaceXl,
        LucySpacing.spaceLg,
        LucySpacing.spaceLg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: LucySpacing.spaceXs),
                Text(
                  countLabel,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: lucy.muted,
                  ),
                ),
              ],
            ),
          ),
          FilledButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add, size: 18),
            label: Text(addLabel),
          ),
        ],
      ),
    );
  }
}
