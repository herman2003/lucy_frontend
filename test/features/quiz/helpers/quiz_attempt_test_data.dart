import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';

LearningSession quizSessionWithTwoItems({required String id}) {
  return LearningSession(
    id: id,
    type: LearningSessionType.quiz,
    status: LearningSessionStatus.ready,
    itemCount: 2,
    title: 'Quiz · test',
    createdAt: '2026-05-29T10:00:00.000Z',
    updatedAt: '2026-05-29T10:00:00.000Z',
    activeDocumentCount: 1,
    items: const [
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
}
