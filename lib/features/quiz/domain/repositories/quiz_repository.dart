import '../entities/quiz_eligibility.dart';

abstract class QuizRepository {
  Future<QuizEligibility> getEligibility();
}
