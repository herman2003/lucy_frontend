import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_message.dart';
import 'chat_thread.dart';

part 'chat_local_mirror.freezed.dart';

/// Serializable chat cache per user (spec §3.4). No learner profile stored.
@freezed
abstract class ChatLocalMirror with _$ChatLocalMirror {
  const factory ChatLocalMirror({
    @Default(<ChatThread>[]) List<ChatThread> threads,
    @Default(<String, List<ChatMessage>>{})
    Map<String, List<ChatMessage>> messagesByChatId,
    String? lastActiveChatId,
    @Default(<String, String>{}) Map<String, String> composerDraftByChatId,
    @Default(<String, String>{}) Map<String, String> streamDraftByChatId,
    @Default('') String syncedAt,
  }) = _ChatLocalMirror;
}
