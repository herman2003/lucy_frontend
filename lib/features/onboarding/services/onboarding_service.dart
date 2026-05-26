import '../domain/entities/confirm_turn_result.dart';
import '../domain/entities/finalize_onboarding_result.dart';
import '../domain/entities/onboarding_analyze_result.dart';
import '../domain/entities/onboarding_resume_progress.dart';
import '../domain/entities/validate_answer_result.dart';
import '../domain/entities/onboarding_local_draft.dart';
import '../domain/repositories/onboarding_local_draft_repository.dart';
import '../domain/repositories/onboarding_progress_repository.dart';
import '../domain/repositories/onboarding_repository.dart';

/// Business orchestration for the onboarding chat flow (UI → notifier → service).
class OnboardingService {
  OnboardingService({
    required OnboardingRepository repository,
    required OnboardingProgressRepository progressRepository,
    required OnboardingLocalDraftRepository localDraftRepository,
  }) : _repository = repository,
       _progressRepository = progressRepository,
       _localDraftRepository = localDraftRepository;

  final OnboardingRepository _repository;
  final OnboardingProgressRepository _progressRepository;
  final OnboardingLocalDraftRepository _localDraftRepository;

  Future<OnboardingResumeProgress?> fetchResumeProgress({
    required String? uid,
  }) async {
    if (uid == null) {
      return null;
    }
    try {
      return await _progressRepository.fetchProgress(uid: uid);
    } catch (_) {
      // A16: allow bootstrap to fall back to local draft when API is unavailable.
      return null;
    }
  }

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
    return _repository.analyze(locale: locale, profileReduced: profileReduced);
  }

  Future<FinalizeOnboardingResult> finalizeOnboarding() {
    return _repository.finalizeOnboarding();
  }

  Future<void> saveUiLocale(String locale) {
    return _localDraftRepository.saveUiLocale(locale);
  }

  Future<void> saveLocalDraft(OnboardingLocalDraft draft) {
    return _localDraftRepository.saveDraft(draft);
  }

  Future<OnboardingLocalDraft?> loadLocalDraft({required String uid}) {
    return _localDraftRepository.loadDraft(uid: uid);
  }

  Future<void> clearLocalDraft({required String uid}) {
    return _localDraftRepository.clearDraft(uid: uid);
  }
}
