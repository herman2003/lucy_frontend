import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/flashcard_sm2_state.dart';
import 'package:lucy_frontend/features/quiz/utils/learning_reminder_flashcard_counter.dart';

void main() {
  test('counts due reviewed cards and unstudied cards', () {
    final count = countDueFlashcardsForSession(
      itemCount: 3,
      statesByItemId: {
        'item-1': FlashcardSm2State(
          easeFactor: 2.5,
          repetitions: 1,
          intervalDays: 1,
          dueAt: DateTime.utc(2026, 6, 9),
        ),
        'item-2': FlashcardSm2State(
          easeFactor: 2.5,
          repetitions: 1,
          intervalDays: 6,
          dueAt: DateTime.utc(2026, 6, 20),
        ),
      },
      now: DateTime.utc(2026, 6, 10),
    );

    expect(count, 2);
  });
}
