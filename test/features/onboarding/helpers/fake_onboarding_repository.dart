import 'package:frontend/features/onboarding/domain/entities/confirm_turn_result.dart';
import 'package:frontend/features/onboarding/domain/entities/finalize_onboarding_result.dart';
import 'package:frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:frontend/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:frontend/features/onboarding/utils/onboarding_question_ids.dart';

class FakeOnboardingRepository implements OnboardingRepository {
  FakeOnboardingRepository({
    this.validateHandler,
    this.confirmHandler,
    this.analyzeHandler,
    this.finalizeHandler,
  });

  final Future<ValidateAnswerResult> Function({
    required String locale,
    required String questionId,
    required String answerText,
    bool fallbackReduced,
  })?
  validateHandler;

  final Future<ConfirmTurnResult> Function({
    required String locale,
    required String questionId,
    required String answerText,
    String confirmationType,
  })?
  confirmHandler;

  final Future<OnboardingAnalyzeResult> Function({
    required String locale,
    bool profileReduced,
  })?
  analyzeHandler;

  final Future<FinalizeOnboardingResult> Function()? finalizeHandler;

  int validateCallCount = 0;
  bool lastValidateFallbackReduced = false;
  int confirmCallCount = 0;
  String lastConfirmationType = 'normal';
  int analyzeCallCount = 0;
  int finalizeCallCount = 0;
  String? lastQuestionId;
  String? lastAnswerText;
  int completedTurnsAfterConfirm = 0;

  @override
  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
    bool fallbackReduced = false,
  }) async {
    validateCallCount++;
    lastValidateFallbackReduced = fallbackReduced;
    lastQuestionId = questionId;
    lastAnswerText = answerText;
    if (validateHandler != null) {
      return validateHandler!(
        locale: locale,
        questionId: questionId,
        answerText: answerText,
        fallbackReduced: fallbackReduced,
      );
    }
    return const ValidateAnswerResult.accepted(
      turnSummary: 'Default summary.',
    );
  }

  @override
  Future<ConfirmTurnResult> confirmTurn({
    required String locale,
    required String questionId,
    required String answerText,
    String confirmationType = 'normal',
  }) async {
    confirmCallCount++;
    lastConfirmationType = confirmationType;
    if (confirmHandler != null) {
      return confirmHandler!(
        locale: locale,
        questionId: questionId,
        answerText: answerText,
        confirmationType: confirmationType,
      );
    }

    completedTurnsAfterConfirm++;
    final isLast = completedTurnsAfterConfirm >= OnboardingQuestionIds.stepCount;
    return ConfirmTurnResult(
      onboardingStatus: isLast ? 'awaiting_analyze' : 'in_progress',
      completedTurns: completedTurnsAfterConfirm,
    );
  }

  bool lastAnalyzeProfileReduced = false;

  @override
  Future<OnboardingAnalyzeResult> analyze({
    required String locale,
    bool profileReduced = false,
  }) async {
    analyzeCallCount++;
    lastAnalyzeProfileReduced = profileReduced;
    if (analyzeHandler != null) {
      return analyzeHandler!(locale: locale, profileReduced: profileReduced);
    }
    return OnboardingAnalyzeResult.success(
      learnerProfile: const LearnerProfile(
        primaryRole: 'student',
        mainDomains: ['sciences'],
        learningGoal: 'exam',
        selfAssessedLevel: 'intermediate',
        explanationStyle: 'step_by_step',
        feedbackTone: 'encouraging',
        tutoringLanguage: 'fr',
      ),
      summaryForUser: 'Profil analysé.',
    );
  }

  @override
  Future<FinalizeOnboardingResult> finalizeOnboarding() async {
    finalizeCallCount++;
    if (finalizeHandler != null) {
      return finalizeHandler!();
    }
    return const FinalizeOnboardingResult();
  }
}
