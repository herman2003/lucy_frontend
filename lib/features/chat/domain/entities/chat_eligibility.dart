class ChatEligibility {
  const ChatEligibility({
    required this.canChat,
    required this.activeDocumentCount,
  });

  final bool canChat;
  final int activeDocumentCount;
}
