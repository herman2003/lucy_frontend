import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../data/datasources/revision_calendar_remote_data_source.dart';
import '../../services/revision_calendar_export_service.dart';

part 'revision_calendar_export_provider.g.dart';

@Riverpod(keepAlive: true)
RevisionCalendarRemoteDataSource revisionCalendarRemoteDataSource(Ref ref) {
  return RevisionCalendarRemoteDataSource(
    ref.watch(lucyDioClientProvider).dio,
  );
}

@Riverpod(keepAlive: true)
RevisionCalendarExportService revisionCalendarExportService(Ref ref) {
  return RevisionCalendarExportService(
    remote: ref.watch(revisionCalendarRemoteDataSourceProvider),
  );
}
