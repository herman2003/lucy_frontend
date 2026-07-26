import '../domain/entities/flashcard_sm2_state.dart';
import 'sm2_algorithm.dart';

/// Counts flashcards that should be reviewed now for one session.
int countDueFlashcardsForSession({
  required int itemCount,
  required Map<String, FlashcardSm2State> statesByItemId,
  required DateTime now,
}) {
  if (itemCount <= 0) {
    return 0;
  }

  var dueCount = 0;
  for (final state in statesByItemId.values) {
    if (isFlashcardDue(state, now)) {
      dueCount++;
    }
  }

  final unstudiedCount = itemCount - statesByItemId.length;
  if (unstudiedCount > 0) {
    dueCount += unstudiedCount;
  }

  return dueCount;
}
