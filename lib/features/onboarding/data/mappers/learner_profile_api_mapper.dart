import '../../domain/entities/learner_profile.dart';

/// Serializes [LearnerProfile] for Nest (`PATCH /v1/users/me/learner-profile`).
abstract final class LearnerProfileApiMapper {
  static Map<String, dynamic> toApiJson(LearnerProfile profile) {
    return {
      'primary_role': profile.primaryRole,
      'main_domains': profile.mainDomains,
      'learning_goal': profile.learningGoal,
      'self_assessed_level': profile.selfAssessedLevel,
      'explanation_style': profile.explanationStyle,
      'feedback_tone': profile.feedbackTone,
      'tutoring_language': profile.tutoringLanguage,
    };
  }
}
