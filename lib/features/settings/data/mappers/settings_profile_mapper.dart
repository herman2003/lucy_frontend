import '../../../onboarding/data/mappers/pending_learner_profile_mapper.dart';
import '../../domain/entities/settings_profile.dart';

/// Maps Nest `GET /v1/users/me` JSON to [SettingsProfile].
abstract final class SettingsProfileMapper {
  static SettingsProfile fromApiJson(Map<String, dynamic> json) {
    final fullName = json['fullName'] is String
        ? json['fullName'] as String
        : '';
    final email = json['email'] is String ? json['email'] as String : '';
    final uiLocale = json['uiLocale'] is String
        ? json['uiLocale'] as String
        : null;
    final learnerProfile = PendingLearnerProfileMapper.fromFirestore(
      json['learnerProfile'],
    );

    return SettingsProfile(
      fullName: fullName,
      email: email,
      uiLocale: uiLocale,
      learnerProfile: learnerProfile,
    );
  }
}
