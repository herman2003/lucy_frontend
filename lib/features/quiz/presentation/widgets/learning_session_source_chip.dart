import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_source_card.dart';
import '../../domain/entities/learning_session_source.dart';

/// Citation card for a learning session item source (spec G8 — chat-style).
class LearningSessionSourceChip extends StatelessWidget {
  const LearningSessionSourceChip({super.key, required this.source});

  final LearningSessionSource source;

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
