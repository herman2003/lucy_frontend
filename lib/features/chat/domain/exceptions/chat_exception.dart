/// Lucy chat API error (`error` field from Nest).
class ChatException implements Exception {
  const ChatException(this.code, {this.statusCode});

  final String code;
  final int? statusCode;

  @override
  String toString() => 'ChatException($code)';
}
