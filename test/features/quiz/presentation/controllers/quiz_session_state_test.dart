import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/presentation/controllers/quiz_session_state.dart';

const _session = LearningSession(
  id: 'learn_quiz_1',
  type: LearningSessionType.quiz,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Quiz · thermo',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  items: [
    LearningSessionItem(
      id: 'item-1',
      question: 'Q1?',
      choices: ['A', 'B'],
      correctIndex: 0,
      sources: [],
    ),
    LearningSessionItem(
      id: 'item-2',
      question: 'Q2?',
      choices: ['A', 'B'],
      correctIndex: 0,
      sources: [],
    ),
  ],
);

void main() {
  test('incorrectItems lists only wrongly answered questions', () {
    const state = QuizSessionState(
      session: _session,
      selectedAnswers: {'item-1': 0, 'item-2': 1},
    );

    expect(state.incorrectItems, hasLength(1));
    expect(state.incorrectItems.first.id, 'item-2');
    expect(state.hasIncorrectAnswers, isTrue);
  });

  test('hasIncorrectAnswers is false on perfect score', () {
    const state = QuizSessionState(
      session: _session,
      selectedAnswers: {'item-1': 0, 'item-2': 0},
    );

    expect(state.incorrectItems, isEmpty);
    expect(state.hasIncorrectAnswers, isFalse);
  });
}
