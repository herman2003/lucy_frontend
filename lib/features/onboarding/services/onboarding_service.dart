import '../domain/entities/confirm_turn_result.dart';
import '../domain/entities/finalize_onboarding_result.dart';
import '../domain/entities/onboarding_analyze_result.dart';
import '../domain/entities/validate_answer_result.dart';
import '../domain/repositories/onboarding_repository.dart';

/// Business orchestration for the onboarding chat flow (UI → notifier → service).
class OnboardingService {
  OnboardingService({required OnboardingRepository repository})
      : _repository = repository;

  final OnboardingRepository _repository;

  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
    bool fallbackReduced = false,
  }) {
    return _repository.validateAnswer(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
      fallbackReduced: fallbackReduced,
    );
  }

  Future<ConfirmTurnResult> confirmTurn({
    required String locale,
    required String questionId,
    required String answerText,
    String confirmationType = 'normal',
  }) {
    return _repository.confirmTurn(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
      confirmationType: confirmationType,
    );
  }

  Future<OnboardingAnalyzeResult> analyze({
    required String locale,
    bool profileReduced = false,
  }) {
    return _repository.analyze(
      locale: locale,
      profileReduced: profileReduced,
    );
  }

  Future<FinalizeOnboardingResult> finalizeOnboarding() {
    return _repository.finalizeOnboarding();
  }
}
