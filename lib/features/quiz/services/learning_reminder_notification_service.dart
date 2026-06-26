import '../../../core/localization/l10n/app_localizations.dart';
import '../data/clients/learning_reminder_notification_client.dart';
import '../domain/entities/learning_reminder_notification_plan.dart';
import '../utils/learning_reminder_labels.dart';
import '../utils/learning_reminder_notification_plan_builder.dart';
import 'learning_reminder_prefs_service.dart';
import 'learning_reminder_service.dart';
import 'learning_session_service.dart';

/// Syncs local notification scheduling with reminder prefs and content (LEARN-12a-4).
class LearningReminderNotificationService {
  LearningReminderNotificationService({
    required LearningReminderNotificationClient client,
    required LearningReminderPrefsService prefsService,
    required LearningSessionService learningSessionService,
    required LearningReminderService reminderService,
    required AppLocalizations Function(String languageCode) resolveLocalizations,
  }) : _client = client,
       _prefsService = prefsService,
       _learningSessionService = learningSessionService,
       _reminderService = reminderService,
       _resolveLocalizations = resolveLocalizations;

  final LearningReminderNotificationClient _client;
  final LearningReminderPrefsService _prefsService;
  final LearningSessionService _learningSessionService;
  final LearningReminderService _reminderService;
  final AppLocalizations Function(String languageCode) _resolveLocalizations;

  Future<void> sync({
    required String languageCode,
    DateTime? now,
  }) async {
    await _client.initialize();
    final prefs = await _prefsService.read();

    if (!prefs.enabled) {
      await _client.cancelDailyReminder();
      return;
    }

    final granted = await _client.requestPermissions();
    if (!granted) {
      await _client.cancelDailyReminder();
      return;
    }

    final sessions = await _learningSessionService.list();
    final reminder = await _reminderService.pickPrimaryReminder(
      sessions: sessions,
      now: (now ?? DateTime.now()).toUtc(),
      includeFlashcards: prefs.flashcardsDue,
      includeWeakQuiz: prefs.weakQuizEnabled,
    );

    final labels = reminder == null
        ? null
        : buildLearningReminderLabels(
            _resolveLocalizations(languageCode),
            reminder,
          );

    final plan = buildLearningReminderNotificationPlan(
      prefs: prefs,
      reminder: reminder,
      labels: labels,
    );

    await _applyPlan(plan, sessionId: reminder?.sessionId);
  }

  Future<void> _applyPlan(
    LearningReminderNotificationPlan plan, {
    required String? sessionId,
  }) async {
    switch (plan.action) {
      case LearningReminderNotificationAction.cancel:
        await _client.cancelDailyReminder();
      case LearningReminderNotificationAction.schedule:
        await _client.scheduleDailyReminder(
          title: plan.title!,
          body: plan.body!,
          hour: plan.hour!,
          minute: plan.minute!,
          sessionId: sessionId ?? '',
        );
    }
  }
}
