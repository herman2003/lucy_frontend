import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/quiz_eligibility.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_session_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/quiz_provider.dart';
import 'package:lucy_frontend/features/quiz/presentation/controllers/quiz_notifier.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_service.dart';

import '../../helpers/fake_learning_session_repository.dart';
import '../../helpers/fake_quiz_repository.dart';

void main() {
  test('bootstrap loads eligibility and session library', () async {
    const eligibility = QuizEligibility(canQuiz: false, activeDocumentCount: 0);
    const sessions = [
      LearningSessionListItem(
        id: 'learn_1',
        type: LearningSessionType.quiz,
        status: LearningSessionStatus.ready,
        itemCount: 5,
        title: 'Quiz · test',
        createdAt: '2026-05-29T10:00:00.000Z',
        updatedAt: '2026-05-29T10:00:00.000Z',
      ),
    ];

    final container = ProviderContainer(
      overrides: [
        quizServiceProvider.overrideWithValue(
          QuizService(repository: FakeQuizRepository(eligibility: eligibility)),
        ),
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(
            repository: FakeLearningSessionRepository()..setSessions(sessions),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(quizProvider.notifier);
    await notifier.bootstrap();

    final state = container.read(quizProvider);
    expect(state.isLoading, isFalse);
    expect(state.canQuiz, isFalse);
    expect(state.sessions, sessions);
  });

  test('deleteSession removes session from library state', () async {
    const sessions = [
      LearningSessionListItem(
        id: 'learn_1',
        type: LearningSessionType.quiz,
        status: LearningSessionStatus.ready,
        itemCount: 5,
        title: 'Quiz · test',
        createdAt: '2026-05-29T10:00:00.000Z',
        updatedAt: '2026-05-29T10:00:00.000Z',
      ),
    ];
    final repository = FakeLearningSessionRepository()..setSessions(sessions);

    final container = ProviderContainer(
      overrides: [
        quizServiceProvider.overrideWithValue(
          QuizService(
            repository: FakeQuizRepository(
              eligibility: const QuizEligibility(
                canQuiz: true,
                activeDocumentCount: 1,
              ),
            ),
          ),
        ),
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(quizProvider.notifier);
    await notifier.bootstrap();

    final deleted = await notifier.deleteSession('learn_1');

    expect(deleted, isTrue);
    expect(repository.lastDeletedSessionId, 'learn_1');
    expect(container.read(quizProvider).sessions, isEmpty);
  });

  test('refreshSessions reloads library without loading gate', () async {
    const initialSessions = [
      LearningSessionListItem(
        id: 'learn_1',
        type: LearningSessionType.quiz,
        status: LearningSessionStatus.ready,
        itemCount: 5,
        title: 'Quiz · test',
        createdAt: '2026-05-29T10:00:00.000Z',
        updatedAt: '2026-05-29T10:00:00.000Z',
      ),
    ];
    const updatedSessions = [
      LearningSessionListItem(
        id: 'learn_2',
        type: LearningSessionType.flashcards,
        status: LearningSessionStatus.ready,
        itemCount: 3,
        title: 'Cartes · test',
        createdAt: '2026-05-30T10:00:00.000Z',
        updatedAt: '2026-05-30T10:00:00.000Z',
      ),
      ...initialSessions,
    ];
    final repository = FakeLearningSessionRepository()
      ..setSessions(initialSessions);

    final container = ProviderContainer(
      overrides: [
        quizServiceProvider.overrideWithValue(
          QuizService(
            repository: FakeQuizRepository(
              eligibility: const QuizEligibility(
                canQuiz: true,
                activeDocumentCount: 1,
              ),
            ),
          ),
        ),
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(quizProvider.notifier);
    await notifier.bootstrap();
    repository.setSessions(updatedSessions);

    await notifier.refreshSessions();

    expect(container.read(quizProvider).sessions, updatedSessions);
    expect(container.read(quizProvider).isLoading, isFalse);
  });
}
