import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<QuizAttemptService> attemptService() async {
    return QuizAttemptService(
      dataSource: QuizAttemptPrefsDataSource(
        Future.value(await SharedPreferences.getInstance()),
      ),
    );
  }

  test('records and reads the last completed attempt', () async {
    final service = await attemptService();
    final startedAt = DateTime.utc(2026, 6, 10, 8);
    final completedAt = DateTime.utc(2026, 6, 10, 8, 5);

    await service.recordCompletedAttempt(
      session: _session,
      selectedAnswers: const {'item-1': 1, 'item-2': 0},
      startedAt: startedAt,
      completedAt: completedAt,
    );

    final last = await service.readLastAttempt('learn_test_1');
    expect(last, isNotNull);
    expect(last!.scoreCorrect, 2);
    expect(last.scoreTotal, 2);
    expect(last.answers, hasLength(2));
    expect(last.answers.first.isCorrect, isTrue);
  });

  test('readLastAttempts returns only sessions with history', () async {
    final service = await attemptService();
    await service.recordCompletedAttempt(
      session: _session,
      selectedAnswers: const {'item-1': 1, 'item-2': 2},
      startedAt: DateTime.utc(2026, 6, 10, 9),
      completedAt: DateTime.utc(2026, 6, 10, 9, 3),
    );

    final map = await service.readLastAttempts([
      'learn_test_1',
      'learn_missing',
    ]);
    expect(map.keys, ['learn_test_1']);
    expect(map['learn_test_1']!.scoreCorrect, 1);
  });

  test('deleteAttempts removes stored history', () async {
    final service = await attemptService();
    await service.recordCompletedAttempt(
      session: _session,
      selectedAnswers: const {'item-1': 1, 'item-2': 0},
      startedAt: DateTime.utc(2026, 6, 10, 10),
      completedAt: DateTime.utc(2026, 6, 10, 10, 4),
    );

    await service.deleteAttempts('learn_test_1');

    expect(await service.readLastAttempt('learn_test_1'), isNull);
  });
}
