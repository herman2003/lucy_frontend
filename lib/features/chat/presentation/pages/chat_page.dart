import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/shell/lucy_chat_threads_panel.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../onboarding/presentation/widgets/onboarding_lucy_bubble.dart';
import '../../../onboarding/presentation/widgets/onboarding_lucy_typing_row.dart';
import '../../utils/chat_constants.dart';
import '../../utils/chat_error_translator.dart';
import '../controllers/chat_conversation_notifier.dart';
import '../controllers/chat_conversation_state.dart';
import '../controllers/chat_threads_notifier.dart';
import '../controllers/chat_threads_state.dart';
import '../utils/chat_conversation_status_resolver.dart';
import '../widgets/chat_composer.dart';
import '../widgets/chat_learning_session_card.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/chat_no_corpus_banner.dart';
import '../widgets/chat_source_card.dart';
import '../widgets/chat_thread_list_tile.dart';
import '../widgets/lucy_conversation_status.dart';

/// Chat tab — master-detail threads and SSE conversation (SPEC §2, P4a).
class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key, this.chatId});

  final String? chatId;

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _scrollController = ScrollController();
  bool _threadListPanelVisible = true;

  bool _canChat(ChatThreadsState threadsState) =>
      threadsState.eligibility?.canChat ?? true;

  bool _canCreateThread(ChatThreadsState threadsState) =>
      !threadsState.isOffline && _canChat(threadsState);

  void _scheduleBootstrap() {
    Future.microtask(() {
      if (!mounted) {
        return;
      }
      ref
          .read(chatThreadsProvider.notifier)
          .bootstrap(initialChatId: widget.chatId);
    });
  }

  @override
  void initState() {
    super.initState();
    _scheduleBootstrap();
  }

  @override
  void didUpdateWidget(ChatPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chatId != widget.chatId) {
      _scheduleBootstrap();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onThreadListAction({
    required bool useMasterDetail,
    required bool hasSelectedThread,
  }) {
    if (!hasSelectedThread) {
      return;
    }
    if (useMasterDetail) {
      setState(() => _threadListPanelVisible = !_threadListPanelVisible);
      return;
    }
    ref.read(chatThreadsProvider.notifier).openThreadList(context);
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) {
        return;
      }
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final threadsState = ref.watch(chatThreadsProvider);
    final l10n = context.l10n;
    final width = MediaQuery.sizeOf(context).width;
    final useMasterDetail = width >= ChatConstants.masterDetailBreakpoint;
    final selectedId = widget.chatId ?? threadsState.selectedChatId;
    final canChat = _canChat(threadsState);
    final canCreateThread = _canCreateThread(threadsState);

    ref.listen(chatThreadsProvider, (previous, next) {
      if (next.errorCode != null && next.errorCode != previous?.errorCode) {
        LucySnackBar.showError(
          context,
          message: ChatErrorTranslator.translate(context, next.errorCode!),
        );
      }
    });

    if (selectedId != null) {
      ref.listen(chatConversationProvider(selectedId), (previous, next) {
        if (next.errorCode != null && next.errorCode != previous?.errorCode) {
          LucySnackBar.showError(
            context,
            message: ChatErrorTranslator.translate(context, next.errorCode!),
          );
        }
        if (previous?.messages.length != next.messages.length ||
            previous?.streamingContent != next.streamingContent) {
          _scrollToBottom();
        }
      });
    }

    final hasSelectedThread = selectedId != null;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: hasSelectedThread
            ? IconButton(
                icon: Icon(
                  useMasterDetail && _threadListPanelVisible
                      ? Icons.view_sidebar
                      : Icons.view_sidebar_outlined,
                ),
                tooltip: l10n.chatShowThreadList,
                onPressed: () => _onThreadListAction(
                  useMasterDetail: useMasterDetail,
                  hasSelectedThread: hasSelectedThread,
                ),
              )
            : null,
        title: Text(l10n.chatTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_outlined),
            tooltip: l10n.chatNewConversation,
            onPressed: canCreateThread
                ? () => ref
                      .read(chatThreadsProvider.notifier)
                      .createThread(context)
                : null,
          ),
        ],
      ),
      body: threadsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (threadsState.isOffline)
                  MaterialBanner(
                    content: Text(l10n.chatOfflineBanner),
                    leading: const Icon(Icons.cloud_off_outlined),
                    actions: const [SizedBox.shrink()],
                  ),
                if (!canChat && !threadsState.isLoading)
                  const ChatNoCorpusBanner(),
                Expanded(
                  child: useMasterDetail
                      ? Row(
                          children: [
                            if (_threadListPanelVisible) ...[
                              LucyChatThreadsPanel(
                                title: l10n.chatConversationsTitle,
                                newConversationLabel: l10n.chatNewConversation,
                                emptyMessage: l10n.chatEmptyHint,
                                threads: threadsState.threads
                                    .map(
                                      (thread) => LucyChatThreadItem(
                                        id: thread.id,
                                        title: thread.title,
                                        preview: thread.lastMessagePreview,
                                      ),
                                    )
                                    .toList(),
                                selectedThreadId: selectedId,
                                canCreateThread: canCreateThread,
                                onThreadSelected: (id) => ref
                                    .read(chatThreadsProvider.notifier)
                                    .selectThread(id, context),
                                onCreateThread: () => ref
                                    .read(chatThreadsProvider.notifier)
                                    .createThread(context),
                              ),
                              const VerticalDivider(width: 1),
                            ],
                            Expanded(
                              child: _ConversationPanel(
                                chatId: selectedId,
                                scrollController: _scrollController,
                                isOffline: threadsState.isOffline,
                                canChat: canChat,
                              ),
                            ),
                          ],
                        )
                      : selectedId == null
                      ? _ThreadListPanel(
                          threadsState: threadsState,
                          selectedId: selectedId,
                        )
                      : _ConversationPanel(
                          chatId: selectedId,
                          scrollController: _scrollController,
                          isOffline: threadsState.isOffline,
                          canChat: canChat,
                        ),
                ),
              ],
            ),
    );
  }
}

class _ThreadListPanel extends ConsumerWidget {
  const _ThreadListPanel({
    required this.threadsState,
    required this.selectedId,
  });

  final ChatThreadsState threadsState;
  final String? selectedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    if (threadsState.threads.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Text(
            l10n.chatEmptyHint,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: threadsState.threads.length,
      itemBuilder: (context, index) {
        final thread = threadsState.threads[index];
        return ChatThreadListTile(
          thread: thread,
          selected: thread.id == selectedId,
          onTap: () => ref
              .read(chatThreadsProvider.notifier)
              .selectThread(thread.id, context),
        );
      },
    );
  }
}

class _ConversationPanel extends ConsumerWidget {
  const _ConversationPanel({
    required this.chatId,
    required this.scrollController,
    required this.isOffline,
    required this.canChat,
  });

  final String? chatId;
  final ScrollController scrollController;
  final bool isOffline;
  final bool canChat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    if (chatId == null) {
      return Center(
        child: Text(
          l10n.chatEmptyHint,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    final conversation = ref.watch(chatConversationProvider(chatId!));
    final status = ChatConversationStatusResolver.resolve(
      conversation: conversation,
      isOffline: isOffline,
      canChat: canChat,
    );
    final errorMessage = conversation.errorCode == null
        ? null
        : ChatErrorTranslator.translate(context, conversation.errorCode!);

    return Column(
      children: [
        Expanded(
          child: LucyConversationStatus(
            status: status,
            errorMessage: errorMessage,
            onRetry: () => ref
                .read(chatConversationProvider(chatId!).notifier)
                .loadMessages(),
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
              itemCount: _conversationItemCount(conversation),
              itemBuilder: (context, index) {
                return _buildConversationItem(context, conversation, index);
              },
            ),
          ),
        ),
        ChatComposer(
          enabled: conversation.canSend && !isOffline && canChat,
          onSend: (text) => ref
              .read(chatConversationProvider(chatId!).notifier)
              .sendMessage(text),
        ),
      ],
    );
  }

  int _conversationItemCount(ChatConversationState conversation) {
    var count = conversation.messages.length;
    if (conversation.isStreaming && conversation.streamingContent.isNotEmpty) {
      count += 1;
    } else if (conversation.isStreaming) {
      count += 1;
    }
    if (conversation.pendingSources.isNotEmpty &&
        conversation.streamingContent.isNotEmpty) {
      count += conversation.pendingSources.length;
    }
    if (conversation.pendingLearningSession != null &&
        conversation.isStreaming) {
      count += 1;
    }
    count += conversation.learningSessionCards.length;
    return count;
  }

  Widget _buildConversationItem(
    BuildContext context,
    ChatConversationState conversation,
    int index,
  ) {
    final messageCount = conversation.messages.length;
    if (index < messageCount) {
      return Padding(
        padding: const EdgeInsets.only(bottom: LucyConstants.kSpacingMedium),
        child: ChatMessageBubble(message: conversation.messages[index]),
      );
    }

    var offset = messageCount;
    final showStreamingBubble =
        conversation.isStreaming && conversation.streamingContent.isNotEmpty;
    final showTyping = conversation.isStreaming && !showStreamingBubble;

    if (showStreamingBubble && index == offset) {
      return Padding(
        padding: const EdgeInsets.only(bottom: LucyConstants.kSpacingMedium),
        child: OnboardingLucyBubble(text: conversation.streamingContent),
      );
    }
    if (showTyping && index == offset) {
      return const Padding(
        padding: EdgeInsets.only(bottom: LucyConstants.kSpacingMedium),
        child: OnboardingLucyTypingRow(),
      );
    }
    if (showStreamingBubble) {
      offset += 1;
    } else if (showTyping) {
      offset += 1;
    }

    final sourceIndex = index - offset;
    if (sourceIndex >= 0 && sourceIndex < conversation.pendingSources.length) {
      return ChatSourceCard(source: conversation.pendingSources[sourceIndex]);
    }
    offset += conversation.pendingSources.length;

    if (conversation.pendingLearningSession != null &&
        conversation.isStreaming &&
        index == offset) {
      return ChatLearningSessionCard(
        session: conversation.pendingLearningSession!,
      );
    }
    if (conversation.pendingLearningSession != null &&
        conversation.isStreaming) {
      offset += 1;
    }

    final cardIndex = index - offset;
    if (cardIndex >= 0 &&
        cardIndex < conversation.learningSessionCards.length) {
      return ChatLearningSessionCard(
        session: conversation.learningSessionCards[cardIndex],
      );
    }

    return const SizedBox.shrink();
  }
}
