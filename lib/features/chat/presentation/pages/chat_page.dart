import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/signals/pending_chat_outbound_message_holder.dart';
import '../../../../core/signals/chat_refresh_signal.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/shell/lucy_chat_threads_panel.dart';
import '../../../../core/shell/lucy_conversations_drawer.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../../shared/widgets/lucy/lucy_message_bubble.dart';
import '../../../settings/presentation/controllers/settings_notifier.dart';
import '../../../settings/utils/settings_full_name_parts.dart';
import '../../domain/entities/chat_message_role.dart';
import '../../utils/chat_constants.dart';
import '../../utils/chat_error_translator.dart';
import '../controllers/chat_conversation_notifier.dart';
import '../controllers/chat_conversation_state.dart';
import '../controllers/chat_threads_notifier.dart';
import '../controllers/chat_threads_state.dart';
import '../utils/chat_conversation_status_resolver.dart';
import '../utils/chat_pending_outbound_dispatcher.dart';
import '../utils/chat_quick_chips_resolver.dart';
import '../widgets/chat_composer.dart';
import '../widgets/chat_conversation_empty_state.dart';
import '../widgets/chat_conversation_header.dart';
import '../widgets/chat_learning_session_card.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/chat_no_corpus_banner.dart';
import '../../../quiz/presentation/widgets/learning_reminder_banner_section.dart';
import '../widgets/chat_quick_chips_bar.dart';
import '../widgets/chat_source_card.dart';
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
  bool _mobileDrawerOpen = false;

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

  void _onThreadListAction({required bool useMasterDetail}) {
    if (useMasterDetail) {
      setState(() => _threadListPanelVisible = !_threadListPanelVisible);
      return;
    }
    setState(() => _mobileDrawerOpen = true);
  }

  List<LucyChatThreadItem> _threadItems(ChatThreadsState threadsState) {
    return threadsState.threads
        .map(
          (thread) => LucyChatThreadItem(
            id: thread.id,
            title: thread.title,
            preview: thread.lastMessagePreview,
          ),
        )
        .toList();
  }

  String? _selectedThreadTitle(ChatThreadsState threadsState, String? chatId) {
    if (chatId == null) {
      return null;
    }
    for (final thread in threadsState.threads) {
      if (thread.id == chatId) {
        return thread.title;
      }
    }
    return null;
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

    ref.listen(chatRefreshSignalProvider, (previous, next) {
      if (previous != next) {
        ref
            .read(chatThreadsProvider.notifier)
            .refreshThreads(initialChatId: widget.chatId);
      }
    });

    ref.listen(
      lucyRouterProvider.select((router) => router.state.matchedLocation),
      (previous, next) {
        if (next != LucyRoutePaths.chat) {
          return;
        }
        final cameFromThread =
            previous?.startsWith('${LucyRoutePaths.chat}/') ?? false;
        if (cameFromThread) {
          ref.read(chatThreadsProvider.notifier).refreshThreads();
        }
      },
    );

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
    final activeDocumentCount = threadsState.eligibility?.activeDocumentCount;
    final threadTitle = _selectedThreadTitle(threadsState, selectedId);
    final showDesktopConversationHeader = useMasterDetail && hasSelectedThread;

    return Scaffold(
      backgroundColor: context.lucyTheme.scaffoldBackground,
      appBar: useMasterDetail
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              leading: hasSelectedThread
                  ? IconButton(
                      icon: const Icon(Icons.menu),
                      tooltip: l10n.chatConversationsTitle,
                      onPressed: () =>
                          _onThreadListAction(useMasterDetail: useMasterDetail),
                    )
                  : null,
              title: hasSelectedThread
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          threadTitle ?? l10n.chatTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          l10n.chatConversationSubtitleMobile,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.lucyTheme.muted,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  : Text(l10n.chatTitle),
              actions: [
                if (!hasSelectedThread)
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
                const LearningReminderBannerSection(),
                Expanded(
                  child: useMasterDetail
                      ? Row(
                          children: [
                            if (_threadListPanelVisible) ...[
                              LucyChatThreadsPanel(
                                title: l10n.chatConversationsTitle,
                                newConversationLabel: l10n.chatNewConversation,
                                emptyMessage: l10n.chatEmptyHint,
                                threads: _threadItems(threadsState),
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
                                threadTitle: threadTitle,
                                showInlineHeader: showDesktopConversationHeader,
                                headerTrailing: IconButton(
                                  icon: Icon(
                                    _threadListPanelVisible
                                        ? Icons.view_sidebar
                                        : Icons.view_sidebar_outlined,
                                  ),
                                  tooltip: l10n.chatShowThreadList,
                                  onPressed: () => setState(
                                    () => _threadListPanelVisible =
                                        !_threadListPanelVisible,
                                  ),
                                ),
                                scrollController: _scrollController,
                                isOffline: threadsState.isOffline,
                                canChat: canChat,
                                activeDocumentCount: activeDocumentCount,
                              ),
                            ),
                          ],
                        )
                      : selectedId == null
                      ? _MobileThreadList(
                          threadsState: threadsState,
                          selectedId: selectedId,
                          canCreateThread: canCreateThread,
                        )
                      : Stack(
                          fit: StackFit.expand,
                          children: [
                            _ConversationPanel(
                              chatId: selectedId,
                              threadTitle: threadTitle,
                              showInlineHeader: false,
                              scrollController: _scrollController,
                              isOffline: threadsState.isOffline,
                              canChat: canChat,
                              activeDocumentCount: activeDocumentCount,
                            ),
                            LucyConversationsDrawer(
                              isOpen: _mobileDrawerOpen,
                              onClose: () =>
                                  setState(() => _mobileDrawerOpen = false),
                              title: l10n.chatConversationsTitle,
                              newConversationLabel: l10n.chatNewConversation,
                              emptyMessage: l10n.chatEmptyHint,
                              threads: _threadItems(threadsState),
                              selectedThreadId: selectedId,
                              canCreateThread: canCreateThread,
                              onThreadSelected: (id) => ref
                                  .read(chatThreadsProvider.notifier)
                                  .selectThread(id, context),
                              onCreateThread: () => ref
                                  .read(chatThreadsProvider.notifier)
                                  .createThread(context),
                            ),
                          ],
                        ),
                ),
              ],
            ),
    );
  }
}

class _MobileThreadList extends ConsumerWidget {
  const _MobileThreadList({
    required this.threadsState,
    required this.selectedId,
    required this.canCreateThread,
  });

  final ChatThreadsState threadsState;
  final String? selectedId;
  final bool canCreateThread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final lucy = context.lucyTheme;

    return ColoredBox(
      color: lucy.surfaceSecondary,
      child: LucyChatThreadsBody(
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
        onThreadSelected: (id) =>
            ref.read(chatThreadsProvider.notifier).selectThread(id, context),
        onCreateThread: () =>
            ref.read(chatThreadsProvider.notifier).createThread(context),
      ),
    );
  }
}

class _ConversationPanel extends ConsumerWidget {
  const _ConversationPanel({
    required this.chatId,
    required this.scrollController,
    required this.isOffline,
    required this.canChat,
    this.threadTitle,
    this.showInlineHeader = false,
    this.headerTrailing,
    this.activeDocumentCount,
  });

  final String? chatId;
  final String? threadTitle;
  final bool showInlineHeader;
  final Widget? headerTrailing;
  final ScrollController scrollController;
  final bool isOffline;
  final bool canChat;
  final int? activeDocumentCount;

  List<String> _emptyStateSuggestions(AppLocalizations l10n) => resolveChatQuickChips(
    l10n: l10n,
  ).map((chip) => chip.message).toList();

  String? _lastAssistantMessageContent(ChatConversationState conversation) {
    for (var index = conversation.messages.length - 1; index >= 0; index--) {
      final message = conversation.messages[index];
      if (message.role == ChatMessageRole.assistant) {
        return message.content;
      }
    }
    if (conversation.streamingContent.isNotEmpty) {
      return conversation.streamingContent;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final lucy = context.lucyTheme;
    final settings = ref.watch(settingsProvider);
    final firstName = SettingsFullNameParts.split(settings.fullName).firstName;
    final greeting = firstName.isNotEmpty
        ? l10n.chatGreeting(firstName)
        : l10n.chatGreetingFallback;

    if (chatId == null) {
      return Center(
        child: Text(
          l10n.chatEmptyHint,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    final conversation = ref.watch(chatConversationProvider(chatId!));

    ref.listen(pendingChatOutboundMessageHolderProvider, (_, __) {
      dispatchPendingChatOutboundMessage(ref, chatId!);
    });
    ref.listen(chatConversationProvider(chatId!), (_, __) {
      dispatchPendingChatOutboundMessage(ref, chatId!);
    });

    final status = ChatConversationStatusResolver.resolve(
      conversation: conversation,
      isOffline: isOffline,
      canChat: canChat,
    );
    final errorMessage = conversation.errorCode == null
        ? null
        : ChatErrorTranslator.translate(context, conversation.errorCode!);
    final canSend = conversation.canSend && !isOffline && canChat;
    final quickChips = resolveChatQuickChips(
      l10n: l10n,
      lastAssistantMessageContent: _lastAssistantMessageContent(conversation),
    );

    return Column(
      children: [
        if (showInlineHeader && threadTitle != null)
          ChatConversationHeader(
            threadTitle: threadTitle!,
            subtitle: l10n.chatConversationSubtitle,
            activeDocumentCount: activeDocumentCount,
            showActiveDocumentsChip: canChat,
            trailing: headerTrailing,
          ),
        Expanded(
          child: ColoredBox(
            color: lucy.scaffoldBackground,
            child: LucyConversationStatus(
              status: status,
              errorMessage: errorMessage,
              onRetry: () => ref
                  .read(chatConversationProvider(chatId!).notifier)
                  .loadMessages(),
              emptyWidget: ChatConversationEmptyState(
                greeting: greeting,
                message: l10n.chatEmptyDescription,
                suggestions: _emptyStateSuggestions(l10n),
                onSuggestionSelected: (text) {
                  if (canSend) {
                    ref
                        .read(chatConversationProvider(chatId!).notifier)
                        .sendMessage(text);
                  }
                },
              ),
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: LucySpacing.spaceXl + 4,
                  vertical: LucySpacing.spaceXl + 2,
                ),
                itemCount: _conversationItemCount(conversation),
                itemBuilder: (context, index) {
                  return _buildConversationItem(context, conversation, index);
                },
              ),
            ),
          ),
        ),
        if (canSend && conversation.messages.isNotEmpty)
          ChatQuickChipsBar(
            chips: quickChips,
            onChipSelected: (text) => ref
                .read(chatConversationProvider(chatId!).notifier)
                .sendMessage(text),
          ),
        ColoredBox(
          color: lucy.scaffoldBackground,
          child: ChatComposer(
            enabled: canSend,
            onSend: (text) => ref
                .read(chatConversationProvider(chatId!).notifier)
                .sendMessage(text),
          ),
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
        padding: const EdgeInsets.only(bottom: LucySpacing.spaceLg),
        child: ChatMessageBubble(message: conversation.messages[index]),
      );
    }

    var offset = messageCount;
    final showStreamingBubble =
        conversation.isStreaming && conversation.streamingContent.isNotEmpty;
    final showTyping = conversation.isStreaming && !showStreamingBubble;

    if (showStreamingBubble && index == offset) {
      return Padding(
        padding: const EdgeInsets.only(bottom: LucySpacing.spaceLg),
        child: LucyMessageBubble(
          role: LucyMessageBubbleRole.assistant,
          text: conversation.streamingContent,
        ),
      );
    }
    if (showTyping && index == offset) {
      return Padding(
        padding: const EdgeInsets.only(bottom: LucySpacing.spaceLg),
        child: LucyMessageBubble(
          role: LucyMessageBubbleRole.assistant,
          text: '',
          isTyping: true,
        ),
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
