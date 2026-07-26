import '../data/datasources/flashcard_sm2_prefs_data_source.dart';
import '../domain/entities/flashcard_sm2_state.dart';

class FlashcardSm2Service {
  FlashcardSm2Service({required FlashcardSm2PrefsDataSource dataSource})
    : _dataSource = dataSource;

  final FlashcardSm2PrefsDataSource _dataSource;

  Future<Map<String, FlashcardSm2State>> loadStates(String sessionId) {
    return _dataSource.readStates(sessionId);
  }

  Future<void> saveState({
    required String sessionId,
    required String itemId,
    required FlashcardSm2State state,
    required Map<String, FlashcardSm2State> currentStates,
  }) async {
    final updated = Map<String, FlashcardSm2State>.from(currentStates)
      ..[itemId] = state;
    await _dataSource.writeStates(sessionId, updated);
  }
}
