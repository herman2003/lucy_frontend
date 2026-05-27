// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_mirror_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatLocalMirrorPrefsDataSource)
const chatLocalMirrorPrefsDataSourceProvider =
    ChatLocalMirrorPrefsDataSourceProvider._();

final class ChatLocalMirrorPrefsDataSourceProvider
    extends
        $FunctionalProvider<
          ChatLocalMirrorPrefsDataSource,
          ChatLocalMirrorPrefsDataSource,
          ChatLocalMirrorPrefsDataSource
        >
    with $Provider<ChatLocalMirrorPrefsDataSource> {
  const ChatLocalMirrorPrefsDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatLocalMirrorPrefsDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatLocalMirrorPrefsDataSourceHash();

  @$internal
  @override
  $ProviderElement<ChatLocalMirrorPrefsDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatLocalMirrorPrefsDataSource create(Ref ref) {
    return chatLocalMirrorPrefsDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatLocalMirrorPrefsDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatLocalMirrorPrefsDataSource>(
        value,
      ),
    );
  }
}

String _$chatLocalMirrorPrefsDataSourceHash() =>
    r'4e44057092af43c036d68533042d2d4ae821d211';

@ProviderFor(chatLocalMirrorRepository)
const chatLocalMirrorRepositoryProvider = ChatLocalMirrorRepositoryProvider._();

final class ChatLocalMirrorRepositoryProvider
    extends
        $FunctionalProvider<
          ChatLocalMirrorRepository,
          ChatLocalMirrorRepository,
          ChatLocalMirrorRepository
        >
    with $Provider<ChatLocalMirrorRepository> {
  const ChatLocalMirrorRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatLocalMirrorRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatLocalMirrorRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatLocalMirrorRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatLocalMirrorRepository create(Ref ref) {
    return chatLocalMirrorRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatLocalMirrorRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatLocalMirrorRepository>(value),
    );
  }
}

String _$chatLocalMirrorRepositoryHash() =>
    r'daa4259e71017fc00f29b2c1f766955e1602f387';

@ProviderFor(chatMirrorService)
const chatMirrorServiceProvider = ChatMirrorServiceProvider._();

final class ChatMirrorServiceProvider
    extends
        $FunctionalProvider<
          ChatMirrorService,
          ChatMirrorService,
          ChatMirrorService
        >
    with $Provider<ChatMirrorService> {
  const ChatMirrorServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatMirrorServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatMirrorServiceHash();

  @$internal
  @override
  $ProviderElement<ChatMirrorService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatMirrorService create(Ref ref) {
    return chatMirrorService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatMirrorService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatMirrorService>(value),
    );
  }
}

String _$chatMirrorServiceHash() => r'f62e8ca519ecccb5c93ccfac8073ea124e30789d';

/// Purges chat mirror when Firebase session ends (spec §3.4).

@ProviderFor(chatMirrorLogoutListener)
const chatMirrorLogoutListenerProvider = ChatMirrorLogoutListenerProvider._();

/// Purges chat mirror when Firebase session ends (spec §3.4).

final class ChatMirrorLogoutListenerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// Purges chat mirror when Firebase session ends (spec §3.4).
  const ChatMirrorLogoutListenerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatMirrorLogoutListenerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatMirrorLogoutListenerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return chatMirrorLogoutListener(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$chatMirrorLogoutListenerHash() =>
    r'60853473c4f0d1df48357b5530c4271115c4153a';
