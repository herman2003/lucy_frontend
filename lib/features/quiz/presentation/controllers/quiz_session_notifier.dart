import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/learning_session.dart';
import '../../domain/exceptions/learning_session_exception.dart';
import '../../domain/providers/learning_session_provider.dart';
import '../../domain/providers/quiz_attempt_provider.dart';
import 'quiz_session_state.dart';

part 'quiz_session_notifier.g.dart';

@riverpod
class QuizSessionNotifier extends _$QuizSessionNotifier {
  DateTime? _startedAt;

  @override
  QuizSessionState build(String sessionId) {
    Future.microtask(() => load(sessionId));
    return const QuizSessionState(isLoading: true);
  }

  void seedSession(LearningSession session) {
    _startedAt = DateTime.now().toUtc();
    state = state.copyWith(
      isLoading: false,
      session: session,
      errorCode: null,
      currentIndex: 0,
      selectedAnswers: const {},
      isComplete: false,
    );
  }

  Future<void> load(String sessionId) async {
    if (state.hasSession && state.session!.id == sessionId) {
      return;
    }
    state = state.copyWith(isLoading: true, errorCode: null);
    try {
      final session = await ref
          .read(learningSessionServiceProvider)
          .getById(sessionId);
      _startedAt = DateTime.now().toUtc();
      state = state.copyWith(isLoading: false, session: session);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  void selectAnswer(String itemId, int choiceIndex) {
    if (state.isComplete || state.selectedAnswers.containsKey(itemId)) {
      return;
    }
    state = state.copyWith(
      selectedAnswers: {...state.selectedAnswers, itemId: choiceIndex},
    );
  }

  void goToNextQuestion() {
    if (!state.hasSession || state.isComplete) {
      return;
    }
    final nextIndex = state.currentIndex + 1;
    if (nextIndex >= state.totalQuestions) {
      state = state.copyWith(isComplete: true);
      unawaited(_persistCompletedAttempt());
      return;
    }
    state = state.copyWith(currentIndex: nextIndex);
  }

  void restart() {
    if (!state.hasSession) {
      return;
    }
    _startedAt = DateTime.now().toUtc();
    state = state.copyWith(
      currentIndex: 0,
      selectedAnswers: const {},
      isComplete: false,
    );
  }

  Future<void> _persistCompletedAttempt() async {
    final session = state.session;
    final startedAt = _startedAt;
    if (session == null || startedAt == null || !state.isComplete) {
      return;
    }

    await ref.read(quizAttemptServiceProvider).recordCompletedAttempt(
      session: session,
      selectedAnswers: state.selectedAnswers,
      startedAt: startedAt,
      completedAt: DateTime.now().toUtc(),
    );
  }

  String _errorCode(Object error) {
    if (error is LearningSessionException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
