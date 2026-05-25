import '../../domain/entities/onboarding_local_draft.dart';
import '../../domain/repositories/onboarding_local_draft_repository.dart';
import '../datasources/onboarding_local_draft_prefs_data_source.dart';
import '../mappers/onboarding_local_draft_mapper.dart';

class OnboardingLocalDraftRepositoryImpl implements OnboardingLocalDraftRepository {
  OnboardingLocalDraftRepositoryImpl(this._dataSource);

  final OnboardingLocalDraftPrefsDataSource _dataSource;

  @override
  Future<void> saveUiLocale(String locale) {
    return _dataSource.writeString(OnboardingLocalDraftKeys.uiLocale, locale);
  }

  @override
  Future<String?> loadUiLocale() {
    return _dataSource.readString(OnboardingLocalDraftKeys.uiLocale);
  }

  @override
  Future<void> saveDraft(OnboardingLocalDraft draft) {
    return _dataSource.writeDraftJson(
      draft.uid,
      OnboardingLocalDraftMapper.toJson(draft),
    );
  }

  @override
  Future<OnboardingLocalDraft?> loadDraft({required String uid}) async {
    final json = await _dataSource.readDraftJson(uid);
    if (json == null) {
      return null;
    }
    final draft = OnboardingLocalDraftMapper.fromJson(json);
    if (draft == null || draft.uid != uid) {
      return null;
    }
    return draft;
  }

  @override
  Future<void> clearDraft({required String uid}) {
    return _dataSource.remove(OnboardingLocalDraftKeys.draftForUid(uid));
  }
}
