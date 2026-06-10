import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/learning_session.dart';

part 'quiz_session_state.freezed.dart';

@freezed
abstract class QuizSessionState with _$QuizSessionState {
  const QuizSessionState._();

  const factory QuizSessionState({
    @Default(false) bool isLoading,
    LearningSession? session,
    String? errorCode,
    @Default(0) int currentIndex,
    @Default(<String, int>{}) Map<String, int> selectedAnswers,
    @Default(false) bool isComplete,
  }) = _QuizSessionState;

  bool get hasSession => session != null;

  int get totalQuestions => session?.items.length ?? 0;

  int get score {
    final currentSession = session;
    if (currentSession == null) {
      return 0;
    }
    var correct = 0;
    for (final item in currentSession.items) {
      final selected = selectedAnswers[item.id];
      if (selected != null && selected == item.correctIndex) {
        correct += 1;
      }
    }
    return correct;
  }
}
