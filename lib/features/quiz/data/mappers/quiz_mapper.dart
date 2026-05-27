import '../../domain/entities/quiz_eligibility.dart';
import '../models/quiz_eligibility_model.dart';

abstract final class QuizMapper {
  QuizMapper._();

  static QuizEligibility eligibilityFromJson(Map<String, dynamic> json) =>
      eligibilityFromModel(QuizEligibilityModel.fromJson(json));

  static QuizEligibility eligibilityFromModel(QuizEligibilityModel model) =>
      QuizEligibility(
        canQuiz: model.canQuiz,
        activeDocumentCount: model.activeDocumentCount,
      );
}
