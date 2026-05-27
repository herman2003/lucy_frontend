import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/chat_eligibility.dart';
import '../../domain/entities/chat_thread.dart';

part 'chat_threads_state.freezed.dart';

@freezed
abstract class ChatThreadsState with _$ChatThreadsState {
  const factory ChatThreadsState({
    @Default(false) bool isLoading,
    @Default(<ChatThread>[]) List<ChatThread> threads,
    String? selectedChatId,
    ChatEligibility? eligibility,
    String? errorCode,
  }) = _ChatThreadsState;
}
