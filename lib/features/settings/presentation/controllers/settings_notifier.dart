import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/localization/lucy_app_locale_provider.dart';
import '../../../onboarding/domain/entities/learner_profile.dart';
import '../../domain/exceptions/settings_exception.dart';
import '../../domain/providers/settings_provider.dart';
import 'settings_state.dart';

part 'settings_notifier.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() => const SettingsState();

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorCode: null);
    try {
      final profile = await ref.read(settingsServiceProvider).fetchProfile();
      state = state.copyWith(
        isLoading: false,
        fullName: profile.fullName,
        email: profile.email,
        uiLocale: profile.uiLocale,
        learnerProfile: profile.learnerProfile,
      );
      ref
          .read(lucyAppLocaleProvider.notifier)
          .applyLanguageCode(profile.uiLocale);
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  Future<bool> saveFullName(String fullName) async {
    state = state.copyWith(isSaving: true, saveErrorCode: null);
    try {
      final updated = await ref
          .read(settingsServiceProvider)
          .updateAccount(fullName: fullName.trim());
      state = state.copyWith(
        isSaving: false,
        fullName: updated.fullName,
        email: updated.email,
        uiLocale: updated.uiLocale,
        learnerProfile: updated.learnerProfile,
      );
      return true;
    } catch (error) {
      state = state.copyWith(isSaving: false, saveErrorCode: _errorCode(error));
      return false;
    }
  }

  Future<bool> saveUiLocale(String uiLocale) async {
    state = state.copyWith(isSaving: true, saveErrorCode: null);
    try {
      final updated = await ref
          .read(settingsServiceProvider)
          .updateAccount(uiLocale: uiLocale);
      state = state.copyWith(
        isSaving: false,
        fullName: updated.fullName,
        email: updated.email,
        uiLocale: updated.uiLocale,
        learnerProfile: updated.learnerProfile,
      );
      ref.read(lucyAppLocaleProvider.notifier).applyLanguageCode(uiLocale);
      return true;
    } catch (error) {
      state = state.copyWith(isSaving: false, saveErrorCode: _errorCode(error));
      return false;
    }
  }

  Future<bool> saveLearnerProfile(LearnerProfile profile) async {
    state = state.copyWith(isSaving: true, saveErrorCode: null);
    try {
      final updated = await ref
          .read(settingsServiceProvider)
          .updateLearnerProfile(profile);
      state = state.copyWith(
        isSaving: false,
        fullName: updated.fullName,
        email: updated.email,
        uiLocale: updated.uiLocale,
        learnerProfile: updated.learnerProfile,
      );
      return true;
    } catch (error) {
      state = state.copyWith(isSaving: false, saveErrorCode: _errorCode(error));
      return false;
    }
  }

  String _errorCode(Object error) {
    if (error is SettingsException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
