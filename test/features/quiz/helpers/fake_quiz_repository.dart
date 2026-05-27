import 'package:frontend/features/quiz/domain/entities/quiz_eligibility.dart';
import 'package:frontend/features/quiz/domain/repositories/quiz_repository.dart';

class FakeQuizRepository implements QuizRepository {
  FakeQuizRepository({
    QuizEligibility eligibility = const QuizEligibility(
      canQuiz: true,
      activeDocumentCount: 1,
    ),
  }) : _eligibility = eligibility;

  QuizEligibility _eligibility;

  void setEligibility(QuizEligibility eligibility) {
    _eligibility = eligibility;
  }

  @override
  Future<QuizEligibility> getEligibility() async => _eligibility;
}
