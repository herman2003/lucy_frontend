import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../domain/entities/learning_session_source.dart';

class LearningSessionSourceChip extends StatelessWidget {
  const LearningSessionSourceChip({super.key, required this.source});

  final LearningSessionSource source;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final pagesLabel = _pagesLabel(context);

    return Chip(
      backgroundColor: scheme.surfaceContainerHighest,
      label: Text(
        pagesLabel == null ? source.title : '${source.title} · $pagesLabel',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: scheme.onSurfaceVariant,
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
