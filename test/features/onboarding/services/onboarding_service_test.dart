import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/onboarding/domain/entities/confirm_turn_result.dart';
import 'package:frontend/features/onboarding/domain/entities/finalize_onboarding_result.dart';
import 'package:frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';
import 'package:frontend/features/onboarding/utils/onboarding_question_ids.dart';

import '../helpers/fake_onboarding_repository.dart';

void main() {
  group('OnboardingService', () {
    late FakeOnboardingRepository repository;
    late OnboardingService service;

    setUp(() {
      repository = FakeOnboardingRepository();
      service = OnboardingService(repository: repository);
    });

    test('validateAnswer delegates to repository with params', () async {
      const expected = ValidateAnswerResult.accepted(turnSummary: 'OK');

      repository = FakeOnboardingRepository(
        validateHandler: ({required locale, required questionId, required answerText, bool fallbackReduced = false}) async {
          expect(locale, 'fr');
          expect(questionId, OnboardingQuestionIds.qRole);
          expect(answerText, 'Ma réponse');
          return expected;
        },
      );
      service = OnboardingService(repository: repository);

      final result = await service.validateAnswer(
        locale: 'fr',
        questionId: OnboardingQuestionIds.qRole,
        answerText: 'Ma réponse',
      );

      expect(result, expected);
      expect(repository.validateCallCount, 1);
    });

    test('confirmTurn delegates to repository with params', () async {
      const expected = ConfirmTurnResult(
        onboardingStatus: 'in_progress',
        completedTurns: 2,
      );

      repository = FakeOnboardingRepository(
        confirmHandler: ({required locale, required questionId, required answerText, String confirmationType = 'normal'}) async {
          expect(locale, 'en');
          expect(questionId, OnboardingQuestionIds.qGoal);
          return expected;
        },
      );
      service = OnboardingService(repository: repository);

      final result = await service.confirmTurn(
        locale: 'en',
        questionId: OnboardingQuestionIds.qGoal,
        answerText: 'Exam prep',
      );

      expect(result, expected);
      expect(repository.confirmCallCount, 1);
    });

    test('analyze delegates to repository with locale', () async {
      const expected = OnboardingAnalyzeResult(
        learnerProfile: LearnerProfile(
          primaryRole: 'student',
          mainDomains: ['sciences'],
          learningGoal: 'exam',
          selfAssessedLevel: 'intermediate',
          explanationStyle: 'step_by_step',
          feedbackTone: 'encouraging',
          tutoringLanguage: 'fr',
        ),
        summaryForUser: 'Résumé',
      );

      repository = FakeOnboardingRepository(
        analyzeHandler: ({required locale}) async {
          expect(locale, 'de');
          return expected;
        },
      );
      service = OnboardingService(repository: repository);

      final result = await service.analyze(locale: 'de');

      expect(result, expected);
      expect(repository.analyzeCallCount, 1);
    });

    test('finalizeOnboarding delegates to repository', () async {
      var called = false;
      repository = FakeOnboardingRepository(
        finalizeHandler: () async {
          called = true;
          return const FinalizeOnboardingResult();
        },
      );
      service = OnboardingService(repository: repository);

      final result = await service.finalizeOnboarding();

      expect(called, isTrue);
      expect(result.isConfigured, isTrue);
      expect(repository.finalizeCallCount, 1);
    });
  });
}
