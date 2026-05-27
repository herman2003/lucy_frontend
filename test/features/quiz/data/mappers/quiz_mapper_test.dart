import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/quiz/data/mappers/quiz_mapper.dart';

void main() {
  test('eligibilityFromJson maps canQuiz and activeDocumentCount', () {
    final eligibility = QuizMapper.eligibilityFromJson({
      'canQuiz': true,
      'activeDocumentCount': 3,
    });

    expect(eligibility.canQuiz, isTrue);
    expect(eligibility.activeDocumentCount, 3);
  });
}
