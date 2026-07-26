import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/signals/quiz_library_refresh_signal.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/entities/learning_session_type.dart';
import '../../domain/entities/quiz_attempt.dart';
import '../../domain/exceptions/learning_session_exception.dart';
import '../../domain/exceptions/quiz_exception.dart';
import '../../domain/providers/learning_session_provider.dart';
import '../../domain/providers/quiz_attempt_provider.dart';
import '../../domain/providers/quiz_provider.dart';
import 'quiz_state.dart';

part 'quiz_notifier.g.dart';

@riverpod
class QuizNotifier extends _$QuizNotifier {
  @override
  QuizState build() => const QuizState();

  Future<void> bootstrap() async {
    state = state.copyWith(isLoading: true, errorCode: null);
    try {
      final eligibility = await ref.read(quizServiceProvider).getEligibility();
      final sessions = await ref.read(learningSessionServiceProvider).list();
      final lastQuizAttempts = await _loadLastQuizAttempts(sessions);
      state = state.copyWith(
        isLoading: false,
        eligibility: eligibility,
        sessions: sessions,
        lastQuizAttempts: lastQuizAttempts,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  /// Reloads the session library without the full-screen loading state.
  Future<void> refreshSessions() async {
    if (state.isLoading) {
      return;
    }
    try {
      final sessions = await ref.read(learningSessionServiceProvider).list();
      final lastQuizAttempts = await _loadLastQuizAttempts(sessions);
      state = state.copyWith(
        sessions: sessions,
        lastQuizAttempts: lastQuizAttempts,
        errorCode: null,
      );
      ref.read(quizLibraryRefreshSignalProvider.notifier).notify();
    } catch (error) {
      state = state.copyWith(errorCode: _errorCode(error));
    }
  }

  Future<bool> deleteSession(String sessionId) async {
    try {
      await ref.read(learningSessionServiceProvider).delete(sessionId);
      await ref.read(quizAttemptServiceProvider).deleteAttempts(sessionId);
      final updatedAttempts = Map<String, QuizAttempt>.from(state.lastQuizAttempts)
        ..remove(sessionId);
      state = state.copyWith(
        sessions: state.sessions
            .where((session) => session.id != sessionId)
            .toList(),
        lastQuizAttempts: updatedAttempts,
        errorCode: null,
      );
      ref.read(quizLibraryRefreshSignalProvider.notifier).notify();
      return true;
    } catch (error) {
      state = state.copyWith(errorCode: _errorCode(error));
      return false;
    }
  }

  String _errorCode(Object error) {
    if (error is QuizException) {
      return error.code;
    }
    if (error is LearningSessionException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }

  Future<Map<String, QuizAttempt>> _loadLastQuizAttempts(
    List<LearningSessionListItem> sessions,
  ) {
    final quizSessionIds = [
      for (final session in sessions)
        if (session.type == LearningSessionType.quiz) session.id,
    ];
    return ref.read(quizAttemptServiceProvider).readLastAttempts(quizSessionIds);
  }
}
