import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/flashcard_sm2_prefs_data_source.dart';
import '../../services/flashcard_sm2_service.dart';

part 'flashcard_sm2_provider.g.dart';

@Riverpod(keepAlive: true)
FlashcardSm2Service flashcardSm2Service(Ref ref) {
  return FlashcardSm2Service(
    dataSource: FlashcardSm2PrefsDataSource(),
  );
}
