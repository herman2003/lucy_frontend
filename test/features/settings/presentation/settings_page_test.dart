import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/core/theme/lucy_theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/learner_profile.dart';
import 'package:lucy_frontend/features/settings/domain/entities/settings_profile.dart';
import 'package:lucy_frontend/features/settings/domain/providers/settings_provider.dart';
import 'package:lucy_frontend/features/settings/domain/repositories/settings_repository.dart';
import 'package:lucy_frontend/features/settings/presentation/pages/settings_page.dart';
import 'package:lucy_frontend/features/settings/presentation/widgets/settings_logout_button.dart';
import 'package:lucy_frontend/features/settings/presentation/widgets/settings_profile_header.dart';
import 'package:lucy_frontend/features/settings/services/settings_service.dart';
import 'package:lucy_frontend/shared/widgets/feedback/lucy_snackbar.dart';

class _FakeSettingsRepository implements SettingsRepository {
  _FakeSettingsRepository({required this.profile});

  final SettingsProfile profile;

  @override
  Future<SettingsProfile> fetchProfile() async => profile;

  @override
  Future<SettingsProfile> updateAccount({
    String? fullName,
    String? uiLocale,
  }) async {
    return SettingsProfile(
      fullName: fullName ?? profile.fullName,
      email: profile.email,
      uiLocale: uiLocale ?? profile.uiLocale,
      learnerProfile: profile.learnerProfile,
    );
  }

  @override
  Future<SettingsProfile> updateLearnerProfile(LearnerProfile learnerProfile) {
    throw UnimplementedError();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    LucyAppTheme.bootstrap();
  });

  tearDown(LucySnackBar.hideAll);

  const profile = SettingsProfile(
    fullName: 'Anna Müller',
    email: 'anna@example.com',
    uiLocale: 'de',
  );

  Future<void> pumpSettingsPage(
    WidgetTester tester, {
    Locale locale = const Locale('fr'),
    Size viewSize = const Size(390, 844),
  }) async {
    tester.view.physicalSize = viewSize;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final repository = _FakeSettingsRepository(profile: profile);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          settingsRepositoryProvider.overrideWithValue(repository),
          settingsServiceProvider.overrideWith(
            (ref) => SettingsService(repository: repository),
          ),
        ],
        child: MaterialApp.router(
          theme: LucyFlexTheme.lightTheme,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const SettingsPage(),
              ),
              GoRoute(
                path: LucyRoutePaths.settingsProfile,
                builder: (context, state) =>
                    const Scaffold(body: Text('profile-page')),
              ),
              GoRoute(
                path: LucyRoutePaths.settingsAiConfig,
                builder: (context, state) =>
                    const Scaffold(body: Text('ai-config-page')),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
  }

  Future<void> scrollTo(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(
      finder,
      120,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();
  }

  testWidgets('shows profile card and language row', (tester) async {
    await pumpSettingsPage(tester);
    await scrollTo(tester, find.byType(SettingsProfileHeader));

    expect(find.byType(SettingsProfileHeader), findsOneWidget);
    expect(find.text('Anna Müller'), findsOneWidget);
    expect(find.text('anna@example.com'), findsOneWidget);
    await scrollTo(tester, find.text('Langue de l\'interface'));
    expect(find.text('Langue de l\'interface'), findsOneWidget);
  });

  testWidgets('navigates to profile from hub card', (tester) async {
    await pumpSettingsPage(tester);
    await scrollTo(tester, find.byType(SettingsProfileHeader));

    await tester.tap(find.byType(SettingsProfileHeader));
    await tester.pumpAndSettle();

    expect(find.text('profile-page'), findsOneWidget);
  });

  testWidgets('navigates to AI config from hub menu', (tester) async {
    await pumpSettingsPage(tester);
    await scrollTo(tester, find.text('Configuration Lucy'));

    await tester.tap(find.text('Configuration Lucy'));
    await tester.pumpAndSettle();

    expect(find.text('ai-config-page'), findsOneWidget);
  });

  testWidgets('shows error outline logout on mobile', (tester) async {
    await pumpSettingsPage(tester);
    await scrollTo(tester, find.byType(SettingsLogoutButton));

    expect(find.byType(SettingsLogoutButton), findsOneWidget);
    expect(find.text('Se déconnecter'), findsOneWidget);
  });

  testWidgets('german locale does not overflow language row', (tester) async {
    await pumpSettingsPage(
      tester,
      locale: const Locale('de'),
      viewSize: const Size(320, 700),
    );
    await scrollTo(tester, find.text('Anna Müller'));

    expect(tester.takeException(), isNull);
    expect(find.text('Anna Müller'), findsOneWidget);
  });
}
