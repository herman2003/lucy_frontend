import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/signals/pending_chat_outbound_message_holder.dart';
import '../controllers/chat_conversation_notifier.dart';

/// Sends a queued outbound message when the conversation can accept input.
void dispatchPendingChatOutboundMessage(WidgetRef ref, String chatId) {
  final pending = ref.read(pendingChatOutboundMessageHolderProvider);
  if (pending == null) {
    return;
  }
  if (pending.chatId != null && pending.chatId != chatId) {
    return;
  }

  final conversation = ref.read(chatConversationProvider(chatId));
  if (!conversation.canSend) {
    return;
  }

  ref.read(chatConversationProvider(chatId).notifier).sendMessage(pending.message);
  ref.read(pendingChatOutboundMessageHolderProvider.notifier).clear();
}
