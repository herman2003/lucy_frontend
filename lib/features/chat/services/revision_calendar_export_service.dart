import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:share_plus/share_plus.dart';

import '../data/datasources/revision_calendar_remote_data_source.dart';

/// Shares a J-N revision calendar `.ics` file (LEARN-12a-V3).
class RevisionCalendarExportService {
  RevisionCalendarExportService({required RevisionCalendarRemoteDataSource remote})
    : _remote = remote;

  final RevisionCalendarRemoteDataSource _remote;

  Future<void> shareIcs({required String chatId}) async {
    final bytes = await _remote.downloadIcs(chatId);
    final file = XFile.fromData(
      Uint8List.fromList(bytes),
      mimeType: 'text/calendar',
      name: 'lucy-revision-calendar.ics',
    );
    await Share.shareXFiles([file]);
  }
}
