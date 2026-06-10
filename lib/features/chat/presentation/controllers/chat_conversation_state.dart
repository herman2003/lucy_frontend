import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_source.dart';
import 'chat_send_phase.dart';

part 'chat_conversation_state.freezed.dart';

@freezed
abstract class ChatConversationState with _$ChatConversationState {
  const ChatConversationState._();

  const factory ChatConversationState({
    @Default(false) bool isLoadingMessages,
    @Default(<ChatMessage>[]) List<ChatMessage> messages,
    @Default(ChatSendPhase.idle) ChatSendPhase sendPhase,
    @Default('') String streamingContent,
    @Default(<ChatSource>[]) List<ChatSource> pendingSources,
    String? errorCode,
  }) = _ChatConversationState;

  bool get isStreaming =>
      sendPhase == ChatSendPhase.sending || sendPhase == ChatSendPhase.streaming;

  bool get canSend => !isStreaming;
}
