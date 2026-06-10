class ChatThread {
  const ChatThread({
    required this.id,
    required this.title,
    required this.updatedAt,
    this.createdAt,
    this.lastMessagePreview,
  });

  final String id;
  final String title;
  final String updatedAt;
  final String? createdAt;
  final String? lastMessagePreview;
}
