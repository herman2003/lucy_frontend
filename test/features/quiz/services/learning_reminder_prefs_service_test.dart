import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/learning_reminder_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_reminder_prefs.dart';
import 'package:lucy_frontend/features/quiz/services/learning_reminder_prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<LearningReminderPrefsService> createService() async {
    return LearningReminderPrefsService(
      dataSource: LearningReminderPrefsDataSource(
        Future.value(await SharedPreferences.getInstance()),
      ),
    );
  }

  test('returns defaults when nothing is stored', () async {
    final service = await createService();

    final prefs = await service.read();

    expect(prefs, LearningReminderPrefs.defaults);
  });

  test('persists updated reminder preferences', () async {
    final service = await createService();
    const updated = LearningReminderPrefs(
      enabled: true,
      reminderHour: 9,
      reminderMinute: 30,
      flashcardsDue: false,
      revisionPlanEnabled: true,
      weakQuizEnabled: false,
    );

    await service.save(updated);

    expect(await service.read(), updated);
  });
}
