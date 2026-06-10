/// Limits and timings for the chat SharedPreferences mirror.
abstract final class ChatMirrorConstants {
  static const int maxMessagesPerThread = 100;
  static const Duration persistDebounce = Duration(milliseconds: 150);
}
