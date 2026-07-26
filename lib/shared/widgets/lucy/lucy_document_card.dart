import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';
import 'lucy_chip.dart';

/// Visual pipeline state for [LucyDocumentCard] (data-only, no feature imports).
enum LucyDocumentCardVisualStatus {
  uploading,
  processing,
  ready,
  failed,
}

/// Document card for the corpus grid/list (V3/V4 redesign).
class LucyDocumentCard extends StatelessWidget {
  const LucyDocumentCard({
    required this.title,
    required this.metaLabel,
    required this.statusLabel,
    required this.visualStatus,
    required this.typeLabel,
    required this.searchEnabled,
    required this.searchToggleEnabled,
    super.key,
    this.onToggleSearch,
    this.onTap,
    this.onDownload,
    this.onDelete,
    this.onReprocess,
    this.isBusy = false,
    this.mimeType,
  });

  final String title;
  final String metaLabel;
  final String statusLabel;
  final LucyDocumentCardVisualStatus visualStatus;
  final String typeLabel;
  final bool searchEnabled;
  final bool searchToggleEnabled;
  final ValueChanged<bool>? onToggleSearch;
  final VoidCallback? onTap;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  final VoidCallback? onReprocess;
  final bool isBusy;
  final String? mimeType;

  bool get _showProcessing =>
      visualStatus == LucyDocumentCardVisualStatus.uploading ||
      visualStatus == LucyDocumentCardVisualStatus.processing;

  bool get _canToggleSearch =>
      visualStatus == LucyDocumentCardVisualStatus.ready;

  LucyChipVariant get _statusVariant => switch (visualStatus) {
        LucyDocumentCardVisualStatus.ready => LucyChipVariant.teal,
        LucyDocumentCardVisualStatus.failed => LucyChipVariant.error,
        _ => LucyChipVariant.neutral,
      };

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final l10n = context.l10n;

    return Material(
      color: scheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
        side: BorderSide(color: lucy.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(LucySpacing.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TypeIcon(mimeType: mimeType),
                  const SizedBox(width: LucySpacing.spaceMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: scheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: LucySpacing.spaceXs),
                        Text(
                          metaLabel,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  if (onDownload != null ||
                      onDelete != null ||
                      onReprocess != null)
                    _DocumentMenu(
                      enabled: !isBusy,
                      onDownload: onDownload,
                      onDelete: onDelete,
                      onReprocess: onReprocess,
                      downloadLabel: l10n.documentsDownload,
                      deleteLabel: l10n.documentsDelete,
                      reprocessLabel: l10n.authResetTryAgain,
                    ),
                ],
              ),
              const SizedBox(height: LucySpacing.spaceMd),
              Row(
                children: [
                  LucyChip(label: typeLabel),
                  const SizedBox(width: LucySpacing.spaceSm),
                  LucyChip(
                    label: statusLabel,
                    variant: _statusVariant,
                  ),
                  const Spacer(),
                  if (_canToggleSearch)
                    Switch(
                      value: searchEnabled,
                      onChanged:
                          searchToggleEnabled ? onToggleSearch : null,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                ],
              ),
              if (_showProcessing) ...[
                const SizedBox(height: LucySpacing.spaceMd),
                const LinearProgressIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeIcon extends StatelessWidget {
  const _TypeIcon({this.mimeType});

  final String? mimeType;

  IconData get _icon {
    final type = mimeType?.toLowerCase() ?? '';
    if (type.contains('pdf')) {
      return Icons.picture_as_pdf_outlined;
    }
    if (type.contains('word') || type.contains('docx')) {
      return Icons.description_outlined;
    }
    if (type.contains('markdown') || type.contains('text')) {
      return Icons.article_outlined;
    }
    return Icons.insert_drive_file_outlined;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: scheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
      ),
      child: Icon(_icon, color: scheme.primary, size: 22),
    );
  }
}

class _DocumentMenu extends StatelessWidget {
  const _DocumentMenu({
    required this.enabled,
    required this.downloadLabel,
    required this.deleteLabel,
    required this.reprocessLabel,
    this.onDownload,
    this.onDelete,
    this.onReprocess,
  });

  final bool enabled;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;
  final VoidCallback? onReprocess;
  final String downloadLabel;
  final String deleteLabel;
  final String reprocessLabel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      enabled: enabled,
      icon: const Icon(Icons.more_vert, size: 20),
      onSelected: (value) {
        switch (value) {
          case 'reprocess':
            onReprocess?.call();
          case 'download':
            onDownload?.call();
          case 'delete':
            onDelete?.call();
        }
      },
      itemBuilder: (context) => [
        if (onReprocess != null)
          PopupMenuItem(value: 'reprocess', child: Text(reprocessLabel)),
        if (onDownload != null)
          PopupMenuItem(value: 'download', child: Text(downloadLabel)),
        if (onDelete != null)
          PopupMenuItem(value: 'delete', child: Text(deleteLabel)),
      ],
    );
  }
}
