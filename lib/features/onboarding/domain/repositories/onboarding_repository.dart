import '../entities/confirm_turn_result.dart';
import '../entities/finalize_onboarding_result.dart';
import '../entities/onboarding_analyze_result.dart';
import '../entities/validate_answer_result.dart';

abstract class OnboardingRepository {
  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
    bool fallbackReduced = false,
  });

  Future<ConfirmTurnResult> confirmTurn({
    required String locale,
    required String questionId,
    required String answerText,
    String confirmationType = 'normal',
  });

  Future<OnboardingAnalyzeResult> analyze({required String locale});

  Future<FinalizeOnboardingResult> finalizeOnboarding();
}
