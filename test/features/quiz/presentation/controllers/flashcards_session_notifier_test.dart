import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucy_frontend/features/quiz/data/datasources/flashcard_sm2_prefs_data_source.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/flashcard_sm2_state.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/flashcard_sm2_provider.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_session_provider.dart';
import 'package:lucy_frontend/features/quiz/presentation/controllers/flashcards_session_notifier.dart';
import 'package:lucy_frontend/features/quiz/services/flashcard_sm2_service.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/fake_learning_session_repository.dart';

const _flashcardsSession = LearningSession(
  id: 'learn_flash_1',
  type: LearningSessionType.flashcards,
  status: LearningSessionStatus.ready,
  itemCount: 2,
  title: 'Cartes · test',
  createdAt: '2026-05-29T10:00:00.000Z',
  updatedAt: '2026-05-29T10:00:00.000Z',
  activeDocumentCount: 1,
  items: [
    LearningSessionItem(
      id: 'item-1',
      front: 'Entropie',
      back: 'Mesure du désordre',
      sources: [],
    ),
    LearningSessionItem(
      id: 'item-2',
      front: 'Enthalpie',
      back: 'Chaleur à pression constante',
      sources: [],
    ),
  ],
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('rates a card and advances through the SM-2 queue (LEARN-11c)', () async {
    final repository = FakeLearningSessionRepository(
      session: _flashcardsSession,
    );
    final sm2Service = FlashcardSm2Service(
      dataSource: FlashcardSm2PrefsDataSource(
        Future.value(await SharedPreferences.getInstance()),
      ),
    );
    final container = ProviderContainer(
      overrides: [
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
        flashcardSm2ServiceProvider.overrideWithValue(sm2Service),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(
      flashcardsSessionProvider('learn_flash_1').notifier,
    );
    await notifier.load('learn_flash_1');

    notifier.toggleFlip();
    await notifier.rateCard(Sm2Quality.good);

    final afterFirst = container.read(flashcardsSessionProvider('learn_flash_1'));
    expect(afterFirst.queuePosition, 1);
    expect(afterFirst.isFlipped, isFalse);
    expect(afterFirst.sm2States['item-1']?.repetitions, 1);

    notifier.toggleFlip();
    await notifier.rateCard(Sm2Quality.good);

    final afterSecond = container.read(
      flashcardsSessionProvider('learn_flash_1'),
    );
    expect(afterSecond.isSessionComplete, isTrue);
  });

  test('requeues a card after an again rating', () async {
    final repository = FakeLearningSessionRepository(
      session: _flashcardsSession,
    );
    final sm2Service = FlashcardSm2Service(
      dataSource: FlashcardSm2PrefsDataSource(
        Future.value(await SharedPreferences.getInstance()),
      ),
    );
    final container = ProviderContainer(
      overrides: [
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
        flashcardSm2ServiceProvider.overrideWithValue(sm2Service),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(
      flashcardsSessionProvider('learn_flash_1').notifier,
    );
    await notifier.load('learn_flash_1');
    final initialQueueLength = container
        .read(flashcardsSessionProvider('learn_flash_1'))
        .studyQueue
        .length;

    notifier.toggleFlip();
    await notifier.rateCard(Sm2Quality.again);

    final afterAgain = container.read(flashcardsSessionProvider('learn_flash_1'));
    expect(afterAgain.studyQueue.length, initialQueueLength + 1);
    expect(afterAgain.queuePosition, 1);
  });
}
