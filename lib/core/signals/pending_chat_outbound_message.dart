/// One-shot outbound chat message queued from another feature (e.g. quiz weak points).
class PendingChatOutboundMessage {
  const PendingChatOutboundMessage({
    required this.message,
    this.chatId,
  });

  final String message;
  final String? chatId;
}
