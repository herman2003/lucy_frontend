import 'package:frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:frontend/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';

import 'fake_onboarding_progress_repository.dart';
import 'fake_onboarding_repository.dart';

OnboardingService createTestOnboardingService(
  OnboardingRepository repository, {
  OnboardingResumeProgress? resumeProgress,
}) {
  return OnboardingService(
    repository: repository,
    progressRepository: FakeOnboardingProgressRepository(progress: resumeProgress),
  );
}

OnboardingService createTestOnboardingServiceFromFake(
  FakeOnboardingRepository repository, {
  OnboardingResumeProgress? resumeProgress,
}) {
  return createTestOnboardingService(repository, resumeProgress: resumeProgress);
}
