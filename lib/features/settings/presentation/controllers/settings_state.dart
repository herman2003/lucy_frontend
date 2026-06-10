import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../onboarding/domain/entities/learner_profile.dart';

part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default('') String fullName,
    @Default('') String email,
    String? uiLocale,
    LearnerProfile? learnerProfile,
    String? errorCode,
    String? saveErrorCode,
  }) = _SettingsState;
}
