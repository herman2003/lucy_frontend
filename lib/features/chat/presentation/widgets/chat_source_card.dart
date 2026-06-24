import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../domain/entities/chat_source.dart';

/// Citation card shown after SSE `sources` event (spec §3.3).
class ChatSourceCard extends StatelessWidget {
  const ChatSourceCard({super.key, required this.source});

  final ChatSource source;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final pagesLabel = _pagesLabel(context);

    return Card(
      margin: const EdgeInsets.only(bottom: LucyConstants.kSpacingLow),
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              source.title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: scheme.onSurface),
            ),
            if (pagesLabel != null) ...[
              const SizedBox(height: LucyConstants.kSpacingLow / 2),
              Text(
                pagesLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: LucyConstants.kSpacingLow),
            Text(
              source.excerpt,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }

  String? _pagesLabel(BuildContext context) {
    final start = source.pageStart;
    final end = source.pageEnd;
    if (start == null || end == null) {
      return null;
    }
    return context.l10n.chatSourcePages(start, end);
  }
}
