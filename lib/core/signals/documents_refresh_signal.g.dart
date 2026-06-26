// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_refresh_signal.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bumps when the documents library should reload (tab focus).

@ProviderFor(DocumentsRefreshSignal)
const documentsRefreshSignalProvider = DocumentsRefreshSignalProvider._();

/// Bumps when the documents library should reload (tab focus).
final class DocumentsRefreshSignalProvider
    extends $NotifierProvider<DocumentsRefreshSignal, int> {
  /// Bumps when the documents library should reload (tab focus).
  const DocumentsRefreshSignalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsRefreshSignalProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsRefreshSignalHash();

  @$internal
  @override
  DocumentsRefreshSignal create() => DocumentsRefreshSignal();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$documentsRefreshSignalHash() =>
    r'bccfd27a6ea8dcb5b30172f35731fa6f19b23a10';

/// Bumps when the documents library should reload (tab focus).

abstract class _$DocumentsRefreshSignal extends $Notifier<int> {
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
