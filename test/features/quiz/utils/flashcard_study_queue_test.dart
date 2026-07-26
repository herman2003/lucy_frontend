import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/flashcard_sm2_state.dart';
import 'package:lucy_frontend/features/quiz/utils/flashcard_study_queue.dart';
import 'package:lucy_frontend/features/quiz/utils/sm2_algorithm.dart';

void main() {
  final now = DateTime.utc(2026, 6, 10, 12);
  const itemIds = ['item-1', 'item-2', 'item-3'];

  test('prioritizes due cards then new cards (LEARN-11c)', () {
    final states = <String, FlashcardSm2State>{
      'item-1': applySm2Review(
        initialFlashcardSm2State(DateTime.utc(2026, 6, 1)),
        Sm2Quality.good,
        reviewedAt: DateTime.utc(2026, 6, 1),
      ),
    };

    final queue = buildFlashcardStudyQueue(
      itemIdsInOrder: itemIds,
      statesByItemId: states,
      now: now,
    );

    expect(queue.first, 0);
    expect(queue.skip(1).toList(), [1, 2]);
  });

  test('falls back to all cards when every card was reviewed but none is due', () {
    final states = <String, FlashcardSm2State>{};
    for (final itemId in itemIds) {
      states[itemId] = applySm2Review(
        initialFlashcardSm2State(now),
        Sm2Quality.good,
        reviewedAt: now,
      );
    }

    final queue = buildFlashcardStudyQueue(
      itemIdsInOrder: itemIds,
      statesByItemId: states,
      now: now,
    );

    expect(queue, [0, 1, 2]);
  });
}
