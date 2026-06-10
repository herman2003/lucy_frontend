import 'chat_message_role.dart';
import 'chat_message_status.dart';
import 'chat_source.dart';

class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.createdAt,
    this.status,
    this.sources,
  });

  final String id;
  final ChatMessageRole role;
  final String content;
  final String createdAt;
  final ChatMessageStatus? status;
  final List<ChatSource>? sources;
}
