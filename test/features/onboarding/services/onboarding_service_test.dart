import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/onboarding/domain/entities/confirm_turn_result.dart';
import 'package:frontend/features/onboarding/domain/entities/finalize_onboarding_result.dart';
import 'package:frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:frontend/features/onboarding/domain/entities/validate_answer_result.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';
import 'package:frontend/features/onboarding/utils/onboarding_question_ids.dart';

import '../helpers/fake_onboarding_progress_repository.dart';
import '../helpers/fake_onboarding_repository.dart';

void main() {
  group('OnboardingService', () {
    late FakeOnboardingRepository repository;
    late OnboardingService service;

    setUp(() {
      repository = FakeOnboardingRepository();
      service = OnboardingService(
        repository: repository,
        progressRepository: FakeOnboardingProgressRepository(),
      );
    });

    test('fetchResumeProgress returns null when uid is null', () async {
      final result = await service.fetchResumeProgress(uid: null);
      expect(result, isNull);
    });

    test('fetchResumeProgress delegates to progress repository', () async {
      const progress = OnboardingResumeProgress(
        onboardingStatus: 'in_progress',
        transcript: [],
      );
      service = OnboardingService(
        repository: repository,
        progressRepository: FakeOnboardingProgressRepository(progress: progress),
      );

      final result = await service.fetchResumeProgress(uid: 'uid-1');
      expect(result, progress);
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
      service = OnboardingService(
        repository: repository,
        progressRepository: FakeOnboardingProgressRepository(),
      );

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
      service = OnboardingService(
        repository: repository,
        progressRepository: FakeOnboardingProgressRepository(),
      );

      final result = await service.confirmTurn(
        locale: 'en',
        questionId: OnboardingQuestionIds.qGoal,
        answerText: 'Exam prep',
      );

      expect(result, expected);
      expect(repository.confirmCallCount, 1);
    });

    test('analyze delegates to repository with locale and profileReduced', () async {
      const expected = OnboardingAnalyzeResult.success(
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
        analyzeHandler: ({required locale, bool profileReduced = false}) async {
          expect(locale, 'de');
          expect(profileReduced, isTrue);
          return expected;
        },
      );
      service = OnboardingService(
        repository: repository,
        progressRepository: FakeOnboardingProgressRepository(),
      );

      final result = await service.analyze(locale: 'de', profileReduced: true);

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
      service = OnboardingService(
        repository: repository,
        progressRepository: FakeOnboardingProgressRepository(),
      );

      final result = await service.finalizeOnboarding();

      expect(called, isTrue);
      expect(result.isConfigured, isTrue);
      expect(repository.finalizeCallCount, 1);
    });
  });
}
