import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/learning_session.dart';

part 'flashcards_session_state.freezed.dart';

@freezed
abstract class FlashcardsSessionState with _$FlashcardsSessionState {
  const FlashcardsSessionState._();

  const factory FlashcardsSessionState({
    @Default(false) bool isLoading,
    LearningSession? session,
    String? errorCode,
    @Default(0) int currentIndex,
    @Default(false) bool isFlipped,
  }) = _FlashcardsSessionState;

  bool get hasSession => session != null;

  int get totalCards => session?.items.length ?? 0;

  bool get canGoPrevious => currentIndex > 0;

  bool get canGoNext => hasSession && currentIndex < totalCards - 1;
}
