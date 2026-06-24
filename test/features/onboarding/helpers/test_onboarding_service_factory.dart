import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_local_draft.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:lucy_frontend/features/onboarding/domain/repositories/onboarding_local_draft_repository.dart';
import 'package:lucy_frontend/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:lucy_frontend/features/onboarding/services/onboarding_service.dart';

import 'fake_onboarding_local_draft_repository.dart';
import 'fake_onboarding_progress_repository.dart';
import 'fake_onboarding_repository.dart';

OnboardingService createTestOnboardingService(
  OnboardingRepository repository, {
  OnboardingResumeProgress? resumeProgress,
  OnboardingLocalDraftRepository? localDraftRepository,
  Map<String, OnboardingLocalDraft>? localDrafts,
}) {
  return OnboardingService(
    repository: repository,
    progressRepository: FakeOnboardingProgressRepository(
      progress: resumeProgress,
    ),
    localDraftRepository:
        localDraftRepository ??
        FakeOnboardingLocalDraftRepository(drafts: localDrafts ?? {}),
  );
}

OnboardingService createTestOnboardingServiceFromFake(
  FakeOnboardingRepository repository, {
  OnboardingResumeProgress? resumeProgress,
  OnboardingLocalDraftRepository? localDraftRepository,
  Map<String, OnboardingLocalDraft>? localDrafts,
}) {
  return createTestOnboardingService(
    repository,
    resumeProgress: resumeProgress,
    localDraftRepository: localDraftRepository,
    localDrafts: localDrafts,
  );
}
