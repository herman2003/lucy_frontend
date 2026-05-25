import 'package:frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:frontend/features/onboarding/domain/repositories/onboarding_progress_repository.dart';

class FakeOnboardingProgressRepository implements OnboardingProgressRepository {
  FakeOnboardingProgressRepository({this.progress});

  final OnboardingResumeProgress? progress;

  @override
  Future<OnboardingResumeProgress?> fetchProgress({required String uid}) async {
    return progress;
  }
}
