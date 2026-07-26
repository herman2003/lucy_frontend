import 'package:flutter/material.dart';

import '../constants/lucy_spacing.dart';
import '../theme/lucy_theme_extensions.dart';
import 'lucy_chat_threads_panel.dart';

/// Mobile conversations drawer (V4) — slides from left at 80 % width.
class LucyConversationsDrawer extends StatefulWidget {
  const LucyConversationsDrawer({
    required this.isOpen,
    required this.onClose,
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

  final bool isOpen;
  final VoidCallback onClose;
  final String title;
  final String newConversationLabel;
  final String emptyMessage;
  final List<LucyChatThreadItem> threads;
  final String? selectedThreadId;
  final bool canCreateThread;
  final ValueChanged<String> onThreadSelected;
  final VoidCallback onCreateThread;

  @override
  State<LucyConversationsDrawer> createState() => _LucyConversationsDrawerState();
}

class _LucyConversationsDrawerState extends State<LucyConversationsDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _barrierAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 220),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _barrierAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    if (widget.isOpen) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(covariant LucyConversationsDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen && !oldWidget.isOpen) {
      _controller.forward();
    } else if (!widget.isOpen && oldWidget.isOpen) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleThreadSelected(String threadId) {
    widget.onThreadSelected(threadId);
    widget.onClose();
  }

  void _handleCreateThread() {
    widget.onCreateThread();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.isAnimating && !widget.isOpen && _controller.isDismissed) {
      return const SizedBox.shrink();
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        FadeTransition(
          opacity: _barrierAnimation,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onClose,
            child: const ColoredBox(color: Color(0x99000000)),
          ),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: LucySpacing.chatConversationsDrawerWidthFactor,
              heightFactor: 1,
              child: Material(
                elevation: 8,
                color: context.lucyTheme.surfaceSecondary,
                child: LucyChatThreadsBody(
                  title: widget.title,
                  newConversationLabel: widget.newConversationLabel,
                  emptyMessage: widget.emptyMessage,
                  threads: widget.threads,
                  selectedThreadId: widget.selectedThreadId,
                  canCreateThread: widget.canCreateThread,
                  onThreadSelected: _handleThreadSelected,
                  onCreateThread: _handleCreateThread,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
