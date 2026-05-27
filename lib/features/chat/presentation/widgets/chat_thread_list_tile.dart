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

    return ListTile(
      selected: selected,
      selectedTileColor: scheme.primaryContainer.withValues(alpha: 0.35),
      title: Text(
        thread.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: thread.lastMessagePreview == null
          ? null
          : Text(
              thread.lastMessagePreview!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: LucyConstants.kSpacingMedium,
      ),
      onTap: onTap,
    );
  }
}
