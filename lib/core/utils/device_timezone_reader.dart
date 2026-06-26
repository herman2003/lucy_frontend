import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';

/// Resolves the device IANA timezone id, with safe fallbacks on web.
Future<String> readDeviceTimezoneIdentifier() async {
  if (kIsWeb) {
    return _webTimezoneFallback();
  }

  try {
    final info = await FlutterTimezone.getLocalTimezone();
    return info.identifier;
  } catch (_) {
    return 'UTC';
  }
}

/// Offset-based fallback when [FlutterTimezone] is unavailable (web).
String _webTimezoneFallback() {
  final offsetHours = DateTime.now().timeZoneOffset.inHours;
  if (offsetHours == 0) {
    return 'UTC';
  }
  if (offsetHours > 0) {
    return 'Etc/GMT-$offsetHours';
  }
  return 'Etc/GMT+${-offsetHours}';
}
