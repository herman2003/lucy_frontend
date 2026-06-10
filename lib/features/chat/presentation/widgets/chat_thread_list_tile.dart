import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../domain/entities/chat_thread.dart';

class ChatThreadListTile extends StatelessWidget {
  const ChatThreadListTile({
    super.key,
    required this.thread,
    required this.selected,
    required this.onTap,
  });

  final ChatThread thread;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final titleColor = selected ? Colors.white : scheme.primary;
    final subtitleColor = selected
        ? Colors.white.withValues(alpha: 0.85)
        : scheme.primary;

    return ListTile(
      selected: selected,
      selectedTileColor: scheme.primary,
      title: Text(
        thread.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textTheme.titleMedium?.copyWith(
          color: titleColor,
          fontWeight: selected ? FontWeight.w600 : null,
        ),
      ),
      subtitle: thread.lastMessagePreview == null
          ? null
          : Text(
              thread.lastMessagePreview!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall?.copyWith(color: subtitleColor),
            ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: LucyConstants.kSpacingMedium,
      ),
      onTap: onTap,
    );
  }
}
