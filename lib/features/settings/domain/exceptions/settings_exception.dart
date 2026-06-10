/// Lucy settings API error (`error` field from Nest).
class SettingsException implements Exception {
  const SettingsException(this.code, {this.statusCode});

  final String code;
  final int? statusCode;
}
