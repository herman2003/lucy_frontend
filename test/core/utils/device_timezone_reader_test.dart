import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/utils/device_timezone_reader.dart';

void main() {
  test(
    'readDeviceTimezoneIdentifier returns a non-empty timezone id',
    () async {
      final timezone = await readDeviceTimezoneIdentifier();

      expect(timezone, isNotEmpty);
    },
  );
}
