// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(documentsApiRemoteDataSource)
const documentsApiRemoteDataSourceProvider =
    DocumentsApiRemoteDataSourceProvider._();

final class DocumentsApiRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          DocumentsApiRemoteDataSource,
          DocumentsApiRemoteDataSource,
          DocumentsApiRemoteDataSource
        >
    with $Provider<DocumentsApiRemoteDataSource> {
  const DocumentsApiRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsApiRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsApiRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<DocumentsApiRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentsApiRemoteDataSource create(Ref ref) {
    return documentsApiRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentsApiRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentsApiRemoteDataSource>(value),
    );
  }
}

String _$documentsApiRemoteDataSourceHash() =>
    r'4bc569954c7e10cd7ac7c74a83cf20829c96c0d6';

@ProviderFor(documentsRepositoryImpl)
const documentsRepositoryImplProvider = DocumentsRepositoryImplProvider._();

final class DocumentsRepositoryImplProvider
    extends
        $FunctionalProvider<
          DocumentsRepository,
          DocumentsRepository,
          DocumentsRepository
        >
    with $Provider<DocumentsRepository> {
  const DocumentsRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsRepositoryImplProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<DocumentsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentsRepository create(Ref ref) {
    return documentsRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentsRepository>(value),
    );
  }
}

String _$documentsRepositoryImplHash() =>
    r'f773a311399bbf10c1fceeb0504ec9490166d06b';
