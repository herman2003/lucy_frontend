import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_session_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/quiz_attempt_provider.dart';
import 'package:lucy_frontend/features/quiz/presentation/controllers/quiz_session_notifier.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/fake_learning_session_repository.dart';

const _session = LearningSession(
  id: 'learn_test_1',
  type: LearningSessionType.quiz,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Quiz · test',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  items: [
    LearningSessionItem(
      id: 'item-1',
      question: 'Q1?',
      choices: ['A', 'B', 'C', 'D'],
      correctIndex: 1,
      explanation: 'Because 1',
      sources: [],
    ),
    LearningSessionItem(
      id: 'item-2',
      question: 'Q2?',
      choices: ['A', 'B', 'C', 'D'],
      correctIndex: 0,
      explanation: 'Because 2',
      sources: [],
    ),
  ],
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<QuizAttemptService> createAttemptService() async {
    return QuizAttemptService(
      dataSource: QuizAttemptPrefsDataSource(
        Future.value(await SharedPreferences.getInstance()),
      ),
    );
  }

  test('computes local score after answering all questions', () async {
    final repository = FakeLearningSessionRepository(session: _session);
    final container = ProviderContainer(
      overrides: [
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(
      quizSessionProvider('learn_test_1').notifier,
    );
    await notifier.load('learn_test_1');

    notifier.selectAnswer('item-1', 1);
    notifier.goToNextQuestion();
    notifier.selectAnswer('item-2', 2);
    notifier.goToNextQuestion();

    final state = container.read(quizSessionProvider('learn_test_1'));
    expect(state.isComplete, isTrue);
    expect(state.score, 1);
  });

  test('persists completed attempt locally (LEARN-12b)', () async {
    final repository = FakeLearningSessionRepository(session: _session);
    final attemptService = await createAttemptService();
    final container = ProviderContainer(
      overrides: [
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
        quizAttemptServiceProvider.overrideWithValue(attemptService),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(
      quizSessionProvider('learn_test_1').notifier,
    );
    await notifier.load('learn_test_1');

    notifier.selectAnswer('item-1', 1);
    notifier.goToNextQuestion();
    notifier.selectAnswer('item-2', 0);
    notifier.goToNextQuestion();
    await Future<void>.delayed(Duration.zero);

    final last = await attemptService.readLastAttempt('learn_test_1');
    expect(last, isNotNull);
    expect(last!.scoreCorrect, 2);
    expect(last.scoreTotal, 2);
  });
}
