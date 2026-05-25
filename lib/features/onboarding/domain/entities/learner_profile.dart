import 'package:freezed_annotation/freezed_annotation.dart';

import '../exceptions/onboarding_exception.dart';

part 'learner_profile.freezed.dart';

/// Structured profile from `POST /v1/onboarding/analyze` (SPEC §4.4.1).
@freezed
abstract class LearnerProfile with _$LearnerProfile {
  const factory LearnerProfile({
    required String primaryRole,
    required List<String> mainDomains,
    required String learningGoal,
    required String selfAssessedLevel,
    required String explanationStyle,
    required String feedbackTone,
    required String tutoringLanguage,
  }) = _LearnerProfile;

  factory LearnerProfile.fromApiJson(Map<String, dynamic> json) {
    String reqString(String key) {
      final value = json[key];
      if (value is! String || value.isEmpty) {
        throw const OnboardingException('LLM_RESPONSE_INVALID');
      }
      return value;
    }

    final domains = json['main_domains'];
    if (domains is! List || domains.isEmpty) {
      throw const OnboardingException('LLM_RESPONSE_INVALID');
    }

    return LearnerProfile(
      primaryRole: reqString('primary_role'),
      mainDomains: domains.map((e) => e.toString()).toList(),
      learningGoal: reqString('learning_goal'),
      selfAssessedLevel: reqString('self_assessed_level'),
      explanationStyle: reqString('explanation_style'),
      feedbackTone: reqString('feedback_tone'),
      tutoringLanguage: reqString('tutoring_language'),
    );
  }
}
