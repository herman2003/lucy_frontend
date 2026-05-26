// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DocumentsNotifier)
const documentsProvider = DocumentsNotifierProvider._();

final class DocumentsNotifierProvider
    extends $NotifierProvider<DocumentsNotifier, DocumentsState> {
  const DocumentsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsNotifierHash();

  @$internal
  @override
  DocumentsNotifier create() => DocumentsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentsState>(value),
    );
  }
}

String _$documentsNotifierHash() => r'4576ed13fe7cbe3a73068f58cc7f518c8ee11d8a';

abstract class _$DocumentsNotifier extends $Notifier<DocumentsState> {
  DocumentsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DocumentsState, DocumentsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DocumentsState, DocumentsState>,
              DocumentsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
