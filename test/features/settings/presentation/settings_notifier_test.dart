import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucy_frontend/core/localization/lucy_app_locale_provider.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/settings/domain/entities/settings_profile.dart';
import 'package:lucy_frontend/features/settings/domain/exceptions/settings_exception.dart';
import 'package:lucy_frontend/features/settings/domain/providers/settings_provider.dart';
import 'package:lucy_frontend/features/settings/domain/repositories/settings_repository.dart';
import 'package:lucy_frontend/features/settings/presentation/controllers/settings_notifier.dart';
import 'package:lucy_frontend/features/settings/services/settings_service.dart';

class _FakeSettingsRepository implements SettingsRepository {
  _FakeSettingsRepository({SettingsProfile? profile, this.error})
    : profile = profile;

  SettingsProfile? profile;
  final Object? error;

  SettingsProfile? savedProfile;

  @override
  Future<SettingsProfile> fetchProfile() async {
    if (error != null) {
      throw error!;
    }
    return profile!;
  }

  @override
  Future<SettingsProfile> updateAccount({
    String? fullName,
    String? uiLocale,
  }) async {
    if (error != null) {
      throw error!;
    }
    savedProfile = SettingsProfile(
      fullName: fullName ?? profile!.fullName,
      email: profile!.email,
      uiLocale: uiLocale ?? profile!.uiLocale,
      learnerProfile: profile!.learnerProfile,
    );
    profile = savedProfile;
    return savedProfile!;
  }

  @override
  Future<SettingsProfile> updateLearnerProfile(
    LearnerProfile learnerProfile,
  ) async {
    if (error != null) {
      throw error!;
    }
    savedProfile = SettingsProfile(
      fullName: profile!.fullName,
      email: profile!.email,
      uiLocale: profile!.uiLocale,
      learnerProfile: learnerProfile,
    );
    profile = savedProfile;
    return savedProfile!;
  }
}

const _sampleProfile = LearnerProfile(
  primaryRole: 'student',
  mainDomains: ['sciences'],
  learningGoal: 'exam',
  selfAssessedLevel: 'intermediate',
  explanationStyle: 'step_by_step',
  feedbackTone: 'encouraging',
  tutoringLanguage: 'de',
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('SettingsNotifier', () {
    test('loads account and learner profile on success', () async {
      final repository = _FakeSettingsRepository(
        profile: const SettingsProfile(
          fullName: 'Anna Müller',
          email: 'anna@example.com',
          uiLocale: 'de',
          learnerProfile: _sampleProfile,
        ),
      );
      final container = _container(repository);
      addTearDown(container.dispose);

      await container.read(settingsProvider.notifier).load();

      final state = container.read(settingsProvider);
      expect(state.isLoading, isFalse);
      expect(state.fullName, 'Anna Müller');
      expect(state.email, 'anna@example.com');
      expect(state.uiLocale, 'de');
      expect(state.learnerProfile, _sampleProfile);
      expect(state.errorCode, isNull);
    });

    test('succeeds when learnerProfile is absent', () async {
      final repository = _FakeSettingsRepository(
        profile: const SettingsProfile(
          fullName: 'Bob',
          email: 'bob@example.com',
        ),
      );
      final container = _container(repository);
      addTearDown(container.dispose);

      await container.read(settingsProvider.notifier).load();

      final state = container.read(settingsProvider);
      expect(state.learnerProfile, isNull);
      expect(state.errorCode, isNull);
    });

    test('saveLearnerProfile updates state on success', () async {
      final repository = _FakeSettingsRepository(
        profile: const SettingsProfile(
          fullName: 'Bob',
          email: 'bob@example.com',
          learnerProfile: _sampleProfile,
        ),
      );
      final container = _container(repository);
      addTearDown(container.dispose);

      await container.read(settingsProvider.notifier).load();
      final ok = await container
          .read(settingsProvider.notifier)
          .saveLearnerProfile(_sampleProfile.copyWith(primaryRole: 'educator'));

      expect(ok, isTrue);
      expect(
        container.read(settingsProvider).learnerProfile?.primaryRole,
        'educator',
      );
    });

    test(
      'saveUiLocale applies locale immediately and ignores stale load',
      () async {
        final repository = _FakeSettingsRepository(
          profile: const SettingsProfile(
            fullName: 'Anna Müller',
            email: 'anna@example.com',
            uiLocale: 'de',
            learnerProfile: _sampleProfile,
          ),
        );
        final container = _container(repository);
        addTearDown(container.dispose);

        final loadFuture = container.read(settingsProvider.notifier).load();
        final saveFuture = container
            .read(settingsProvider.notifier)
            .saveUiLocale('fr');

        final saveOk = await saveFuture;
        await loadFuture;

        expect(saveOk, isTrue);
        expect(container.read(settingsProvider).uiLocale, 'fr');
        expect(container.read(lucyAppLocaleProvider).languageCode, 'fr');
      },
    );

    test('stores API error code on failure', () async {
      final repository = _FakeSettingsRepository(
        error: const SettingsException('UNAUTHORIZED'),
      );
      final container = _container(repository);
      addTearDown(container.dispose);

      await container.read(settingsProvider.notifier).load();

      final state = container.read(settingsProvider);
      expect(state.isLoading, isFalse);
      expect(state.errorCode, 'UNAUTHORIZED');
    });
  });
}

ProviderContainer _container(SettingsRepository repository) {
  return ProviderContainer(
    overrides: [
      settingsRepositoryProvider.overrideWithValue(repository),
      settingsServiceProvider.overrideWith(
        (ref) => SettingsService(repository: repository),
      ),
    ],
  );
}
