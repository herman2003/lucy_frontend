import '../../../onboarding/domain/entities/learner_profile.dart';
import '../entities/settings_profile.dart';

/// Reads account settings from Nest (`GET /v1/users/me`).
abstract class SettingsRepository {
  Future<SettingsProfile> fetchProfile();

  Future<SettingsProfile> updateLearnerProfile(LearnerProfile profile);

  Future<SettingsProfile> updateAccount({String? fullName, String? uiLocale});
}
