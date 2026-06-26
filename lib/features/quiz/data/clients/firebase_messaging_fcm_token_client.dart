import 'package:firebase_messaging/firebase_messaging.dart';

import 'fcm_token_client.dart';

/// Firebase Cloud Messaging token client (LEARN-12a-V2).
class FirebaseMessagingFcmTokenClient implements FcmTokenClient {
  FirebaseMessagingFcmTokenClient({FirebaseMessaging? messaging})
    : _messaging = messaging ?? FirebaseMessaging.instance;

  final FirebaseMessaging _messaging;

  @override
  Future<String?> requestToken() async {
    final settings = await _messaging.requestPermission();
    final authorized =
        settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
    if (!authorized) {
      return null;
    }
    return _messaging.getToken();
  }
}
