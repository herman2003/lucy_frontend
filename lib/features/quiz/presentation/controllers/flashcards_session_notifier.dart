import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/flashcard_sm2_state.dart';
import '../../domain/entities/learning_session.dart';
import '../../domain/exceptions/learning_session_exception.dart';
import '../../domain/providers/flashcard_sm2_provider.dart';
import '../../domain/providers/learning_session_provider.dart';
import '../../utils/flashcard_study_queue.dart';
import '../../utils/sm2_algorithm.dart';
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
    Future.microtask(() => _initializeStudySession(session));
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
      await _initializeStudySession(session);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  Future<void> _initializeStudySession(LearningSession session) async {
    final sm2Service = ref.read(flashcardSm2ServiceProvider);
    final sm2States = await sm2Service.loadStates(session.id);
    final studyQueue = buildFlashcardStudyQueue(
      itemIdsInOrder: session.items.map((item) => item.id).toList(),
      statesByItemId: sm2States,
      now: DateTime.now().toUtc(),
    );

    state = state.copyWith(
      isLoading: false,
      session: session,
      errorCode: null,
      sm2States: sm2States,
      studyQueue: studyQueue,
      queuePosition: 0,
      isFlipped: false,
      awaitingRating: false,
      isSessionComplete: studyQueue.isEmpty,
    );
  }

  void toggleFlip() {
    if (!state.hasSession || state.isSessionComplete) {
      return;
    }
    final nextFlipped = !state.isFlipped;
    state = state.copyWith(
      isFlipped: nextFlipped,
      awaitingRating: nextFlipped,
    );
  }

  Future<void> rateCard(Sm2Quality quality) async {
    if (!state.hasSession || !state.awaitingRating || state.isSessionComplete) {
      return;
    }

    final session = state.session!;
    final item = session.items[state.currentIndex];
    final reviewedAt = DateTime.now().toUtc();
    final previousState =
        state.sm2States[item.id] ?? initialFlashcardSm2State(reviewedAt);
    final nextState = applySm2Review(
      previousState,
      quality,
      reviewedAt: reviewedAt,
    );

    final updatedStates = Map<String, FlashcardSm2State>.from(state.sm2States)
      ..[item.id] = nextState;
    await ref.read(flashcardSm2ServiceProvider).saveState(
      sessionId: session.id,
      itemId: item.id,
      state: nextState,
      currentStates: updatedStates,
    );

    var studyQueue = state.studyQueue;
    var queuePosition = state.queuePosition;
    if (quality == Sm2Quality.again) {
      studyQueue = requeueCardForAnotherPass(
        studyQueue: studyQueue,
        queuePosition: queuePosition,
        cardIndex: state.currentIndex,
      );
    }

    queuePosition += 1;
    final isSessionComplete = queuePosition >= studyQueue.length;

    state = state.copyWith(
      sm2States: updatedStates,
      studyQueue: studyQueue,
      queuePosition: queuePosition,
      isFlipped: false,
      awaitingRating: false,
      isSessionComplete: isSessionComplete,
    );
  }

  String _errorCode(Object error) {
    if (error is LearningSessionException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
