import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/flashcard_sm2_state.dart';
import 'package:lucy_frontend/features/quiz/utils/sm2_algorithm.dart';

void main() {
  final reviewedAt = DateTime.utc(2026, 6, 10, 12);

  test('initial state is due immediately', () {
    final state = initialFlashcardSm2State(reviewedAt);
    expect(state.repetitions, 0);
    expect(state.easeFactor, 2.5);
    expect(state.dueAt.isBefore(reviewedAt.add(const Duration(seconds: 1))), isTrue);
  });

  test('again resets repetitions and schedules one day later (LEARN-11c)', () {
    final initial = initialFlashcardSm2State(reviewedAt);
    final afterGood = applySm2Review(
      initial,
      Sm2Quality.good,
      reviewedAt: reviewedAt,
    );
    final afterAgain = applySm2Review(
      afterGood,
      Sm2Quality.again,
      reviewedAt: reviewedAt,
    );

    expect(afterAgain.repetitions, 0);
    expect(afterAgain.intervalDays, 1);
    expect(afterAgain.dueAt, DateTime.utc(2026, 6, 11, 12));
  });

  test('good progresses from first to second repetition', () {
    final initial = initialFlashcardSm2State(reviewedAt);
    final first = applySm2Review(initial, Sm2Quality.good, reviewedAt: reviewedAt);
    expect(first.repetitions, 1);
    expect(first.intervalDays, 1);

    final second = applySm2Review(first, Sm2Quality.good, reviewedAt: reviewedAt);
    expect(second.repetitions, 2);
    expect(second.intervalDays, 6);
  });

  test('easy increases ease factor and interval', () {
    final initial = initialFlashcardSm2State(reviewedAt);
    final reviewed = applySm2Review(initial, Sm2Quality.easy, reviewedAt: reviewedAt);

    expect(reviewed.easeFactor, greaterThan(2.5));
    expect(reviewed.intervalDays, 1);
  });
}
