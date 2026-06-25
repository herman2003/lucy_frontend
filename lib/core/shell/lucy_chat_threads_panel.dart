import 'package:flutter/material.dart';

import '../constants/lucy_spacing.dart';
import '../extensions/context.dart';
import '../theme/lucy_theme_extensions.dart';

/// Thread row data for [LucyChatThreadsPanel] (no feature imports).
class LucyChatThreadItem {
  const LucyChatThreadItem({
    required this.id,
    required this.title,
    this.preview,
  });

  final String id;
  final String title;
  final String? preview;
}

/// Desktop conversations column (V3) — 300 px, surface secondary background.
class LucyChatThreadsPanel extends StatelessWidget {
  const LucyChatThreadsPanel({
    required this.title,
    required this.newConversationLabel,
    required this.emptyMessage,
    required this.threads,
    required this.onThreadSelected,
    required this.onCreateThread,
    super.key,
    this.selectedThreadId,
    this.canCreateThread = true,
  });

  final String title;
  final String newConversationLabel;
  final String emptyMessage;
  final List<LucyChatThreadItem> threads;
  final String? selectedThreadId;
  final bool canCreateThread;
  final ValueChanged<String> onThreadSelected;
  final VoidCallback onCreateThread;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return SizedBox(
      width: LucySpacing.chatThreadsPanelWidth,
      child: ColoredBox(
        color: lucy.surfaceSecondary,
        child: LucyChatThreadsBody(
          title: title,
          newConversationLabel: newConversationLabel,
          emptyMessage: emptyMessage,
          threads: threads,
          selectedThreadId: selectedThreadId,
          canCreateThread: canCreateThread,
          onThreadSelected: onThreadSelected,
          onCreateThread: onCreateThread,
        ),
      ),
    );
  }
}

/// Shared conversations list content (desktop panel + mobile drawer).
class LucyChatThreadsBody extends StatelessWidget {
  const LucyChatThreadsBody({
    required this.title,
    required this.newConversationLabel,
    required this.emptyMessage,
    required this.threads,
    required this.onThreadSelected,
    required this.onCreateThread,
    super.key,
    this.selectedThreadId,
    this.canCreateThread = true,
  });

  final String title;
  final String newConversationLabel;
  final String emptyMessage;
  final List<LucyChatThreadItem> threads;
  final String? selectedThreadId;
  final bool canCreateThread;
  final ValueChanged<String> onThreadSelected;
  final VoidCallback onCreateThread;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PanelHeader(
          title: title,
          newConversationLabel: newConversationLabel,
          canCreateThread: canCreateThread,
          onCreateThread: onCreateThread,
        ),
        Expanded(
          child: threads.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(LucySpacing.spaceXl),
                    child: Text(
                      emptyMessage,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: lucy.muted,
                      ),
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: LucySpacing.spaceSm,
                  ),
                  itemCount: threads.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: LucySpacing.spaceXs),
                  itemBuilder: (context, index) {
                    final thread = threads[index];
                    return _ThreadTile(
                      thread: thread,
                      selected: thread.id == selectedThreadId,
                      onTap: () => onThreadSelected(thread.id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader({
    required this.title,
    required this.newConversationLabel,
    required this.canCreateThread,
    required this.onCreateThread,
  });

  final String title;
  final String newConversationLabel;
  final bool canCreateThread;
  final VoidCallback onCreateThread;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        LucySpacing.spaceLg,
        LucySpacing.spaceLg,
        LucySpacing.spaceMd,
        LucySpacing.spaceMd,
      ),
      child: Row(
        children: [
          Expanded(child: Text(title, style: context.textTheme.titleLarge)),
          Tooltip(
            message: newConversationLabel,
            child: Material(
              color: canCreateThread
                  ? scheme.primary
                  : scheme.primary.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(9),
              child: InkWell(
                onTap: canCreateThread ? onCreateThread : null,
                borderRadius: BorderRadius.circular(9),
                child: const SizedBox(
                  width: 32,
                  height: 32,
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThreadTile extends StatelessWidget {
  const _ThreadTile({
    required this.thread,
    required this.selected,
    required this.onTap,
  });

  final LucyChatThreadItem thread;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LucySpacing.spaceSm),
      child: Material(
        color: selected ? lucy.chipBackground : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
          side: selected ? BorderSide(color: lucy.border) : BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: LucySpacing.spaceMd + 2,
              vertical: LucySpacing.spaceMd + 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thread.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: scheme.onSurface,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                if (thread.preview != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    thread.preview!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: lucy.muted,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
