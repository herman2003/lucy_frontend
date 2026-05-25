import 'package:frontend/features/onboarding/domain/entities/onboarding_local_draft.dart';
import 'package:frontend/features/onboarding/domain/repositories/onboarding_local_draft_repository.dart';

class FakeOnboardingLocalDraftRepository implements OnboardingLocalDraftRepository {
  FakeOnboardingLocalDraftRepository({
    Map<String, OnboardingLocalDraft>? drafts,
    this.uiLocale,
  }) : _drafts = drafts ?? {};

  final Map<String, OnboardingLocalDraft> _drafts;
  String? uiLocale;

  @override
  Future<void> saveUiLocale(String locale) async {
    uiLocale = locale;
  }

  @override
  Future<String?> loadUiLocale() async => uiLocale;

  @override
  Future<void> saveDraft(OnboardingLocalDraft draft) async {
    _drafts[draft.uid] = draft;
  }

  @override
  Future<OnboardingLocalDraft?> loadDraft({required String uid}) async {
    return _drafts[uid];
  }

  @override
  Future<void> clearDraft({required String uid}) async {
    _drafts.remove(uid);
  }
}
