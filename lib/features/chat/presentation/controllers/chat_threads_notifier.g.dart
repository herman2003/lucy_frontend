// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_threads_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatThreadsNotifier)
const chatThreadsProvider = ChatThreadsNotifierProvider._();

final class ChatThreadsNotifierProvider
    extends $NotifierProvider<ChatThreadsNotifier, ChatThreadsState> {
  const ChatThreadsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatThreadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatThreadsNotifierHash();

  @$internal
  @override
  ChatThreadsNotifier create() => ChatThreadsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatThreadsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatThreadsState>(value),
    );
  }
}

String _$chatThreadsNotifierHash() =>
    r'ed7995484225bfd3f856cebeffa9ff1db922be71';

abstract class _$ChatThreadsNotifier extends $Notifier<ChatThreadsState> {
  ChatThreadsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChatThreadsState, ChatThreadsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChatThreadsState, ChatThreadsState>,
              ChatThreadsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
