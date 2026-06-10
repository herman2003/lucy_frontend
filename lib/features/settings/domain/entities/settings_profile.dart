import '../../../onboarding/domain/entities/learner_profile.dart';

/// Account and preferences shown on the settings screen.
class SettingsProfile {
  const SettingsProfile({
    required this.fullName,
    required this.email,
    this.uiLocale,
    this.learnerProfile,
  });

  final String fullName;
  final String email;
  final String? uiLocale;
  final LearnerProfile? learnerProfile;

  String get displayName =>
      fullName.trim().isNotEmpty ? fullName.trim() : email;
}
