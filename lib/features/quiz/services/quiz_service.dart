import '../domain/entities/quiz_eligibility.dart';
import '../domain/repositories/quiz_repository.dart';

class QuizService {
  QuizService({required QuizRepository repository}) : _repository = repository;

  final QuizRepository _repository;

  Future<QuizEligibility> getEligibility() => _repository.getEligibility();
}
