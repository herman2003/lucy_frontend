import '../domain/entities/confirm_turn_result.dart';
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
  }) {
    return _repository.validateAnswer(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
    );
  }

  Future<ConfirmTurnResult> confirmTurn({
    required String locale,
    required String questionId,
    required String answerText,
  }) {
    return _repository.confirmTurn(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
    );
  }

  Future<OnboardingAnalyzeResult> analyze({required String locale}) {
    return _repository.analyze(locale: locale);
  }
}
