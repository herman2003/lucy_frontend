import '../../domain/entities/confirm_turn_result.dart';
import '../../domain/entities/finalize_onboarding_result.dart';
import '../../domain/entities/onboarding_analyze_result.dart';
import '../../domain/entities/validate_answer_result.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_analyze_remote_data_source.dart';
import '../datasources/onboarding_confirm_remote_data_source.dart';
import '../datasources/onboarding_finalize_remote_data_source.dart';
import '../datasources/onboarding_validate_remote_data_source.dart';
import '../mappers/analyze_mapper.dart';
import '../mappers/confirm_turn_mapper.dart';
import '../mappers/finalize_mapper.dart';
import '../mappers/validate_answer_mapper.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  OnboardingRepositoryImpl({
    required OnboardingValidateRemoteDataSource validateRemote,
    required OnboardingConfirmRemoteDataSource confirmRemote,
    required OnboardingAnalyzeRemoteDataSource analyzeRemote,
    required OnboardingFinalizeRemoteDataSource finalizeRemote,
  })  : _validateRemote = validateRemote,
        _confirmRemote = confirmRemote,
        _analyzeRemote = analyzeRemote,
        _finalizeRemote = finalizeRemote;

  final OnboardingValidateRemoteDataSource _validateRemote;
  final OnboardingConfirmRemoteDataSource _confirmRemote;
  final OnboardingAnalyzeRemoteDataSource _analyzeRemote;
  final OnboardingFinalizeRemoteDataSource _finalizeRemote;

  @override
  Future<ValidateAnswerResult> validateAnswer({
    required String locale,
    required String questionId,
    required String answerText,
    bool fallbackReduced = false,
  }) async {
    final json = await _validateRemote.validateAnswer(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
      fallbackReduced: fallbackReduced,
    );
    return ValidateAnswerMapper.fromJson(json);
  }

  @override
  Future<ConfirmTurnResult> confirmTurn({
    required String locale,
    required String questionId,
    required String answerText,
    String confirmationType = 'normal',
  }) async {
    final json = await _confirmRemote.confirmTurn(
      locale: locale,
      questionId: questionId,
      answerText: answerText,
      confirmationType: confirmationType,
    );
    return ConfirmTurnMapper.fromJson(json);
  }

  @override
  Future<OnboardingAnalyzeResult> analyze({required String locale}) async {
    final json = await _analyzeRemote.analyze(locale: locale);
    return AnalyzeMapper.fromJson(json);
  }

  @override
  Future<FinalizeOnboardingResult> finalizeOnboarding() async {
    final json = await _finalizeRemote.finalize();
    return FinalizeMapper.fromJson(json);
  }
}
