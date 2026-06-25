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
        child: Column(
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
        ),
      ),
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
          Expanded(
            child: Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                color: scheme.onSurface,
              ),
            ),
          ),
          IconButton(
            tooltip: newConversationLabel,
            onPressed: canCreateThread ? onCreateThread : null,
            icon: const Icon(Icons.add_comment_outlined),
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
    final titleColor = selected ? scheme.onPrimary : scheme.onSurface;
    final subtitleColor = selected
        ? scheme.onPrimary.withValues(alpha: 0.85)
        : lucy.muted;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LucySpacing.spaceSm),
      child: Material(
        color: selected ? scheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: LucySpacing.spaceMd,
              vertical: LucySpacing.spaceSm + 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thread.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: titleColor,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                if (thread.preview != null) ...[
                  const SizedBox(height: LucySpacing.spaceXs),
                  Text(
                    thread.preview!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: subtitleColor,
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
