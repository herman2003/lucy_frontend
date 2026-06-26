import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/learning_reminder_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_reminder_prefs_provider.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_prefs_service.dart';
import 'package:lucy_frontend/features/settings/presentation/pages/settings_reminders_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> pumpRemindersPage(WidgetTester tester) async {
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          learningReminderPrefsServiceProvider.overrideWithValue(
            LearningReminderPrefsService(
              dataSource: LearningReminderPrefsDataSource(Future.value(prefs)),
            ),
          ),
        ],
        child: MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const SettingsRemindersPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('shows default disabled reminder preferences', (tester) async {
    await pumpRemindersPage(tester);

    expect(find.text('Rappels'), findsOneWidget);
    expect(find.text('Activer les rappels'), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('Heure du rappel'), findsNothing);
  });

  testWidgets('reveals time and source toggles when reminders are enabled', (
    tester,
  ) async {
    await pumpRemindersPage(tester);

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    expect(find.text('Heure du rappel'), findsOneWidget);
    expect(find.text('Cartes à revoir'), findsOneWidget);
    expect(find.text('Plan de révision (J-N)'), findsOneWidget);
    expect(find.text('Quiz et points faibles'), findsOneWidget);
    expect(find.textContaining('18:'), findsOneWidget);
  });
}
