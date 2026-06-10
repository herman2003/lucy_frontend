import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_resume_progress.dart';
import 'package:lucy_frontend/features/onboarding/domain/exceptions/onboarding_exception.dart';
import 'package:lucy_frontend/features/onboarding/domain/repositories/onboarding_progress_repository.dart';

class FakeOnboardingProgressRepository implements OnboardingProgressRepository {
  FakeOnboardingProgressRepository({this.progress, this.throwOnFetch = false});

  final OnboardingResumeProgress? progress;
  final bool throwOnFetch;

  @override
  Future<OnboardingResumeProgress?> fetchProgress({required String uid}) async {
    if (throwOnFetch) {
      throw const OnboardingException('INTERNAL_ERROR');
    }
    return progress;
  }
}
