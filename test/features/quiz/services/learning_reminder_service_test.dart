import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/flashcard_sm2_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/flashcard_sm2_state.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder.dart';
import 'package:lucy_frontend/features/quiz/services/flashcard_sm2_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/quiz_attempt_test_data.dart';

const _flashcardsSession = LearningSessionListItem(
  id: 'learn_flash_1',
  type: LearningSessionType.flashcards,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Cartes · entropie',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
);

const _quizSession = LearningSessionListItem(
  id: 'learn_quiz_1',
  type: LearningSessionType.quiz,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Quiz · thermo',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<LearningReminderService> createService() async {
    final prefs = await SharedPreferences.getInstance();
    return LearningReminderService(
      flashcardSm2Service: FlashcardSm2Service(
        dataSource: FlashcardSm2PrefsDataSource(Future.value(prefs)),
      ),
      quizAttemptService: QuizAttemptService(
        dataSource: QuizAttemptPrefsDataSource(Future.value(prefs)),
      ),
    );
  }

  test('returns null when there is nothing to remind', () async {
    final service = await createService();

    final reminder = await service.pickPrimaryReminder(
      sessions: const [],
      now: DateTime.utc(2026, 6, 10, 12),
    );

    expect(reminder, isNull);
  });

  test('prioritizes due flashcards over weak quiz score', () async {
    final service = await createService();
    final prefs = await SharedPreferences.getInstance();
    final sm2DataSource = FlashcardSm2PrefsDataSource(Future.value(prefs));
    await sm2DataSource.writeStates('learn_flash_1', {
      'item-1': FlashcardSm2State(
        easeFactor: 2.5,
        repetitions: 1,
        intervalDays: 1,
        dueAt: DateTime.utc(2026, 6, 9),
      ),
    });

    final attemptService = QuizAttemptService(
      dataSource: QuizAttemptPrefsDataSource(Future.value(prefs)),
    );
    await attemptService.recordCompletedAttempt(
      session: quizSessionWithTwoItems(id: 'learn_quiz_1'),
      selectedAnswers: const {'item-1': 0, 'item-2': 2},
      startedAt: DateTime.utc(2026, 6, 10, 8),
      completedAt: DateTime.utc(2026, 6, 10, 8, 10),
    );

    final reminder = await service.pickPrimaryReminder(
      sessions: const [_flashcardsSession, _quizSession],
      now: DateTime.utc(2026, 6, 10, 12),
    );

    expect(reminder?.kind, LearningReminderKind.flashcardsDue);
    expect(reminder?.dueFlashcardCount, 2);
    expect(reminder?.sessionId, 'learn_flash_1');
  });

  test('returns weak quiz reminder when last attempt has errors', () async {
    final service = await createService();
    final prefs = await SharedPreferences.getInstance();
    final attemptService = QuizAttemptService(
      dataSource: QuizAttemptPrefsDataSource(Future.value(prefs)),
    );
    await attemptService.recordCompletedAttempt(
      session: quizSessionWithTwoItems(id: 'learn_quiz_1'),
      selectedAnswers: const {'item-1': 1, 'item-2': 2},
      startedAt: DateTime.utc(2026, 6, 10, 8),
      completedAt: DateTime.utc(2026, 6, 10, 8, 10),
    );

    final reminder = await service.pickPrimaryReminder(
      sessions: const [_quizSession],
      now: DateTime.utc(2026, 6, 10, 12),
    );

    expect(reminder?.kind, LearningReminderKind.weakQuiz);
    expect(reminder?.sessionId, 'learn_quiz_1');
    expect(reminder?.incorrectAnswerCount, 1);
    expect(reminder?.lastAttempt?.scoreCorrect, 1);
  });

  test('ignores perfect quiz attempts', () async {
    final service = await createService();
    final prefs = await SharedPreferences.getInstance();
    final attemptService = QuizAttemptService(
      dataSource: QuizAttemptPrefsDataSource(Future.value(prefs)),
    );
    await attemptService.recordCompletedAttempt(
      session: quizSessionWithTwoItems(id: 'learn_quiz_1'),
      selectedAnswers: const {'item-1': 1, 'item-2': 0},
      startedAt: DateTime.utc(2026, 6, 10, 8),
      completedAt: DateTime.utc(2026, 6, 10, 8, 10),
    );

    final reminder = await service.pickPrimaryReminder(
      sessions: const [_quizSession],
      now: DateTime.utc(2026, 6, 10, 12),
    );

    expect(reminder, isNull);
  });
}
