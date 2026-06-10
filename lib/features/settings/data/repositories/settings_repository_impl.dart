import '../../../onboarding/domain/entities/learner_profile.dart';
import '../../domain/entities/settings_profile.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_api_remote_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._remote);

  final SettingsApiRemoteDataSource _remote;

  @override
  Future<SettingsProfile> fetchProfile() => _remote.fetchProfile();

  @override
  Future<SettingsProfile> updateLearnerProfile(LearnerProfile profile) =>
      _remote.updateLearnerProfile(profile);

  @override
  Future<SettingsProfile> updateAccount({String? fullName, String? uiLocale}) =>
      _remote.updateAccount(fullName: fullName, uiLocale: uiLocale);
}
