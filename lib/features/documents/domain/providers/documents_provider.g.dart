// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(documentsRepository)
const documentsRepositoryProvider = DocumentsRepositoryProvider._();

final class DocumentsRepositoryProvider
    extends
        $FunctionalProvider<
          DocumentsRepository,
          DocumentsRepository,
          DocumentsRepository
        >
    with $Provider<DocumentsRepository> {
  const DocumentsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsRepositoryHash();

  @$internal
  @override
  $ProviderElement<DocumentsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentsRepository create(Ref ref) {
    return documentsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentsRepository>(value),
    );
  }
}

String _$documentsRepositoryHash() =>
    r'c878d7333c1f167f438ba93703fa66580d9443f8';

@ProviderFor(documentsService)
const documentsServiceProvider = DocumentsServiceProvider._();

final class DocumentsServiceProvider
    extends
        $FunctionalProvider<
          DocumentsService,
          DocumentsService,
          DocumentsService
        >
    with $Provider<DocumentsService> {
  const DocumentsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsServiceHash();

  @$internal
  @override
  $ProviderElement<DocumentsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DocumentsService create(Ref ref) {
    return documentsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentsService>(value),
    );
  }
}

String _$documentsServiceHash() => r'65000bb2d90eed31749547e90cf6388add937441';
