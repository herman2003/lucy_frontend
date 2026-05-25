import 'learner_profile.dart';
import 'onboarding_transcript_turn.dart';

/// Onboarding fields read from `users/{uid}` for session resume (SPEC Q3).
class OnboardingResumeProgress {
  const OnboardingResumeProgress({
    required this.onboardingStatus,
    required this.transcript,
    this.pendingLearnerProfile,
    this.pendingSummaryForUser,
  });

  final String onboardingStatus;
  final List<OnboardingTranscriptTurn> transcript;
  final LearnerProfile? pendingLearnerProfile;
  final String? pendingSummaryForUser;
}
