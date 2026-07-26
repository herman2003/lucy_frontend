import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_refresh_signal.g.dart';

/// Bumps when chat threads should reload (tab focus, return from thread list).
@Riverpod(keepAlive: true)
class ChatRefreshSignal extends _$ChatRefreshSignal {
  @override
  int build() => 0;

  void notify() => state++;
}
