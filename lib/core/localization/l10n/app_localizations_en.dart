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
  String get quizPageTitle => 'Quiz & flashcards';

  @override
  String get quizPageSubtitle => 'Generated from your documents';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionAccount => 'Account';

  @override
  String get settingsSectionLearnerProfile => 'Learner profile';

  @override
  String get settingsSectionApplication => 'Application';

  @override
  String get settingsUiLocaleLabel => 'Interface language';

  @override
  String get settingsUiLocaleReadOnly =>
      'The interface language is fixed for now.';

  @override
  String get settingsLearnerProfileUnavailable => 'No learner profile on file.';

  @override
  String get settingsGenericError =>
      'Could not load settings. Please try again.';

  @override
  String get settingsErrorUnauthorized =>
      'Session expired. Please sign in again.';

  @override
  String get settingsThemeSituation => 'Your situation';

  @override
  String get settingsThemeGoals => 'Goals';

  @override
  String get settingsThemeLucyStyle => 'Lucy style';

  @override
  String get settingsLearnerDomainsHint => 'Select one or more domains.';

  @override
  String get settingsSaveChanges => 'Save';

  @override
  String get settingsProfileSaved => 'Profile updated';

  @override
  String get settingsProfileSaveFailed =>
      'Could not save profile. Please try again.';

  @override
  String get settingsProfileTitle => 'Profile';

  @override
  String get settingsHubSection => 'Menu';

  @override
  String get settingsProfileHubHint => 'Name, email, password';

  @override
  String get settingsAiConfigTitle => 'Lucy configuration';

  @override
  String get settingsAiConfigHubHint => 'AI profile, language';

  @override
  String get settingsAiConfigIntro =>
      'Customize how Lucy supports your learning.';

  @override
  String get settingsRemindersTitle => 'Reminders';

  @override
  String get settingsRemindersHubHint => 'Notifications and reviews';

  @override
  String get settingsRemindersIntro =>
      'Choose when and what Lucy should remind you to review.';

  @override
  String get settingsRemindersEnabledLabel => 'Enable reminders';

  @override
  String get settingsRemindersEnabledSubtitle =>
      'Sets up daily notifications on this device.';

  @override
  String get settingsRemindersTimeLabel => 'Reminder time';

  @override
  String get settingsRemindersFlashcardsLabel => 'Cards to review';

  @override
  String get settingsRemindersRevisionPlanLabel => 'Revision plan (J-N)';

  @override
  String get settingsRemindersWeakQuizLabel => 'Quizzes and weak points';

  @override
  String get settingsRemindersLoadError =>
      'Could not load reminder preferences.';

  @override
  String get settingsRemindersSaveError =>
      'Could not save reminder preferences.';

  @override
  String get settingsSectionLearning => 'Learning';

  @override
  String get settingsFirstNameLabel => 'First name';

  @override
  String get settingsLastNameLabel => 'Last name';

  @override
  String get settingsFirstNameRequired => 'First name is required.';

  @override
  String get settingsFieldMinTwoChars => 'At least 2 characters required.';

  @override
  String get settingsSecuritySection => 'Security';

  @override
  String get settingsChangePassword => 'Change password';

  @override
  String get settingsChangePasswordSubtitle =>
      'Enter your current password, then your new password.';

  @override
  String get settingsCurrentPassword => 'Current password';

  @override
  String get settingsNewPassword => 'New password';

  @override
  String get settingsConfirmNewPassword => 'Confirm password';

  @override
  String get settingsPasswordChanged => 'Password updated';

  @override
  String get settingsPasswordChangeFailed =>
      'Could not change password. Please try again.';

  @override
  String get settingsInvalidCurrentPassword => 'Current password is incorrect.';

  @override
  String get settingsPasswordMismatch => 'Passwords do not match.';

  @override
  String get settingsEmailReadOnly => 'Email cannot be changed here.';

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

  @override
  String get documentGenericError =>
      'Something went wrong with your documents. Please try again.';

  @override
  String get documentErrorValidation =>
      'Invalid request. Check the file and try again.';

  @override
  String get documentErrorUnauthorized =>
      'Your session has expired. Please sign in again.';

  @override
  String get documentErrorUploadNotReady =>
      'The file is not ready yet. Wait a moment and try again.';

  @override
  String get documentErrorUploadNetwork =>
      'Upload to storage failed (network or CORS). Check Firebase Storage CORS for web.';

  @override
  String get documentErrorProcessingNoDelete =>
      'Processing is in progress. You cannot delete this document yet.';

  @override
  String get documentErrorOneUploadAtATime =>
      'Another upload is already in progress. Wait until it finishes.';

  @override
  String get documentErrorSearchActiveLimit =>
      'You can activate at most 5 documents for search.';

  @override
  String get documentErrorTypeNotAllowed => 'This file type is not supported.';

  @override
  String get documentErrorTypeMismatch =>
      'The file content does not match the selected type.';

  @override
  String get documentErrorTooLarge => 'This file is too large (20 MB maximum).';

  @override
  String get documentErrorEmptyExtraction =>
      'Lucy could not extract enough text from this document.';

  @override
  String get documentErrorPasswordProtected =>
      'This PDF is password-protected. Remove the password and try again.';

  @override
  String get documentErrorOcrRequired =>
      'This document looks like a scan without readable text.';

  @override
  String get documentErrorNotFound => 'Document not found.';

  @override
  String get documentProcessingFailed =>
      'Document processing failed. You can try again.';

  @override
  String get documentErrorUploadAbandoned =>
      'Upload timed out. Delete the entry and try again.';

  @override
  String get documentErrorEmbeddingUnavailable =>
      'Indexing is temporarily unavailable. Try again later.';

  @override
  String get documentsAdd => 'Add';

  @override
  String get documentsAddTitle => 'Add a document';

  @override
  String get documentsEmpty =>
      'No documents yet. Add a PDF, Word, or text file to get started.';

  @override
  String documentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count documents',
      one: '$count document',
      zero: 'No documents',
    );
    return '$_temp0';
  }

  @override
  String get documentsProcessingHint =>
      'Lucy is processing your document. This may take a moment.';

  @override
  String get documentsPickFile => 'Choose a file';

  @override
  String get documentsPickFileRequired => 'Please choose a file to upload.';

  @override
  String get documentsFieldTitle => 'Title';

  @override
  String get documentsUpload => 'Upload';

  @override
  String get documentsDownload => 'Download';

  @override
  String get documentsDelete => 'Delete';

  @override
  String get documentsDialogCancel => 'Cancel';

  @override
  String get documentsDeleteConfirmTitle => 'Delete document?';

  @override
  String documentsDeleteConfirmMessage(String title) {
    return 'Delete \"$title\"? This cannot be undone.';
  }

  @override
  String get documentsStatusUploading => 'Uploading';

  @override
  String get documentsStatusProcessing => 'Processing';

  @override
  String get documentsStatusReady => 'Ready';

  @override
  String get documentsStatusFailed => 'Failed';

  @override
  String get chatDefaultTitle => 'New conversation';

  @override
  String get chatNewConversation => 'New conversation';

  @override
  String get chatConversationsTitle => 'Conversations';

  @override
  String get chatShowThreadList => 'Conversation list';

  @override
  String get chatSourcesTitle => 'Sources';

  @override
  String chatSourcePages(int pageStart, int pageEnd) {
    return 'Pages $pageStart–$pageEnd';
  }

  @override
  String get chatEmptyHint => 'Ask a question about your active documents.';

  @override
  String get chatEmptyDescription =>
      'Ask a question about your active documents and I\'ll answer with sources.';

  @override
  String chatGreeting(String name) {
    return 'Hello $name';
  }

  @override
  String get chatGreetingFallback => 'Hello';

  @override
  String get chatConversationSubtitle =>
      'Answers based on your active documents';

  @override
  String get chatConversationSubtitleMobile => 'Sourced answers';

  @override
  String get chatSourceLabel => 'Source';

  @override
  String chatActiveDocumentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active documents',
      one: '$count active document',
      zero: 'No active documents',
    );
    return '$_temp0';
  }

  @override
  String get chatSuggestionSummarize => 'Summarize my documents';

  @override
  String get chatSuggestionQuiz => 'Suggest a quiz';

  @override
  String get chatSuggestionFlashcards => 'Suggest flashcards';

  @override
  String get chatSuggestionRevisionPlan => 'Create a revision plan';

  @override
  String get chatSuggestionExplain => 'Explain a key concept';

  @override
  String get chatQuickChipYes => 'Yes';

  @override
  String get chatQuickChipYesMessage => 'yes';

  @override
  String get chatQuickChipCancel => 'Cancel';

  @override
  String get chatQuickChipCancelMessage => 'cancel';

  @override
  String get chatQuickChipAll => 'All';

  @override
  String get chatQuickChipAllMessage => 'all';

  @override
  String get chatQuickChipMostImportant => 'Most important';

  @override
  String get chatQuickChipMostImportantMessage => 'most important';

  @override
  String get chatQuickChipOtherProposal => 'Other suggestions';

  @override
  String get chatQuickChipOtherProposalMessage => 'other suggestions';

  @override
  String get chatQuickChipAsYouLike => 'As you like';

  @override
  String get chatQuickChipAsYouLikeMessage => 'as you like';

  @override
  String get chatQuickChipExportRevisionCalendar => 'Export calendar';

  @override
  String get chatRevisionCalendarExportFailed =>
      'Could not export the J-N revision calendar.';

  @override
  String get chatComposerHint => 'Ask a question about your active documents…';

  @override
  String get chatSend => 'Send';

  @override
  String get chatRetry => 'Retry';

  @override
  String get chatLoading => 'Loading…';

  @override
  String get chatOfflineBanner =>
      'Offline — showing cached data. Sending is disabled.';

  @override
  String get chatNoCorpusTitle => 'No active documents';

  @override
  String get chatNoCorpusMessage =>
      'Enable search on at least one ready document in the Documents tab.';

  @override
  String get chatNoCorpusCta => 'Go to documents';

  @override
  String get chatErrorNoActiveDocuments =>
      'Enable at least one document to chat with Lucy.';

  @override
  String get chatErrorLearnerProfileMissing =>
      'Complete onboarding to use chat.';

  @override
  String get chatErrorUnauthorized => 'Session expired. Please sign in again.';

  @override
  String get chatErrorNotFound => 'Conversation not found.';

  @override
  String get chatErrorInvalidMessage => 'Invalid message.';

  @override
  String get chatErrorLlmUnavailable =>
      'Lucy is temporarily unavailable. Try again later.';

  @override
  String get chatErrorServiceUnavailable =>
      'The service is temporarily unreachable. Check your connection and try again.';

  @override
  String get chatErrorInvalidResponse => 'Invalid server response. Try again.';

  @override
  String get chatErrorStreamInProgress => 'A reply is already being generated.';

  @override
  String get chatGenericError => 'Something went wrong. Please try again.';

  @override
  String get quizEmptyHint => 'Ask Lucy in chat to generate a quiz.';

  @override
  String get quizLibraryEmptyHint =>
      'Ask Lucy in chat to generate a quiz or flashcards.';

  @override
  String get quizLibraryEmptyActionsHint =>
      'Lucy will analyze your documents and guide you through the choices.';

  @override
  String get quizLibraryGenerateQuiz => 'Generate a quiz';

  @override
  String get quizLibraryGenerateFlashcards => 'Generate flashcards';

  @override
  String get quizLibraryHistoryTitle => 'History';

  @override
  String get quizLibraryTypeQuiz => 'Quiz';

  @override
  String get quizLibraryTypeFlashcards => 'Flashcards';

  @override
  String get quizLibraryStartQuiz => 'Start quiz';

  @override
  String get quizLibraryOpenFlashcards => 'Open flashcards';

  @override
  String quizLibraryFlashcardsMeta(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count flashcards',
      one: '$count flashcard',
    );
    return '$_temp0';
  }

  @override
  String get quizSessionFormatQcm => 'MCQ';

  @override
  String get quizLibraryOpen => 'Open';

  @override
  String get quizLibraryDateToday => 'Today';

  @override
  String get quizLibraryDateYesterday => 'Yesterday';

  @override
  String get quizLibraryDeleteConfirmTitle => 'Delete session?';

  @override
  String quizLibraryDeleteConfirmMessage(String title) {
    return 'Delete \"$title\"? This action cannot be undone.';
  }

  @override
  String get quizLibraryDeleteAction => 'Delete';

  @override
  String get quizLibraryDeleteCancel => 'Cancel';

  @override
  String quizLibraryLastAttemptMeta(int correct, int total, String date) {
    return '$correct/$total · $date';
  }

  @override
  String learningReminderFlashcardsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cards to review today',
      one: '$count card to review today',
    );
    return '$_temp0';
  }

  @override
  String learningReminderFlashcardsMessage(String sessionTitle) {
    return 'Pick up your $sessionTitle session.';
  }

  @override
  String learningReminderWeakQuizTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count missed questions',
      one: '$count missed question',
    );
    return '$_temp0';
  }

  @override
  String learningReminderWeakQuizMessage(
    String sessionTitle,
    int correct,
    int total,
  ) {
    return 'Last score on $sessionTitle: $correct/$total.';
  }

  @override
  String get quizComingSoon => 'Quiz generation is coming soon.';

  @override
  String quizSessionQuestionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions',
      one: '$count question',
    );
    return '$_temp0';
  }

  @override
  String quizSessionFlashcardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count flashcards',
      one: '$count flashcard',
    );
    return '$_temp0';
  }

  @override
  String get quizSessionPlaceholderMessage =>
      'This session will open here soon.';

  @override
  String get chatLearningSessionCardTitle => 'Quiz ready';

  @override
  String get chatLearningSessionFlashcardsCardTitle => 'Flashcards ready';

  @override
  String get chatLearningSessionQuizSubtitle =>
      'Review your courses with an interactive quiz.';

  @override
  String get chatLearningSessionFlashcardsSubtitle =>
      'Memorize key concepts in a flash.';

  @override
  String get chatLearningSessionStartQuiz => 'Start quiz';

  @override
  String get chatLearningSessionStartFlashcards => 'View flashcards';

  @override
  String get chatLearningSessionOpen => 'Open';

  @override
  String flashcardsSessionProgress(int current, int total) {
    return 'Card $current / $total';
  }

  @override
  String get flashcardsSessionFront => 'Front';

  @override
  String get flashcardsSessionBack => 'Back';

  @override
  String get flashcardsSessionTapToFlip => '↻ Tap to flip';

  @override
  String get flashcardsSessionPrevious => 'Previous';

  @override
  String get flashcardsSessionNext => 'Next';

  @override
  String get flashcardsSessionRatePrompt =>
      'How well did you remember this card?';

  @override
  String get flashcardsSessionRateAgain => 'Again';

  @override
  String get flashcardsSessionRateHard => 'Hard';

  @override
  String get flashcardsSessionRateGood => 'Good';

  @override
  String get flashcardsSessionRateEasy => 'Easy';

  @override
  String get flashcardsSessionCompleteTitle => 'Session complete';

  @override
  String get flashcardsSessionCompleteMessage =>
      'Come back when your cards are due again.';

  @override
  String quizSessionProgress(int current, int total) {
    return 'Question $current / $total';
  }

  @override
  String quizSessionProgressPercent(int percent) {
    return '$percent%';
  }

  @override
  String get quizSessionCorrect => 'Correct!';

  @override
  String get quizSessionIncorrect => 'Incorrect';

  @override
  String get quizSessionExplanationTitle => 'Explanation';

  @override
  String get quizSessionNextQuestion => 'Next question';

  @override
  String get quizSessionFinish => 'See score';

  @override
  String get quizSessionScoreTitle => 'Quiz complete!';

  @override
  String quizSessionScoreSubtitle(int correct, int total) {
    return 'You answered $correct out of $total questions correctly.';
  }

  @override
  String get quizSessionClose => 'Close';

  @override
  String get quizSessionRetry => 'Try again';

  @override
  String quizSessionScore(int correct, int total) {
    return 'Score: $correct / $total';
  }

  @override
  String get quizSessionWeakPointsTitle => 'Strengthen your weak points';

  @override
  String get quizSessionWeakPointsHint =>
      'Lucy can prepare flashcards on the questions you missed.';

  @override
  String get quizSessionWeakPointsCta => 'Flashcards on my mistakes';

  @override
  String quizSessionWeakPointsFlashcardsMessage(String topics) {
    return 'Make flashcards on the quiz questions I got wrong: $topics';
  }

  @override
  String get quizNoCorpusTitle => 'No active documents';

  @override
  String get quizNoCorpusMessage =>
      'Enable search on at least one ready document to generate a quiz.';

  @override
  String get quizNoCorpusCta => 'Go to documents';

  @override
  String get quizLoading => 'Loading…';

  @override
  String get quizGenericError => 'Something went wrong. Please try again.';

  @override
  String get learningSessionNotFound => 'This session could not be found.';

  @override
  String get learningSessionGenerationFailed =>
      'Generation failed. Try again from chat.';

  @override
  String get learningSessionValidationError =>
      'The generation request is invalid.';

  @override
  String get learningGenericError => 'Something went wrong. Please try again.';

  @override
  String get interfaceStyleSectionTitle => 'Interface style';

  @override
  String get interfaceStyleSectionHint => 'Changes Lucy\'s visual atmosphere';

  @override
  String get interfaceStyleAcademic => 'Academic';

  @override
  String get interfaceStyleAcademicDescription => 'Default';

  @override
  String get interfaceStylePremiumDark => 'Premium dark';

  @override
  String get interfaceStylePremiumDarkDescription => 'Cool glow';

  @override
  String get interfaceStyleMotivant => 'Motivating';

  @override
  String get interfaceStyleMotivantDescription => 'Warm accents';

  @override
  String get appearanceSectionTitle => 'Appearance';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get appearanceSystem => 'System';
}
