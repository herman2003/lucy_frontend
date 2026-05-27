import '../../domain/entities/quiz_eligibility.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_api_remote_data_source.dart';
import '../mappers/quiz_mapper.dart';

class QuizRepositoryImpl implements QuizRepository {
  QuizRepositoryImpl(this._remote);

  final QuizApiRemoteDataSource _remote;

  @override
  Future<QuizEligibility> getEligibility() async {
    final model = await _remote.getEligibility();
    return QuizMapper.eligibilityFromModel(model);
  }
}
