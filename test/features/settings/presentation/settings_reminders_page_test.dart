import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_reminder_prefs_provider.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_prefs_service.dart';
import 'package:lucy_frontend/features/quiz/data/clients/learning_reminder_notification_client.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/flashcard_sm2_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/learning_reminder_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/generate_learning_session_request.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_reminder_notification_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/repositories/learning_session_repository.dart';
import 'package:lucy_frontend/features/quiz/services/flashcard_sm2_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_notification_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_service.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations_fr.dart';
import 'package:lucy_frontend/features/settings/presentation/pages/settings_reminders_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _NoopNotificationClient implements LearningReminderNotificationClient {
  @override
  Future<void> cancelDailyReminder() async {}

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> requestPermissions() async => true;

  @override
  Future<void> scheduleDailyReminder({
    required String title,
    required String body,
    required int hour,
    required int minute,
    required String sessionId,
  }) async {}
}

class _EmptyLearningSessionRepository implements LearningSessionRepository {
  @override
  Future<List<LearningSessionListItem>> list() async => const [];

  @override
  Future<LearningSession> generate(GenerateLearningSessionRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<LearningSession> getById(String sessionId) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String sessionId) {
    throw UnimplementedError();
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<void> pumpRemindersPage(WidgetTester tester) async {
    final prefs = await SharedPreferences.getInstance();
    final prefsService = LearningReminderPrefsService(
      dataSource: LearningReminderPrefsDataSource(Future.value(prefs)),
    );
    final notificationService = LearningReminderNotificationService(
      client: _NoopNotificationClient(),
      prefsService: prefsService,
      learningSessionService: LearningSessionService(
        repository: _EmptyLearningSessionRepository(),
      ),
      reminderService: LearningReminderService(
        flashcardSm2Service: FlashcardSm2Service(
          dataSource: FlashcardSm2PrefsDataSource(Future.value(prefs)),
        ),
        quizAttemptService: QuizAttemptService(
          dataSource: QuizAttemptPrefsDataSource(Future.value(prefs)),
        ),
      ),
      resolveLocalizations: (_) => AppLocalizationsFr(),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          learningReminderPrefsServiceProvider.overrideWithValue(prefsService),
          learningReminderNotificationServiceProvider.overrideWithValue(
            notificationService,
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
