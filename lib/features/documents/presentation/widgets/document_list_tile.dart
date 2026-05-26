import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';
import '../../utils/documents_constants.dart';

class DocumentListTile extends StatelessWidget {
  const DocumentListTile({
    required this.document,
    required this.activeSearchCount,
    required this.isBusy,
    required this.onSearchToggled,
    required this.onDownload,
    required this.onDelete,
    super.key,
  });

  final Document document;
  final int activeSearchCount;
  final bool isBusy;
  final void Function(bool enabled) onSearchToggled;
  final VoidCallback onDownload;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final canToggleSearch = document.status == DocumentStatus.ready;
    final searchSwitchEnabled = canToggleSearch &&
        (!isBusy) &&
        (document.searchEnabled ||
            activeSearchCount < DocumentsConstants.maxActiveSearchDocuments);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        title: Text(document.title),
        subtitle: Text(
          '${document.fileName} · ${_statusLabel(l10n, document.status)}',
          style: theme.textTheme.bodySmall,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (canToggleSearch)
              Switch(
                value: document.searchEnabled,
                onChanged: searchSwitchEnabled ? onSearchToggled : null,
              ),
            PopupMenuButton<String>(
              enabled: !isBusy,
              onSelected: (value) {
                switch (value) {
                  case 'download':
                    onDownload();
                  case 'delete':
                    onDelete();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'download',
                  child: Text(l10n.documentsDownload),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text(l10n.documentsDelete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _statusLabel(AppLocalizations l10n, DocumentStatus status) {
    return switch (status) {
      DocumentStatus.uploading => l10n.documentsStatusUploading,
      DocumentStatus.processing => l10n.documentsStatusProcessing,
      DocumentStatus.ready => l10n.documentsStatusReady,
      DocumentStatus.failed => l10n.documentsStatusFailed,
    };
  }
}
