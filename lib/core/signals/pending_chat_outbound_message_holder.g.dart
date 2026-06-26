// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_chat_outbound_message_holder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds a pending message to send when the chat conversation is ready.

@ProviderFor(PendingChatOutboundMessageHolder)
const pendingChatOutboundMessageHolderProvider =
    PendingChatOutboundMessageHolderProvider._();

/// Holds a pending message to send when the chat conversation is ready.
final class PendingChatOutboundMessageHolderProvider
    extends
        $NotifierProvider<
          PendingChatOutboundMessageHolder,
          PendingChatOutboundMessage?
        > {
  /// Holds a pending message to send when the chat conversation is ready.
  const PendingChatOutboundMessageHolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingChatOutboundMessageHolderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingChatOutboundMessageHolderHash();

  @$internal
  @override
  PendingChatOutboundMessageHolder create() =>
      PendingChatOutboundMessageHolder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PendingChatOutboundMessage? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PendingChatOutboundMessage?>(value),
    );
  }
}

String _$pendingChatOutboundMessageHolderHash() =>
    r'3ec0e0c4782a2a5fc9fe9cf0b5fcae5d7739abde';

/// Holds a pending message to send when the chat conversation is ready.

abstract class _$PendingChatOutboundMessageHolder
    extends $Notifier<PendingChatOutboundMessage?> {
  PendingChatOutboundMessage? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<PendingChatOutboundMessage?, PendingChatOutboundMessage?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                PendingChatOutboundMessage?,
                PendingChatOutboundMessage?
              >,
              PendingChatOutboundMessage?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
