import 'chat_message.dart';
import 'chat_source.dart';

/// Server-sent events from `POST /v1/chats/:chatId/messages/stream`.
sealed class ChatStreamEvent {
  const ChatStreamEvent();
}

final class ChatStreamUserMessageEvent extends ChatStreamEvent {
  const ChatStreamUserMessageEvent(this.message);

  final ChatMessage message;
}

final class ChatStreamTextDeltaEvent extends ChatStreamEvent {
  const ChatStreamTextDeltaEvent(this.delta);

  final String delta;
}

final class ChatStreamSourcesEvent extends ChatStreamEvent {
  const ChatStreamSourcesEvent(this.sources);

  final List<ChatSource> sources;
}

final class ChatStreamDoneEvent extends ChatStreamEvent {
  const ChatStreamDoneEvent({
    required this.userMessageId,
    required this.assistantMessage,
  });

  final String userMessageId;
  final ChatMessage assistantMessage;
}

final class ChatStreamErrorEvent extends ChatStreamEvent {
  const ChatStreamErrorEvent(this.code);

  final String code;
}
