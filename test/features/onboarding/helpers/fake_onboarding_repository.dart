import 'package:frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:frontend/features/onboarding/domain/repositories/onboarding_repository.dart';

class FakeOnboardingRepository implements OnboardingRepository {
  FakeOnboardingRepository({this.validateHandler});

  final Future<ValidateAnswerResult> Function({
    required String locale,
    required String questionId,
    required String answerText,
  })? validateHandler;

  int validateCallCount = 0;
  String? lastQuestionId;
  String? lastAnswerText;

  @override
  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
  }) async {
    validateCallCount++;
    lastQuestionId = questionId;
    lastAnswerText = answerText;
    if (validateHandler != null) {
      return validateHandler!(
        locale: locale,
        questionId: questionId,
        answerText: answerText,
      );
    }
    return const ValidateAnswerResult.accepted(
      turnSummary: 'Default summary.',
    );
  }
}
