import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/quiz/domain/entities/quiz_eligibility.dart';
import 'package:frontend/features/quiz/services/quiz_service.dart';

import '../helpers/fake_quiz_repository.dart';

void main() {
  test('getEligibility returns repository value', () async {
    const eligibility = QuizEligibility(
      canQuiz: false,
      activeDocumentCount: 0,
    );
    final service = QuizService(
      repository: FakeQuizRepository(eligibility: eligibility),
    );

    expect(await service.getEligibility(), eligibility);
  });
}
