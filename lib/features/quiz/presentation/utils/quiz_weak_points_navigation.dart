import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/signals/pending_chat_outbound_message.dart';
import '../../../../core/signals/pending_chat_outbound_message_holder.dart';
import '../../../chat/presentation/controllers/chat_threads_notifier.dart';
import '../../presentation/controllers/quiz_session_state.dart';
import '../../utils/quiz_weak_points_message_builder.dart';

/// Navigates to chat and queues a flashcards request on quiz weak points.
void openQuizWeakPointsInChat({
  required BuildContext context,
  required WidgetRef ref,
  required QuizSessionState state,
}) {
  final message = buildQuizWeakPointsFlashcardsMessage(
    l10n: context.l10n,
    incorrectItems: state.incorrectItems,
  );
  if (message.isEmpty) {
    return;
  }

  final sourceChatId = state.session?.sourceChatId;
  ref
      .read(pendingChatOutboundMessageHolderProvider.notifier)
      .enqueue(PendingChatOutboundMessage(message: message, chatId: sourceChatId));

  if (sourceChatId != null) {
    ref.read(chatThreadsProvider.notifier).selectThread(sourceChatId, context);
    return;
  }

  context.go(LucyRoutePaths.chat);
}
