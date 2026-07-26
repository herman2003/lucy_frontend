/// How a chat quick chip behaves when tapped (LEARN-11a / LEARN-12a-V3).
enum ChatQuickChipKind {
  sendMessage,
  exportRevisionCalendar,
}

/// Tappable quick action shown above the chat composer (LEARN-11a).
class ChatQuickChip {
  const ChatQuickChip({
    required this.label,
    required this.message,
    this.kind = ChatQuickChipKind.sendMessage,
  });

  const ChatQuickChip.exportRevisionCalendar({required this.label})
    : message = '',
      kind = ChatQuickChipKind.exportRevisionCalendar;

  final String label;
  final String message;
  final ChatQuickChipKind kind;
}
