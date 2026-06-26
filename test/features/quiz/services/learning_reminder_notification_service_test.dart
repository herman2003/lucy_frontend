import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations_fr.dart';
import 'package:lucy_frontend/features/quiz/data/clients/learning_reminder_notification_client.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/learning_reminder_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder_prefs.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_notification_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_prefs_service.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/flashcard_sm2_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/quiz_attempt_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/services/flashcard_sm2_service.dart';
import 'package:lucy_frontend/features/quiz/services/quiz_attempt_service.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/generate_learning_session_request.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/repositories/learning_session_repository.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeLearningReminderNotificationClient
    implements LearningReminderNotificationClient {
  int cancelCount = 0;
  ScheduledLearningReminderNotification? lastSchedule;

  @override
  Future<void> cancelDailyReminder() async {
    cancelCount++;
  }

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
  }) async {
    lastSchedule = ScheduledLearningReminderNotification(
      title: title,
      body: body,
      hour: hour,
      minute: minute,
      sessionId: sessionId,
    );
  }
}

class _FakeLearningSessionRepository implements LearningSessionRepository {
  _FakeLearningSessionRepository(this._sessions);

  final List<LearningSessionListItem> _sessions;

  @override
  Future<List<LearningSessionListItem>> list() async => _sessions;

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

class _FakeLearningSessionService extends LearningSessionService {
  _FakeLearningSessionService(List<LearningSessionListItem> sessions)
    : super(repository: _FakeLearningSessionRepository(sessions));
}

class _FakeLearningReminderService extends LearningReminderService {
  _FakeLearningReminderService(
    this._reminder, {
    required FlashcardSm2Service flashcardSm2Service,
    required QuizAttemptService quizAttemptService,
  }) : super(
         flashcardSm2Service: flashcardSm2Service,
         quizAttemptService: quizAttemptService,
       );

  final LearningReminder? _reminder;
  bool? lastIncludeFlashcards;
  bool? lastIncludeWeakQuiz;

  @override
  Future<LearningReminder?> pickPrimaryReminder({
    required List<LearningSessionListItem> sessions,
    required DateTime now,
    bool includeFlashcards = true,
    bool includeWeakQuiz = true,
  }) async {
    lastIncludeFlashcards = includeFlashcards;
    lastIncludeWeakQuiz = includeWeakQuiz;
    return _reminder;
  }
}

const _flashcardsSession = LearningSessionListItem(
  id: 'learn_flash_1',
  type: LearningSessionType.flashcards,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Cartes · entropie',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<LearningReminderService> createReminderService(
    LearningReminder? reminder,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return _FakeLearningReminderService(
      reminder,
      flashcardSm2Service: FlashcardSm2Service(
        dataSource: FlashcardSm2PrefsDataSource(Future.value(sharedPrefs)),
      ),
      quizAttemptService: QuizAttemptService(
        dataSource: QuizAttemptPrefsDataSource(Future.value(sharedPrefs)),
      ),
    );
  }

  Future<LearningReminderNotificationService> createService({
    required LearningReminderNotificationClient client,
    required LearningReminderPrefs prefs,
    required LearningReminder? reminder,
  }) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final prefsService = LearningReminderPrefsService(
      dataSource: LearningReminderPrefsDataSource(Future.value(sharedPrefs)),
    );
    await prefsService.save(prefs);

    return LearningReminderNotificationService(
      client: client,
      prefsService: prefsService,
      learningSessionService: _FakeLearningSessionService(
        const [_flashcardsSession],
      ),
      reminderService: await createReminderService(reminder),
      resolveLocalizations: (_) => AppLocalizationsFr(),
    );
  }

  test('cancels scheduled notifications when reminders are disabled', () async {
    final client = _FakeLearningReminderNotificationClient();
    final service = await createService(
      client: client,
      prefs: LearningReminderPrefs.defaults,
      reminder: const LearningReminder(
        kind: LearningReminderKind.flashcardsDue,
        sessionId: 'learn_flash_1',
        sessionTitle: 'Cartes · entropie',
        dueFlashcardCount: 8,
      ),
    );

    await service.sync(languageCode: 'fr');

    expect(client.cancelCount, 1);
    expect(client.lastSchedule, isNull);
  });

  test('schedules daily notification when enabled with reminder content', () async {
    final client = _FakeLearningReminderNotificationClient();
    const reminder = LearningReminder(
      kind: LearningReminderKind.flashcardsDue,
      sessionId: 'learn_flash_1',
      sessionTitle: 'Cartes · entropie',
      dueFlashcardCount: 8,
    );
    final service = await createService(
      client: client,
      prefs: LearningReminderPrefs.defaults.copyWith(enabled: true),
      reminder: reminder,
    );

    await service.sync(languageCode: 'fr');

    expect(client.cancelCount, 0);
    expect(client.lastSchedule?.title, contains('8'));
    expect(client.lastSchedule?.hour, 18);
    expect(client.lastSchedule?.sessionId, 'learn_flash_1');
  });

  test('passes source toggles to reminder service', () async {
    final client = _FakeLearningReminderNotificationClient();
    final reminderService = await createReminderService(null);
    final sharedPrefs = await SharedPreferences.getInstance();
    final prefsService = LearningReminderPrefsService(
      dataSource: LearningReminderPrefsDataSource(Future.value(sharedPrefs)),
    );
    await prefsService.save(
      LearningReminderPrefs.defaults.copyWith(
        enabled: true,
        flashcardsDue: false,
        weakQuizEnabled: true,
      ),
    );

    final service = LearningReminderNotificationService(
      client: client,
      prefsService: prefsService,
      learningSessionService: _FakeLearningSessionService(
        const [_flashcardsSession],
      ),
      reminderService: reminderService,
      resolveLocalizations: (_) => AppLocalizationsFr(),
    );

    await service.sync(languageCode: 'fr');

    expect((reminderService as _FakeLearningReminderService).lastIncludeFlashcards, isFalse);
    expect((reminderService as _FakeLearningReminderService).lastIncludeWeakQuiz, isTrue);
    expect(client.cancelCount, 1);
  });
}
