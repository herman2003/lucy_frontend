import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_library_refresh_signal.g.dart';

/// Bumps when the quiz library should reload sessions (chat generation, tab focus).
@Riverpod(keepAlive: true)
class QuizLibraryRefreshSignal extends _$QuizLibraryRefreshSignal {
  @override
  int build() => 0;

  void notify() => state++;
}
