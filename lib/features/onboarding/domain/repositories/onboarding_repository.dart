import '../entities/validate_answer_result.dart';

abstract class OnboardingRepository {
  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
  });
}
