import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/flashcard_sm2_state.dart';
import '../../domain/entities/learning_session.dart';

part 'flashcards_session_state.freezed.dart';

@freezed
abstract class FlashcardsSessionState with _$FlashcardsSessionState {
  const FlashcardsSessionState._();

  const factory FlashcardsSessionState({
    @Default(false) bool isLoading,
    LearningSession? session,
    String? errorCode,
    @Default(<int>[]) List<int> studyQueue,
    @Default(0) int queuePosition,
    @Default(false) bool isFlipped,
    @Default(false) bool awaitingRating,
    @Default(false) bool isSessionComplete,
    @Default(<String, FlashcardSm2State>{})
    Map<String, FlashcardSm2State> sm2States,
  }) = _FlashcardsSessionState;

  bool get hasSession => session != null;

  int get totalCards => studyQueue.length;

  int get currentIndex {
    if (studyQueue.isEmpty) {
      return 0;
    }
    final safePosition = queuePosition.clamp(0, studyQueue.length - 1);
    return studyQueue[safePosition];
  }

  bool get canGoPrevious => false;

  bool get canGoNext => false;
}
