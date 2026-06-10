import '../../onboarding/domain/entities/learner_profile.dart';
import '../domain/entities/settings_profile.dart';
import '../domain/repositories/settings_repository.dart';

/// Settings business facade (UI → Notifier → Service → Repository).
class SettingsService {
  SettingsService({required SettingsRepository repository})
    : _repository = repository;

  final SettingsRepository _repository;

  Future<SettingsProfile> fetchProfile() => _repository.fetchProfile();

  Future<SettingsProfile> updateLearnerProfile(LearnerProfile profile) =>
      _repository.updateLearnerProfile(profile);

  Future<SettingsProfile> updateAccount({String? fullName, String? uiLocale}) =>
      _repository.updateAccount(fullName: fullName, uiLocale: uiLocale);
}
