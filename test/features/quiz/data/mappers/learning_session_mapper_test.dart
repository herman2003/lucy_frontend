import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/data/mappers/learning_session_mapper.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/generate_learning_session_request.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';

void main() {
  test('fromJson maps quiz session with items and sources', () {
    final session = LearningSessionMapper.fromJson({
      'id': 'learn_test_1',
      'type': 'quiz',
      'status': 'ready',
      'itemCount': 1,
      'title': 'Quiz · 2026-05-29',
      'createdAt': '2026-05-29T10:00:00.000Z',
      'updatedAt': '2026-05-29T10:00:00.000Z',
      'activeDocumentCount': 2,
      'sourceChatId': 'chat_1',
      'items': [
        {
          'id': 'item-1',
          'question': 'Q1?',
          'choices': ['A', 'B', 'C', 'D'],
          'correctIndex': 1,
          'explanation': 'Because.',
          'sources': [
            {
              'chunkId': 'chunk_1',
              'documentId': 'doc_1',
              'title': 'Thermo',
              'excerpt': 'Entropy rises.',
              'pageStart': 1,
              'pageEnd': 1,
            },
          ],
        },
      ],
    });

    expect(session.id, 'learn_test_1');
    expect(session.type, LearningSessionType.quiz);
    expect(session.status, LearningSessionStatus.ready);
    expect(session.sourceChatId, 'chat_1');
    expect(session.items, hasLength(1));
    expect(session.items.first.question, 'Q1?');
    expect(session.items.first.choices, ['A', 'B', 'C', 'D']);
    expect(session.items.first.sources.first.chunkId, 'chunk_1');
  });

  test('listFromJson maps session summaries', () {
    final sessions = LearningSessionMapper.listFromJson([
      {
        'id': 'learn_test_1',
        'type': 'quiz',
        'status': 'ready',
        'itemCount': 5,
        'title': 'Quiz · 2026-05-29',
        'createdAt': '2026-05-29T10:00:00.000Z',
        'updatedAt': '2026-05-29T10:00:00.000Z',
      },
    ]);

    expect(sessions, hasLength(1));
    expect(sessions.first.id, 'learn_test_1');
    expect(sessions.first.itemCount, 5);
  });

  test('generateRequestToJson omits null optional fields', () {
    final json = LearningSessionMapper.generateRequestToJson(
      const GenerateLearningSessionRequest(type: LearningSessionType.quiz),
    );

    expect(json, {'type': 'quiz'});
  });
}
