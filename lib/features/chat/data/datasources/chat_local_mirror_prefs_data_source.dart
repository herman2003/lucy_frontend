import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/chat_local_mirror_keys.dart';

/// Persists chat mirror JSON via [SharedPreferences].
class ChatLocalMirrorPrefsDataSource {
  ChatLocalMirrorPrefsDataSource([Future<SharedPreferences>? prefs])
    : _prefsFuture = prefs ?? SharedPreferences.getInstance();

  final Future<SharedPreferences> _prefsFuture;

  Future<void> writeMirrorJson(String uid, Map<String, dynamic> json) async {
    final prefs = await _prefsFuture;
    await prefs.setString(
      ChatLocalMirrorKeys.mirrorForUid(uid),
      jsonEncode(json),
    );
  }

  Future<Map<String, dynamic>?> readMirrorJson(String uid) async {
    final prefs = await _prefsFuture;
    final raw = prefs.getString(ChatLocalMirrorKeys.mirrorForUid(uid));
    if (raw == null || raw.isEmpty) {
      return null;
    }
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return null;
    }
    return decoded;
  }

  Future<void> removeMirror(String uid) async {
    final prefs = await _prefsFuture;
    await prefs.remove(ChatLocalMirrorKeys.mirrorForUid(uid));
  }
}
