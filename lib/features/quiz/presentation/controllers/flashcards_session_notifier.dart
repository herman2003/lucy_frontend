import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/learning_session.dart';
import '../../domain/exceptions/learning_session_exception.dart';
import '../../domain/providers/learning_session_provider.dart';
import 'flashcards_session_state.dart';

part 'flashcards_session_notifier.g.dart';

@riverpod
class FlashcardsSessionNotifier extends _$FlashcardsSessionNotifier {
  @override
  FlashcardsSessionState build(String sessionId) {
    Future.microtask(() => load(sessionId));
    return const FlashcardsSessionState(isLoading: true);
  }

  void seedSession(LearningSession session) {
    state = state.copyWith(
      isLoading: false,
      session: session,
      errorCode: null,
      currentIndex: 0,
      isFlipped: false,
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
      state = state.copyWith(
        isLoading: false,
        session: session,
        currentIndex: 0,
        isFlipped: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  void toggleFlip() {
    if (!state.hasSession) {
      return;
    }
    state = state.copyWith(isFlipped: !state.isFlipped);
  }

  void goToPreviousCard() {
    if (!state.canGoPrevious) {
      return;
    }
    state = state.copyWith(
      currentIndex: state.currentIndex - 1,
      isFlipped: false,
    );
  }

  void goToNextCard() {
    if (!state.canGoNext) {
      return;
    }
    state = state.copyWith(
      currentIndex: state.currentIndex + 1,
      isFlipped: false,
    );
  }

  String _errorCode(Object error) {
    if (error is LearningSessionException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
