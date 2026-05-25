// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Lucy';

  @override
  String get splashLoading => 'Wird geladen…';

  @override
  String get authLoginBrandingTitle => 'Ihr persönlicher KI-Tutor';

  @override
  String get authLoginBrandingSubtitle =>
      'Lernen Sie in Ihrem Tempo mit individueller Begleitung.';

  @override
  String get authLoginTitle => 'Anmelden';

  @override
  String get authEmailLabel => 'E-Mail';

  @override
  String get authEmailHint => 'sie@beispiel.de';

  @override
  String get authPasswordLabel => 'Passwort';

  @override
  String get authPasswordHint => 'Passwort eingeben';

  @override
  String get authEmailRequired => 'E-Mail ist erforderlich.';

  @override
  String get authPasswordRequired => 'Passwort ist erforderlich.';

  @override
  String get authLoginButton => 'Anmelden';

  @override
  String get authForgotPasswordPrompt => 'Passwort vergessen?';

  @override
  String get authForgotPasswordLink => 'Zurücksetzen';

  @override
  String get authNoAccountPrompt => 'Noch kein Konto?';

  @override
  String get authSignUpLink => 'Konto erstellen';

  @override
  String get authSignUpBrandingTitle => 'Lucy beitreten';

  @override
  String get authSignUpBrandingSubtitle =>
      'Erstellen Sie Ihr Konto und lernen Sie mit Ihrem KI-Tutor.';

  @override
  String get authSignUpTitle => 'Konto erstellen';

  @override
  String get authFullNameLabel => 'Vollständiger Name';

  @override
  String get authFullNameHint => 'Ihr Name';

  @override
  String get authFullNameRequired => 'Der vollständige Name ist erforderlich.';

  @override
  String get authSignUpButton => 'Konto erstellen';

  @override
  String get authAlreadyHaveAccountPrompt => 'Bereits ein Konto?';

  @override
  String get authLoginLink => 'Anmelden';

  @override
  String get authResetBrandingTitle => 'Passwort zurücksetzen';

  @override
  String get authResetBrandingSubtitle =>
      'Erhalten Sie einen sicheren Link per E-Mail für ein neues Passwort.';

  @override
  String get authResetTitle => 'Passwort vergessen';

  @override
  String get authResetSubtitle =>
      'Geben Sie Ihre E-Mail-Adresse ein, um einen Reset-Link zu erhalten.';

  @override
  String get authResetButton => 'Link senden';

  @override
  String get authResetSuccessTitle => 'E-Mail prüfen';

  @override
  String authResetSuccessMessage(String email) {
    return 'Wenn ein Konto für $email existiert, erhalten Sie eine E-Mail zum Zurücksetzen des Passworts.';
  }

  @override
  String get authResetTryAgain => 'Erneut versuchen';

  @override
  String get authResetBackToLogin => 'Zurück zur Anmeldung';

  @override
  String get homeWelcome => 'Willkommen bei Lucy';

  @override
  String get homeLogout => 'Abmelden';

  @override
  String get authUnknownError =>
      'Etwas ist schiefgelaufen. Bitte erneut versuchen.';

  @override
  String get authUserNotFound => 'Kein Konto mit dieser E-Mail gefunden.';

  @override
  String get authWrongPassword => 'Falsches Passwort.';

  @override
  String get authInvalidCredentials => 'E-Mail oder Passwort ist falsch.';

  @override
  String get authEmailAlreadyInUse => 'Diese E-Mail wird bereits verwendet.';

  @override
  String get authWeakPassword => 'Das Passwort ist zu schwach.';

  @override
  String get authInvalidEmail => 'Ungültige E-Mail-Adresse.';

  @override
  String get authNetworkError => 'Verbindungsproblem. Prüfen Sie Ihr Netzwerk.';

  @override
  String get authTooManyRequests =>
      'Zu viele Versuche. Später erneut versuchen.';

  @override
  String get authUserDisabled => 'Dieses Konto wurde deaktiviert.';

  @override
  String get authOperationNotAllowed => 'Diese Aktion ist nicht erlaubt.';

  @override
  String get authProfileWriteFailed =>
      'Profil konnte nicht gespeichert werden. Bitte erneut versuchen.';

  @override
  String get onboardingPlaceholderTitle => 'Einrichtung Ihres Lernprofils';

  @override
  String get onboardingQuestionQRole =>
      'Erzählen Sie mir von Ihrer Situation: Studium, Berufswechsel oder selbstständiges Lernen?';

  @override
  String get onboardingQuestionQDomains =>
      'Welche Fächer oder Bereiche möchten Sie mit mir bearbeiten?';

  @override
  String get onboardingQuestionQGoal => 'Was ist Ihr Hauptziel mit mir?';

  @override
  String get onboardingQuestionQLevel =>
      'Wie würden Sie Ihr aktuelles Niveau beschreiben?';

  @override
  String get onboardingQuestionQStyle =>
      'Wie sollen Ihnen Inhalte am besten erklärt werden?';

  @override
  String get onboardingQuestionQTone =>
      'Welchen Ton bevorzugen Sie bei Korrekturen und Feedback?';

  @override
  String get onboardingQuestionQLanguage =>
      'In welcher Sprache soll ich Ihnen den Unterricht erklären?';

  @override
  String get onboardingSendAnswer => 'Senden';

  @override
  String onboardingStepProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get onboardingStepLocked =>
      'Schließe zuerst den aktuellen Schritt ab.';

  @override
  String get onboardingLucyTyping => 'Lucy schreibt…';

  @override
  String get onboardingStepReadOnly => 'Schritt abgeschlossen — nur Ansicht.';

  @override
  String get onboardingConfirmTurn => 'Passt';

  @override
  String get onboardingRejectTurn => 'Das stimmt nicht';

  @override
  String get onboardingGenericError =>
      'Ein Fehler ist aufgetreten. Bitte erneut versuchen.';

  @override
  String get onboardingErrorUnauthorized =>
      'Ihre Sitzung ist abgelaufen. Bitte melden Sie sich erneut an.';

  @override
  String get onboardingErrorValidation =>
      'Ungültige Anfrage. Bitte erneut versuchen.';

  @override
  String get onboardingErrorAlreadyComplete =>
      'Ihr Profil ist bereits eingerichtet.';

  @override
  String get onboardingErrorTranscriptIncomplete =>
      'Beantworten Sie alle 7 Fragen, bevor Sie die Analyse starten.';

  @override
  String get onboardingErrorProfileIncomplete =>
      'Das erzeugte Profil ist unvollständig. Versuchen Sie es erneut oder passen Sie Ihre Antworten an.';

  @override
  String get onboardingErrorPendingProfileMissing =>
      'Kein Profil wartet auf Bestätigung. Starten Sie die Analyse erneut.';

  @override
  String get onboardingErrorLlmInvalid =>
      'Lucy konnte die Antwort nicht verarbeiten. Bitte gleich erneut versuchen.';

  @override
  String get onboardingErrorLlmUnavailable =>
      'Lucy ist vorübergehend nicht verfügbar. Bitte später erneut versuchen.';

  @override
  String get onboardingErrorInternal =>
      'Ein Fehler ist aufgetreten. Bitte erneut versuchen.';

  @override
  String get onboardingAnswerRequired =>
      'Bitte geben Sie zuerst eine Antwort ein.';

  @override
  String get onboardingAnswerTooLong =>
      'Ihre Antwort ist zu lang (max. 2000 Zeichen).';

  @override
  String get onboardingAnswerHint => 'Ihre Antwort…';

  @override
  String get onboardingAnalysisReadyHint =>
      'Analyse abgeschlossen. Der Bestätigungsbildschirm folgt in Kürze.';

  @override
  String get onboardingConfirmTitle => 'Ihr Lernprofil';

  @override
  String get onboardingConfirmSummaryHeading => 'Was Lucy verstanden hat';

  @override
  String get onboardingConfirmAccept => 'Bestätigen und weiter';

  @override
  String get onboardingConfirmEdit => 'Antworten bearbeiten';

  @override
  String get onboardingConfirmMissingAnalysis =>
      'Keine Analyse verfügbar. Bitte zuerst den Fragebogen abschließen.';

  @override
  String get onboardingProfileLabelPrimaryRole => 'Situation';

  @override
  String get onboardingProfileLabelMainDomains => 'Fachgebiete';

  @override
  String get onboardingProfileLabelLearningGoal => 'Ziel';

  @override
  String get onboardingProfileLabelSelfAssessedLevel => 'Niveau';

  @override
  String get onboardingProfileLabelExplanationStyle => 'Erklärungsstil';

  @override
  String get onboardingProfileLabelFeedbackTone => 'Feedback-Ton';

  @override
  String get onboardingProfileLabelTutoringLanguage => 'Erklärungssprache';

  @override
  String get onboardingEnumPrimaryRoleStudent => 'Studierende';

  @override
  String get onboardingEnumPrimaryRoleProfessional => 'Berufstätige';

  @override
  String get onboardingEnumPrimaryRoleEducator => 'Lehrende';

  @override
  String get onboardingEnumPrimaryRoleSelfLearner => 'Selbstlerner';

  @override
  String get onboardingEnumPrimaryRoleOther => 'Sonstiges';

  @override
  String get onboardingEnumDomainSciences => 'Naturwissenschaften';

  @override
  String get onboardingEnumDomainLaw => 'Recht';

  @override
  String get onboardingEnumDomainMedicine => 'Medizin';

  @override
  String get onboardingEnumDomainLanguages => 'Sprachen';

  @override
  String get onboardingEnumDomainBusiness => 'Wirtschaft';

  @override
  String get onboardingEnumDomainCs => 'Informatik';

  @override
  String get onboardingEnumDomainOther => 'Sonstiges';

  @override
  String get onboardingEnumLearningGoalExam => 'Prüfungsvorbereitung';

  @override
  String get onboardingEnumLearningGoalUnderstandCourse =>
      'Kurs besser verstehen';

  @override
  String get onboardingEnumLearningGoalQuickReview => 'Schnelle Wiederholung';

  @override
  String get onboardingEnumLearningGoalProfessional =>
      'Berufliche Weiterbildung';

  @override
  String get onboardingEnumLearningGoalCertification => 'Zertifizierung';

  @override
  String get onboardingEnumLearningGoalOther => 'Sonstiges';

  @override
  String get onboardingEnumLevelBeginner => 'Anfänger';

  @override
  String get onboardingEnumLevelIntermediate => 'Mittelstufe';

  @override
  String get onboardingEnumLevelAdvanced => 'Fortgeschritten';

  @override
  String get onboardingEnumLevelVariable => 'Je nach Thema unterschiedlich';

  @override
  String get onboardingEnumStyleStepByStep => 'Schritt für Schritt';

  @override
  String get onboardingEnumStyleSummaryFirst => 'Zuerst Zusammenfassung';

  @override
  String get onboardingEnumStyleAnalogies => 'Analogien';

  @override
  String get onboardingEnumStyleSocratic => 'Geführte Fragen';

  @override
  String get onboardingEnumToneEncouraging => 'Ermutigend';

  @override
  String get onboardingEnumToneNeutral => 'Neutral';

  @override
  String get onboardingEnumToneStrict => 'Streng';

  @override
  String get onboardingEnumTutoringLangFr => 'Französisch';

  @override
  String get onboardingEnumTutoringLangEn => 'Englisch';

  @override
  String get onboardingEnumTutoringLangDe => 'Deutsch';

  @override
  String get onboardingEnumTutoringLangMatchDocument => 'Sprache des Dokuments';
}
