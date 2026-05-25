import '../../domain/entities/validate_answer_result.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_validate_remote_data_source.dart';
import '../mappers/validate_answer_mapper.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({
    required OnboardingValidateRemoteDataSource validateRemote,
  }) : _validateRemote = validateRemote;

  final OnboardingValidateRemoteDataSource _validateRemote;

  @override
  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
  }) async {
    final json = await _validateRemote.validateAnswer(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
    );
    return ValidateAnswerMapper.fromJson(json);
  }
}
