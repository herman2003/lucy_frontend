/// SharedPreferences keys for the chat local mirror (spec §3.4).
abstract final class ChatLocalMirrorKeys {
  static String mirrorForUid(String uid) => 'lucy_chat_mirror_$uid';
}
