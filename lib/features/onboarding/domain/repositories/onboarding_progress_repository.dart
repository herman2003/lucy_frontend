import '../entities/onboarding_resume_progress.dart';

/// Reads onboarding progression from Firestore (Flutter read-only, SPEC §4.9 Q9).
abstract class OnboardingProgressRepository {
  Future<OnboardingResumeProgress?> fetchProgress({required String uid});
}
