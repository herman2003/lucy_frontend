import 'package:shared_preferences/shared_preferences.dart';

import 'lucy_interface_style.dart';

/// Persists the selected [LucyInterfaceStyle] across app restarts.
abstract final class LucyInterfaceStyleStorage {
  static const prefsKey = 'lucy_interface_style';

  static Future<LucyInterfaceStyle?> read() async {
    final prefs = await SharedPreferences.getInstance();
    return lucyInterfaceStyleFromStorage(prefs.getString(prefsKey));
  }

  static Future<void> write(LucyInterfaceStyle style) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefsKey, style.storageValue);
  }
}
