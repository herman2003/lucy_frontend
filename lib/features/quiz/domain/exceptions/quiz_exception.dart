class QuizException implements Exception {
  const QuizException(this.code, {this.statusCode});

  final String code;
  final int? statusCode;
}
