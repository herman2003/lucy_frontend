import '../entities/onboarding_local_draft.dart';

/// Local mirror for onboarding progress (SPEC §4.7 A16).
abstract class OnboardingLocalDraftRepository {
  Future<void> saveUiLocale(String locale);

  Future<String?> loadUiLocale();

  Future<void> saveDraft(OnboardingLocalDraft draft);

  Future<OnboardingLocalDraft?> loadDraft({required String uid});

  Future<void> clearDraft({required String uid});
}
