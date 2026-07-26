import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/generate_learning_session_request.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';

import '../helpers/fake_learning_session_repository.dart';

const _session = LearningSession(
  id: 'learn_test_1',
  type: LearningSessionType.quiz,
  status: LearningSessionStatus.ready,
  itemCount: 1,
  title: 'Quiz · test',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  sourceChatId: 'chat_1',
  items: [
    LearningSessionItem(
      id: 'item-1',
      question: 'Q?',
      choices: ['A', 'B', 'C', 'D'],
      correctIndex: 0,
      explanation: 'E',
      sources: [],
    ),
  ],
);

void main() {
  test('generate delegates to repository', () async {
    final repository = FakeLearningSessionRepository(session: _session);
    final service = LearningSessionService(repository: repository);

    const request = GenerateLearningSessionRequest(
      type: LearningSessionType.quiz,
      itemCount: 5,
      sourceChatId: 'chat_1',
    );

    final session = await service.generate(request);

    expect(session, _session);
    expect(repository.lastGenerateRequest, request);
  });

  test('getById delegates to repository', () async {
    final repository = FakeLearningSessionRepository(session: _session);
    final service = LearningSessionService(repository: repository);

    final session = await service.getById('learn_test_1');

    expect(session, _session);
    expect(repository.lastGetById, 'learn_test_1');
  });

  test('list delegates to repository', () async {
    const sessions = [
      LearningSessionListItem(
        id: 'learn_test_1',
        type: LearningSessionType.quiz,
        status: LearningSessionStatus.ready,
        itemCount: 5,
        title: 'Quiz · test',
        createdAt: '2026-05-29T10:00:00.000Z',
        updatedAt: '2026-05-29T10:00:00.000Z',
      ),
    ];
    final repository = FakeLearningSessionRepository()..setSessions(sessions);
    final service = LearningSessionService(repository: repository);

    expect(await service.list(), sessions);
  });
}
