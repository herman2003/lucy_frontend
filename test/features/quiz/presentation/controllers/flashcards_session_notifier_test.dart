import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_status.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_type.dart';
import 'package:lucy_frontend/features/quiz/domain/providers/learning_session_provider.dart';
import 'package:lucy_frontend/features/quiz/presentation/controllers/flashcards_session_notifier.dart';
import 'package:lucy_frontend/features/quiz/services/learning_session_service.dart';

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
  test('navigates cards and resets flip on next/previous', () async {
    final repository = FakeLearningSessionRepository(session: _flashcardsSession);
    final container = ProviderContainer(
      overrides: [
        learningSessionServiceProvider.overrideWithValue(
          LearningSessionService(repository: repository),
        ),
      ],
    );
    addTearDown(container.dispose);

    final notifier =
        container.read(flashcardsSessionProvider('learn_flash_1').notifier);
    await notifier.load('learn_flash_1');

    notifier.toggleFlip();
    expect(
      container.read(flashcardsSessionProvider('learn_flash_1')).isFlipped,
      isTrue,
    );

    notifier.goToNextCard();
    final afterNext = container.read(flashcardsSessionProvider('learn_flash_1'));
    expect(afterNext.currentIndex, 1);
    expect(afterNext.isFlipped, isFalse);

    notifier.toggleFlip();
    notifier.goToPreviousCard();
    final afterPrevious =
        container.read(flashcardsSessionProvider('learn_flash_1'));
    expect(afterPrevious.currentIndex, 0);
    expect(afterPrevious.isFlipped, isFalse);
    expect(afterPrevious.canGoNext, isTrue);
    expect(afterPrevious.canGoPrevious, isFalse);
  });
}
