/// Documents API failure with a stable [code] for l10n mapping (spec §4.2).
class DocumentException implements Exception {
  const DocumentException(this.code, {this.statusCode});

  final String code;
  final int? statusCode;

  @override
  String toString() => 'DocumentException($code)';
}
