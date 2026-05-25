import 'package:frontend/features/onboarding/domain/repositories/onboarding_repository.dart';

/// Business orchestration for the onboarding chat flow (UI → notifier → service).
class OnboardingService {
  OnboardingService(this._repository);

  final OnboardingRepository _repository;

  OnboardingRepository get repository => _repository;
}
