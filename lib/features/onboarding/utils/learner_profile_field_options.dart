/// Allowed learner profile enum values (aligned with Nest SPEC §4.4.1).
abstract final class LearnerProfileFieldOptions {
  static const primaryRoles = [
    'student',
    'professional',
    'educator',
    'self_learner',
    'other',
  ];

  static const mainDomains = [
    'sciences',
    'law',
    'medicine',
    'languages',
    'business',
    'cs',
    'other',
  ];

  static const learningGoals = [
    'exam',
    'understand_course',
    'quick_review',
    'professional',
    'certification',
    'other',
  ];

  static const selfAssessedLevels = [
    'beginner',
    'intermediate',
    'advanced',
    'variable',
  ];

  static const explanationStyles = [
    'step_by_step',
    'summary_first',
    'analogies',
    'socratic',
  ];

  static const feedbackTones = ['encouraging', 'neutral', 'strict'];

  static const tutoringLanguages = ['fr', 'en', 'de', 'match_document'];
}
