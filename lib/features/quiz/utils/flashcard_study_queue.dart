import '../domain/entities/flashcard_sm2_state.dart';
import 'sm2_algorithm.dart';

List<int> buildFlashcardStudyQueue({
  required List<String> itemIdsInOrder,
  required Map<String, FlashcardSm2State> statesByItemId,
  required DateTime now,
}) {
  final dueIndices = <int>[];
  final freshIndices = <int>[];

  for (var index = 0; index < itemIdsInOrder.length; index++) {
    final itemId = itemIdsInOrder[index];
    final state = statesByItemId[itemId];
    if (state == null || !hasFlashcardBeenReviewed(state)) {
      freshIndices.add(index);
      continue;
    }
    if (isFlashcardDue(state, now)) {
      dueIndices.add(index);
    }
  }

  dueIndices.sort((left, right) {
    final leftDue = statesByItemId[itemIdsInOrder[left]]!.dueAt;
    final rightDue = statesByItemId[itemIdsInOrder[right]]!.dueAt;
    return leftDue.compareTo(rightDue);
  });

  final queue = [...dueIndices, ...freshIndices];
  if (queue.isEmpty) {
    return List<int>.generate(itemIdsInOrder.length, (index) => index);
  }
  return queue;
}

List<int> requeueCardForAnotherPass({
  required List<int> studyQueue,
  required int queuePosition,
  required int cardIndex,
}) {
  if (queuePosition >= studyQueue.length - 1) {
    return [...studyQueue, cardIndex];
  }
  final updated = [...studyQueue];
  updated.insert(queuePosition + 1, cardIndex);
  return updated;
}
