import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'pending_chat_outbound_message.dart';

part 'pending_chat_outbound_message_holder.g.dart';

/// Holds a pending message to send when the chat conversation is ready.
@Riverpod(keepAlive: true)
class PendingChatOutboundMessageHolder extends _$PendingChatOutboundMessageHolder {
  @override
  PendingChatOutboundMessage? build() => null;

  void enqueue(PendingChatOutboundMessage message) => state = message;

  void clear() => state = null;
}
