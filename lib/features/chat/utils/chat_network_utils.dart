import 'dart:io';

import 'package:dio/dio.dart';

/// Detects network failures for offline chat mode.
abstract final class ChatNetworkUtils {
  ChatNetworkUtils._();

  static bool isOfflineError(Object error) {
    if (error is SocketException) {
      return true;
    }
    if (error is DioException) {
      return error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.error is SocketException;
    }
    return false;
  }
}
