/// Retrieves the device FCM token for server push reminders (LEARN-12a-V2).
abstract class FcmTokenClient {
  Future<String?> requestToken();
}
