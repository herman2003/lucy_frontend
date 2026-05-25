import '../../domain/entities/learner_profile.dart';
import '../../domain/exceptions/onboarding_exception.dart';

/// Maps Firestore `pendingLearnerProfile` (snake_case, SPEC §4.4.1).
abstract final class PendingLearnerProfileMapper {
  static LearnerProfile? fromFirestore(Object? raw) {
    if (raw is! Map) {
      return null;
    }
    try {
      return LearnerProfile.fromApiJson(Map<String, dynamic>.from(raw));
    } on OnboardingException {
      return null;
    }
  }
}
