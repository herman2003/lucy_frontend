import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_source_card.dart';
import '../../domain/entities/chat_source.dart';

/// Citation card shown after SSE `sources` event (spec §3.3).
class ChatSourceCard extends StatelessWidget {
  const ChatSourceCard({super.key, required this.source});

  final ChatSource source;

  @override
  Widget build(BuildContext context) {
    return LucySourceCard(
      title: source.title,
      excerpt: source.excerpt,
      pagesLabel: _pagesLabel(context),
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
