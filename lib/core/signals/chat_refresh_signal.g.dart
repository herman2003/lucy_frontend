// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_refresh_signal.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bumps when chat threads should reload (tab focus, return from thread list).

@ProviderFor(ChatRefreshSignal)
const chatRefreshSignalProvider = ChatRefreshSignalProvider._();

/// Bumps when chat threads should reload (tab focus, return from thread list).
final class ChatRefreshSignalProvider
    extends $NotifierProvider<ChatRefreshSignal, int> {
  /// Bumps when chat threads should reload (tab focus, return from thread list).
  const ChatRefreshSignalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRefreshSignalProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRefreshSignalHash();

  @$internal
  @override
  ChatRefreshSignal create() => ChatRefreshSignal();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$chatRefreshSignalHash() => r'c5925a6eeeae42d22e399d15beb687a65ef7484c';

/// Bumps when chat threads should reload (tab focus, return from thread list).

abstract class _$ChatRefreshSignal extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
