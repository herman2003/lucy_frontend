// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Lucy';

  @override
  String get splashLoading => 'Loading…';

  @override
  String get authLoginBrandingTitle => 'Your personal AI tutor';

  @override
  String get authLoginBrandingSubtitle =>
      'Learn at your own pace with tailored guidance.';

  @override
  String get authLoginTitle => 'Log in';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'you@example.com';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordHint => 'Enter your password';

  @override
  String get authEmailRequired => 'Email is required.';

  @override
  String get authPasswordRequired => 'Password is required.';

  @override
  String get authLoginButton => 'Log in';

  @override
  String get authForgotPasswordPrompt => 'Forgot password?';

  @override
  String get authForgotPasswordLink => 'Reset';

  @override
  String get authNoAccountPrompt => 'Don\'t have an account?';

  @override
  String get authSignUpLink => 'Sign up';

  @override
  String get authSignUpBrandingTitle => 'Join Lucy';

  @override
  String get authSignUpBrandingSubtitle =>
      'Create your account and start learning with your AI tutor.';

  @override
  String get authSignUpTitle => 'Create account';

  @override
  String get authFullNameLabel => 'Full name';

  @override
  String get authFullNameHint => 'Your name';

  @override
  String get authFullNameRequired => 'Full name is required.';

  @override
  String get authSignUpButton => 'Create account';

  @override
  String get authAlreadyHaveAccountPrompt => 'Already have an account?';

  @override
  String get authLoginLink => 'Log in';

  @override
  String get authResetBrandingTitle => 'Reset your password';

  @override
  String get authResetBrandingSubtitle =>
      'Get a secure email link to choose a new password.';

  @override
  String get authResetTitle => 'Forgot password';

  @override
  String get authResetSubtitle =>
      'Enter your email address to receive a reset link.';

  @override
  String get authResetButton => 'Send reset link';

  @override
  String get authResetSuccessTitle => 'Check your email';

  @override
  String authResetSuccessMessage(String email) {
    return 'If an account exists for $email, you will receive an email to reset your password.';
  }

  @override
  String get authResetTryAgain => 'Try again';

  @override
  String get authResetBackToLogin => 'Back to log in';

  @override
  String get homeWelcome => 'Welcome to Lucy';

  @override
  String get homeLogout => 'Log out';

  @override
  String get pageUnderDevelopment => 'Under development';

  @override
  String get navDocuments => 'Documents';

  @override
  String get navChat => 'Chat';

  @override
  String get navQuiz => 'Quiz';

  @override
  String get navSettings => 'Settings';

  @override
  String get documentsTitle => 'Documents';

  @override
  String get chatTitle => 'Chat';

  @override
  String get quizTitle => 'Quiz';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get shellMenu => 'Menu';

  @override
  String get authUnknownError => 'Something went wrong. Please try again.';

  @override
  String get authUserNotFound => 'No account matches this email.';

  @override
  String get authWrongPassword => 'Incorrect password.';

  @override
  String get authInvalidCredentials => 'Incorrect email or password.';

  @override
  String get authEmailAlreadyInUse => 'This email is already in use.';

  @override
  String get authWeakPassword => 'Password is too weak.';

  @override
  String get authInvalidEmail => 'Invalid email address.';

  @override
  String get authNetworkError => 'Connection problem. Check your network.';

  @override
  String get authTooManyRequests => 'Too many attempts. Try again later.';

  @override
  String get authUserDisabled => 'This account has been disabled.';

  @override
  String get authOperationNotAllowed => 'This operation is not allowed.';

  @override
  String get authProfileWriteFailed =>
      'Could not save your profile. Please try again.';

  @override
  String get authUserProfileConflict =>
      'This email is already linked to another profile.';

  @override
  String get onboardingPlaceholderTitle => 'Set up your learner profile';

  @override
  String get onboardingQuestionQRole =>
      'Tell me about your situation: are you a student, changing careers, or learning on your own?';

  @override
  String get onboardingQuestionQDomains =>
      'Which subjects or areas will you work on with me?';

  @override
  String get onboardingQuestionQGoal => 'What is your main goal with me?';

  @override
  String get onboardingQuestionQLevel =>
      'How would you describe your level today?';

  @override
  String get onboardingQuestionQStyle =>
      'How do you like concepts explained to you?';

  @override
  String get onboardingQuestionQTone =>
      'What tone do you prefer for corrections and feedback?';

  @override
  String get onboardingQuestionQLanguage =>
      'Which language should I use to explain lessons to you?';

  @override
  String get onboardingSendAnswer => 'Send';

  @override
  String onboardingStepProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get onboardingStepLocked =>
      'Finish the current step before continuing.';

  @override
  String get onboardingLucyTyping => 'Lucy is typing…';

  @override
  String get onboardingStepReadOnly => 'Step completed — read only.';

  @override
  String get onboardingStepEdit => 'Edit this step';

  @override
  String get onboardingRegenerateProfile => 'Regenerate profile';

  @override
  String get onboardingConfirmTurn => 'Looks good';

  @override
  String get onboardingRejectTurn => 'That’s not right';

  @override
  String get onboardingGenericError =>
      'Something went wrong. Please try again.';

  @override
  String get onboardingErrorUnauthorized =>
      'Your session has expired. Please sign in again.';

  @override
  String get onboardingErrorValidation => 'Invalid request. Please try again.';

  @override
  String get onboardingErrorAlreadyComplete =>
      'Your profile is already set up.';

  @override
  String get onboardingErrorTranscriptIncomplete =>
      'Complete all 7 questions before running analysis.';

  @override
  String get onboardingErrorProfileIncomplete =>
      'The generated profile is incomplete. Try again or edit your answers.';

  @override
  String get onboardingErrorPendingProfileMissing =>
      'No profile is waiting for confirmation. Run analysis again.';

  @override
  String get onboardingErrorLlmInvalid =>
      'Lucy could not interpret the response. Try again shortly.';

  @override
  String get onboardingErrorLlmUnavailable =>
      'Lucy is temporarily unavailable. Please try again later.';

  @override
  String get onboardingErrorInternal =>
      'Something went wrong. Please try again.';

  @override
  String get onboardingAnswerRequired =>
      'Please enter an answer before sending.';

  @override
  String get onboardingAnswerTooLong =>
      'Your answer is too long (2000 characters max).';

  @override
  String get onboardingAnswerHint => 'Your answer…';

  @override
  String get onboardingAnalysisReadyHint =>
      'Analysis complete. The confirmation screen is coming next.';

  @override
  String get onboardingConfirmTitle => 'Your learner profile';

  @override
  String get onboardingConfirmSummaryHeading => 'What Lucy understood';

  @override
  String get onboardingConfirmAccept => 'Confirm and continue';

  @override
  String get onboardingConfirmEdit => 'Edit my answers';

  @override
  String get onboardingConfirmMissingAnalysis =>
      'No analysis yet. Complete the questionnaire first.';

  @override
  String get onboardingProfileLabelPrimaryRole => 'Situation';

  @override
  String get onboardingProfileLabelMainDomains => 'Subjects';

  @override
  String get onboardingProfileLabelLearningGoal => 'Goal';

  @override
  String get onboardingProfileLabelSelfAssessedLevel => 'Level';

  @override
  String get onboardingProfileLabelExplanationStyle => 'Explanation style';

  @override
  String get onboardingProfileLabelFeedbackTone => 'Feedback tone';

  @override
  String get onboardingProfileLabelTutoringLanguage => 'Tutoring language';

  @override
  String get onboardingEnumPrimaryRoleStudent => 'Student';

  @override
  String get onboardingEnumPrimaryRoleProfessional => 'Professional';

  @override
  String get onboardingEnumPrimaryRoleEducator => 'Educator';

  @override
  String get onboardingEnumPrimaryRoleSelfLearner => 'Self-learner';

  @override
  String get onboardingEnumPrimaryRoleOther => 'Other';

  @override
  String get onboardingEnumDomainSciences => 'Sciences';

  @override
  String get onboardingEnumDomainLaw => 'Law';

  @override
  String get onboardingEnumDomainMedicine => 'Medicine';

  @override
  String get onboardingEnumDomainLanguages => 'Languages';

  @override
  String get onboardingEnumDomainBusiness => 'Business';

  @override
  String get onboardingEnumDomainCs => 'Computer science';

  @override
  String get onboardingEnumDomainOther => 'Other';

  @override
  String get onboardingEnumLearningGoalExam => 'Exam preparation';

  @override
  String get onboardingEnumLearningGoalUnderstandCourse =>
      'Understand a course better';

  @override
  String get onboardingEnumLearningGoalQuickReview => 'Quick review';

  @override
  String get onboardingEnumLearningGoalProfessional =>
      'Professional upskilling';

  @override
  String get onboardingEnumLearningGoalCertification => 'Certification';

  @override
  String get onboardingEnumLearningGoalOther => 'Other';

  @override
  String get onboardingEnumLevelBeginner => 'Beginner';

  @override
  String get onboardingEnumLevelIntermediate => 'Intermediate';

  @override
  String get onboardingEnumLevelAdvanced => 'Advanced';

  @override
  String get onboardingEnumLevelVariable => 'Varies by topic';

  @override
  String get onboardingEnumStyleStepByStep => 'Step by step';

  @override
  String get onboardingEnumStyleSummaryFirst => 'Summary first';

  @override
  String get onboardingEnumStyleAnalogies => 'Analogies';

  @override
  String get onboardingEnumStyleSocratic => 'Guided questions';

  @override
  String get onboardingEnumToneEncouraging => 'Encouraging';

  @override
  String get onboardingEnumToneNeutral => 'Neutral';

  @override
  String get onboardingEnumToneStrict => 'Strict';

  @override
  String get onboardingEnumTutoringLangFr => 'French';

  @override
  String get onboardingEnumTutoringLangEn => 'English';

  @override
  String get onboardingEnumTutoringLangDe => 'German';

  @override
  String get onboardingEnumTutoringLangMatchDocument =>
      'Match document language';
}
