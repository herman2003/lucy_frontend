import '../domain/entities/flashcard_sm2_state.dart';

const double _kSm2MinimumEaseFactor = 1.3;
const double _kSm2InitialEaseFactor = 2.5;

FlashcardSm2State initialFlashcardSm2State(DateTime reviewedAt) {
  return FlashcardSm2State(
    easeFactor: _kSm2InitialEaseFactor,
    repetitions: 0,
    intervalDays: 0,
    dueAt: reviewedAt.toUtc(),
  );
}

FlashcardSm2State applySm2Review(
  FlashcardSm2State state,
  Sm2Quality quality, {
  required DateTime reviewedAt,
}) {
  final q = quality.value;
  var repetitions = state.repetitions;
  var intervalDays = state.intervalDays;
  var easeFactor = state.easeFactor;

  if (q < 3) {
    repetitions = 0;
    intervalDays = 1;
  } else {
    if (repetitions == 0) {
      intervalDays = 1;
    } else if (repetitions == 1) {
      intervalDays = 6;
    } else {
      intervalDays = (intervalDays * easeFactor).round().clamp(1, 3650);
    }
    repetitions += 1;
  }

  easeFactor += 0.1 - (5 - q) * (0.08 + (5 - q) * 0.02);
  if (easeFactor < _kSm2MinimumEaseFactor) {
    easeFactor = _kSm2MinimumEaseFactor;
  }

  final dueAt = reviewedAt.toUtc().add(Duration(days: intervalDays));

  return FlashcardSm2State(
    easeFactor: easeFactor,
    repetitions: repetitions,
    intervalDays: intervalDays,
    dueAt: dueAt,
  );
}

bool isFlashcardDue(FlashcardSm2State state, DateTime now) {
  return !state.dueAt.isAfter(now.toUtc());
}

bool hasFlashcardBeenReviewed(FlashcardSm2State state) {
  return state.repetitions > 0;
}
