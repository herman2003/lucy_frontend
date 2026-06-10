// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatApiRemoteDataSource)
const chatApiRemoteDataSourceProvider = ChatApiRemoteDataSourceProvider._();

final class ChatApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ChatApiRemoteDataSource,
          ChatApiRemoteDataSource,
          ChatApiRemoteDataSource
        >
    with $Provider<ChatApiRemoteDataSource> {
  const ChatApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ChatApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatApiRemoteDataSource create(Ref ref) {
    return chatApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatApiRemoteDataSource>(value),
    );
  }
}

String _$chatApiRemoteDataSourceHash() =>
    r'd6c45384cf0e74cc8a2bd5a8adc4a13aa00cd4b7';

@ProviderFor(chatStreamRemoteDataSource)
const chatStreamRemoteDataSourceProvider =
    ChatStreamRemoteDataSourceProvider._();

final class ChatStreamRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ChatStreamRemoteDataSource,
          ChatStreamRemoteDataSource,
          ChatStreamRemoteDataSource
        >
    with $Provider<ChatStreamRemoteDataSource> {
  const ChatStreamRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatStreamRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatStreamRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ChatStreamRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatStreamRemoteDataSource create(Ref ref) {
    return chatStreamRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatStreamRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatStreamRemoteDataSource>(value),
    );
  }
}

String _$chatStreamRemoteDataSourceHash() =>
    r'1d32cd673625f4448e92f0e882b6eaee3eec8d1d';

@ProviderFor(chatRepositoryImpl)
const chatRepositoryImplProvider = ChatRepositoryImplProvider._();

final class ChatRepositoryImplProvider
    extends $FunctionalProvider<ChatRepository, ChatRepository, ChatRepository>
    with $Provider<ChatRepository> {
  const ChatRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<ChatRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatRepository create(Ref ref) {
    return chatRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRepository>(value),
    );
  }
}

String _$chatRepositoryImplHash() =>
    r'51371080c1d37746f3e18327c245177b53d065d7';
