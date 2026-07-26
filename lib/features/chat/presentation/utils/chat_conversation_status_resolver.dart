import '../controllers/chat_conversation_state.dart';
import '../widgets/lucy_conversation_status.dart';

/// Maps conversation + eligibility flags to [LucyConversationStatusType].
abstract final class ChatConversationStatusResolver {
  ChatConversationStatusResolver._();

  static LucyConversationStatusType resolve({
    required ChatConversationState conversation,
    required bool isOffline,
    required bool canChat,
  }) {
    if (conversation.isLoadingMessages && conversation.messages.isEmpty) {
      return LucyConversationStatusType.loading;
    }
    if (conversation.errorCode != null && conversation.messages.isEmpty) {
      return LucyConversationStatusType.error;
    }
    if (!canChat &&
        conversation.messages.isEmpty &&
        !conversation.isStreaming) {
      return LucyConversationStatusType.noCorpus;
    }
    if (isOffline &&
        conversation.messages.isEmpty &&
        !conversation.isStreaming) {
      return LucyConversationStatusType.offline;
    }
    if (conversation.messages.isEmpty && !conversation.isStreaming) {
      return LucyConversationStatusType.empty;
    }
    return LucyConversationStatusType.ready;
  }
}
