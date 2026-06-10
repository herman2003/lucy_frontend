class LearningSessionException implements Exception {
  const LearningSessionException(this.code, {this.statusCode});

  final String code;
  final int? statusCode;
}
