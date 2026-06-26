import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'documents_refresh_signal.g.dart';

/// Bumps when the documents library should reload (tab focus).
@Riverpod(keepAlive: true)
class DocumentsRefreshSignal extends _$DocumentsRefreshSignal {
  @override
  int build() => 0;

  void notify() => state++;
}
