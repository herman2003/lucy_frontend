// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_calendar_export_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(revisionCalendarRemoteDataSource)
const revisionCalendarRemoteDataSourceProvider =
    RevisionCalendarRemoteDataSourceProvider._();

final class RevisionCalendarRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RevisionCalendarRemoteDataSource,
          RevisionCalendarRemoteDataSource,
          RevisionCalendarRemoteDataSource
        >
    with $Provider<RevisionCalendarRemoteDataSource> {
  const RevisionCalendarRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revisionCalendarRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revisionCalendarRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RevisionCalendarRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RevisionCalendarRemoteDataSource create(Ref ref) {
    return revisionCalendarRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevisionCalendarRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RevisionCalendarRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$revisionCalendarRemoteDataSourceHash() =>
    r'eb703def51a5312ad69278aeb291da6438f515e0';

@ProviderFor(revisionCalendarExportService)
const revisionCalendarExportServiceProvider =
    RevisionCalendarExportServiceProvider._();

final class RevisionCalendarExportServiceProvider
    extends
        $FunctionalProvider<
          RevisionCalendarExportService,
          RevisionCalendarExportService,
          RevisionCalendarExportService
        >
    with $Provider<RevisionCalendarExportService> {
  const RevisionCalendarExportServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revisionCalendarExportServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revisionCalendarExportServiceHash();

  @$internal
  @override
  $ProviderElement<RevisionCalendarExportService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RevisionCalendarExportService create(Ref ref) {
    return revisionCalendarExportService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RevisionCalendarExportService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RevisionCalendarExportService>(
        value,
      ),
    );
  }
}

String _$revisionCalendarExportServiceHash() =>
    r'73573db57426bdf335fa359176ba729adb6b193f';
