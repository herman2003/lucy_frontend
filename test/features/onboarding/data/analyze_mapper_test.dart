import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/onboarding/data/mappers/analyze_mapper.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_analyze_result.dart';

void main() {
  test('fromJson maps standard analyze success', () {
    final result = AnalyzeMapper.fromJson({
      'learnerProfile': {
        'primary_role': 'student',
        'main_domains': ['sciences'],
        'learning_goal': 'exam',
        'self_assessed_level': 'intermediate',
        'explanation_style': 'step_by_step',
        'feedback_tone': 'encouraging',
        'tutoring_language': 'fr',
      },
      'summaryForUser': 'Résumé utilisateur.',
    });

    expect(result, isA<OnboardingAnalyzeSuccess>());
    final success = result as OnboardingAnalyzeSuccess;
    expect(success.summaryForUser, 'Résumé utilisateur.');
  });

  test('fromJson maps analyze fallback profile summary', () {
    final result = AnalyzeMapper.fromJson({
      'fallbackProfileSummary': 'Profil simplifié pour toi.',
      'requiresUserConfirmation': true,
    });

    expect(result, isA<OnboardingAnalyzeFallback>());
    expect(
      (result as OnboardingAnalyzeFallback).fallbackProfileSummary,
      'Profil simplifié pour toi.',
    );
  });
}
