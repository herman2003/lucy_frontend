// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_conversation_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatConversationNotifier)
const chatConversationProvider = ChatConversationNotifierFamily._();

final class ChatConversationNotifierProvider
    extends $NotifierProvider<ChatConversationNotifier, ChatConversationState> {
  const ChatConversationNotifierProvider._({
    required ChatConversationNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chatConversationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatConversationNotifierHash();

  @override
  String toString() {
    return r'chatConversationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatConversationNotifier create() => ChatConversationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatConversationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatConversationState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatConversationNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatConversationNotifierHash() =>
    r'a98a173166ef5c100258fad80a8a6bc4da29848e';

final class ChatConversationNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ChatConversationNotifier,
          ChatConversationState,
          ChatConversationState,
          ChatConversationState,
          String
        > {
  const ChatConversationNotifierFamily._()
    : super(
        retry: null,
        name: r'chatConversationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChatConversationNotifierProvider call(String chatId) =>
      ChatConversationNotifierProvider._(argument: chatId, from: this);

  @override
  String toString() => r'chatConversationProvider';
}

abstract class _$ChatConversationNotifier
    extends $Notifier<ChatConversationState> {
  late final _$args = ref.$arg as String;
  String get chatId => _$args;

  ChatConversationState build(String chatId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ChatConversationState, ChatConversationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChatConversationState, ChatConversationState>,
              ChatConversationState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
