import 'package:riverpod/misc.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:frontend/features/onboarding/domain/providers/onboarding_provider.dart';

import '../../auth/helpers/fake_auth_repository.dart';
import 'fake_onboarding_repository.dart';
import 'test_onboarding_service_factory.dart';

/// Onboarding repository + service overrides (notifier unit tests).
List<Override> onboardingProviderOverrides({
  required FakeOnboardingRepository repository,
  OnboardingResumeProgress? resumeProgress,
}) {
  return [
    onboardingRepositoryProvider.overrideWithValue(repository),
    onboardingServiceProvider.overrideWithValue(
      createTestOnboardingServiceFromFake(
        repository,
        resumeProgress: resumeProgress,
      ),
    ),
  ];
}

/// Full overrides for [OnboardingChatPage] (includes fake auth for bootstrap).
List<Override> onboardingChatTestOverrides({
  required FakeOnboardingRepository repository,
  OnboardingResumeProgress? resumeProgress,
  AuthUser? authUser,
}) {
  return [
    authRepositoryProvider.overrideWithValue(FakeAuthRepository(authUser)),
    ...onboardingProviderOverrides(
      repository: repository,
      resumeProgress: resumeProgress,
    ),
  ];
}
