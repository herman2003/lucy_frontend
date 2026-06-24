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
  String get pageUnderDevelopment => 'In Entwicklung';

  @override
  String get navDocuments => 'Dokumente';

  @override
  String get navChat => 'Chat';

  @override
  String get navQuiz => 'Quiz';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get documentsTitle => 'Dokumente';

  @override
  String get chatTitle => 'Chat';

  @override
  String get quizTitle => 'Quiz';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get settingsSectionAccount => 'Konto';

  @override
  String get settingsSectionLearnerProfile => 'Lernprofil';

  @override
  String get settingsSectionApplication => 'Anwendung';

  @override
  String get settingsUiLocaleLabel => 'Oberflächensprache';

  @override
  String get settingsUiLocaleReadOnly =>
      'Die Oberflächensprache ist derzeit festgelegt.';

  @override
  String get settingsLearnerProfileUnavailable => 'Kein Lernprofil hinterlegt.';

  @override
  String get settingsGenericError =>
      'Einstellungen konnten nicht geladen werden. Bitte erneut versuchen.';

  @override
  String get settingsErrorUnauthorized =>
      'Sitzung abgelaufen. Bitte erneut anmelden.';

  @override
  String get settingsThemeSituation => 'Ihre Situation';

  @override
  String get settingsThemeGoals => 'Ziele';

  @override
  String get settingsThemeLucyStyle => 'Lucy-Stil';

  @override
  String get settingsLearnerDomainsHint =>
      'Wählen Sie ein oder mehrere Fächer.';

  @override
  String get settingsSaveChanges => 'Speichern';

  @override
  String get settingsProfileSaved => 'Profil aktualisiert';

  @override
  String get settingsProfileSaveFailed =>
      'Profil konnte nicht gespeichert werden. Bitte erneut versuchen.';

  @override
  String get settingsProfileTitle => 'Profil';

  @override
  String get settingsHubSection => 'Menü';

  @override
  String get settingsProfileHubHint => 'Name, E-Mail, Passwort';

  @override
  String get settingsAiConfigTitle => 'Lucy-Konfiguration';

  @override
  String get settingsAiConfigHubHint => 'KI-Profil, Sprache';

  @override
  String get settingsAiConfigIntro =>
      'Passen Sie an, wie Lucy Sie beim Lernen begleitet.';

  @override
  String get settingsFirstNameLabel => 'Vorname';

  @override
  String get settingsLastNameLabel => 'Nachname';

  @override
  String get settingsFirstNameRequired => 'Vorname ist erforderlich.';

  @override
  String get settingsFieldMinTwoChars => 'Mindestens 2 Zeichen erforderlich.';

  @override
  String get settingsSecuritySection => 'Sicherheit';

  @override
  String get settingsChangePassword => 'Passwort ändern';

  @override
  String get settingsChangePasswordSubtitle =>
      'Aktuelles Passwort eingeben, dann das neue Passwort.';

  @override
  String get settingsCurrentPassword => 'Aktuelles Passwort';

  @override
  String get settingsNewPassword => 'Neues Passwort';

  @override
  String get settingsConfirmNewPassword => 'Passwort bestätigen';

  @override
  String get settingsPasswordChanged => 'Passwort aktualisiert';

  @override
  String get settingsPasswordChangeFailed =>
      'Passwort konnte nicht geändert werden. Bitte erneut versuchen.';

  @override
  String get settingsInvalidCurrentPassword => 'Aktuelles Passwort ist falsch.';

  @override
  String get settingsPasswordMismatch => 'Passwörter stimmen nicht überein.';

  @override
  String get settingsEmailReadOnly => 'E-Mail kann hier nicht geändert werden.';

  @override
  String get shellMenu => 'Menü';

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
  String get authUserProfileConflict =>
      'Diese E-Mail ist bereits mit einem anderen Profil verknüpft.';

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
  String get onboardingStepEdit => 'Schritt bearbeiten';

  @override
  String get onboardingRegenerateProfile => 'Profil neu erstellen';

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

  @override
  String get documentGenericError =>
      'Bei Ihren Dokumenten ist ein Fehler aufgetreten. Bitte erneut versuchen.';

  @override
  String get documentErrorValidation =>
      'Ungültige Anfrage. Prüfen Sie die Datei und versuchen Sie es erneut.';

  @override
  String get documentErrorUnauthorized =>
      'Ihre Sitzung ist abgelaufen. Bitte melden Sie sich erneut an.';

  @override
  String get documentErrorUploadNotReady =>
      'Die Datei ist noch nicht bereit. Warten Sie kurz und versuchen Sie es erneut.';

  @override
  String get documentErrorUploadNetwork =>
      'Upload zum Speicher fehlgeschlagen (Netzwerk oder CORS). Firebase-Storage-CORS für Web prüfen.';

  @override
  String get documentErrorProcessingNoDelete =>
      'Verarbeitung läuft. Dieses Dokument kann noch nicht gelöscht werden.';

  @override
  String get documentErrorOneUploadAtATime =>
      'Ein anderer Upload läuft bereits. Bitte warten Sie, bis er abgeschlossen ist.';

  @override
  String get documentErrorSearchActiveLimit =>
      'Sie können höchstens 5 Dokumente für die Suche aktivieren.';

  @override
  String get documentErrorTypeNotAllowed =>
      'Dieser Dateityp wird nicht unterstützt.';

  @override
  String get documentErrorTypeMismatch =>
      'Der Dateiinhalt entspricht nicht dem angegebenen Typ.';

  @override
  String get documentErrorTooLarge =>
      'Diese Datei ist zu groß (maximal 20 MB).';

  @override
  String get documentErrorEmptyExtraction =>
      'Lucy konnte nicht genug Text aus diesem Dokument extrahieren.';

  @override
  String get documentErrorPasswordProtected =>
      'Diese PDF ist passwortgeschützt. Entfernen Sie den Schutz und versuchen Sie es erneut.';

  @override
  String get documentErrorOcrRequired =>
      'Dieses Dokument scheint ein Scan ohne lesbaren Text zu sein.';

  @override
  String get documentErrorNotFound => 'Dokument nicht gefunden.';

  @override
  String get documentProcessingFailed =>
      'Die Dokumentverarbeitung ist fehlgeschlagen. Sie können es erneut versuchen.';

  @override
  String get documentErrorUploadAbandoned =>
      'Der Upload ist abgelaufen. Löschen Sie den Eintrag und versuchen Sie es erneut.';

  @override
  String get documentErrorEmbeddingUnavailable =>
      'Die Indizierung ist vorübergehend nicht verfügbar. Versuchen Sie es später erneut.';

  @override
  String get documentsAdd => 'Hinzufügen';

  @override
  String get documentsAddTitle => 'Dokument hinzufügen';

  @override
  String get documentsEmpty =>
      'Noch keine Dokumente. Fügen Sie eine PDF-, Word- oder Textdatei hinzu.';

  @override
  String get documentsProcessingHint =>
      'Lucy verarbeitet Ihr Dokument. Das kann einen Moment dauern.';

  @override
  String get documentsPickFile => 'Datei auswählen';

  @override
  String get documentsPickFileRequired =>
      'Bitte wählen Sie eine Datei zum Hochladen.';

  @override
  String get documentsFieldTitle => 'Titel';

  @override
  String get documentsUpload => 'Hochladen';

  @override
  String get documentsDownload => 'Herunterladen';

  @override
  String get documentsDelete => 'Löschen';

  @override
  String get documentsDialogCancel => 'Abbrechen';

  @override
  String get documentsDeleteConfirmTitle => 'Dokument löschen?';

  @override
  String documentsDeleteConfirmMessage(String title) {
    return '„$title“ löschen? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get documentsStatusUploading => 'Hochladen';

  @override
  String get documentsStatusProcessing => 'Verarbeitung';

  @override
  String get documentsStatusReady => 'Bereit';

  @override
  String get documentsStatusFailed => 'Fehlgeschlagen';

  @override
  String get chatDefaultTitle => 'Neue Unterhaltung';

  @override
  String get chatNewConversation => 'Neue Unterhaltung';

  @override
  String get chatShowThreadList => 'Unterhaltungsliste';

  @override
  String get chatSourcesTitle => 'Quellen';

  @override
  String chatSourcePages(int pageStart, int pageEnd) {
    return 'Seiten $pageStart–$pageEnd';
  }

  @override
  String get chatEmptyHint =>
      'Stellen Sie eine Frage zu Ihren aktiven Dokumenten.';

  @override
  String get chatComposerHint => 'Ihre Nachricht…';

  @override
  String get chatSend => 'Senden';

  @override
  String get chatRetry => 'Erneut versuchen';

  @override
  String get chatLoading => 'Laden…';

  @override
  String get chatOfflineBanner =>
      'Offline — Cache wird angezeigt. Senden ist deaktiviert.';

  @override
  String get chatNoCorpusTitle => 'Keine aktiven Dokumente';

  @override
  String get chatNoCorpusMessage =>
      'Aktivieren Sie die Suche für mindestens ein fertiges Dokument im Tab Dokumente.';

  @override
  String get chatNoCorpusCta => 'Zu Dokumente';

  @override
  String get chatErrorNoActiveDocuments =>
      'Aktivieren Sie mindestens ein Dokument, um mit Lucy zu chatten.';

  @override
  String get chatErrorLearnerProfileMissing =>
      'Schließen Sie das Onboarding ab, um den Chat zu nutzen.';

  @override
  String get chatErrorUnauthorized =>
      'Sitzung abgelaufen. Bitte erneut anmelden.';

  @override
  String get chatErrorNotFound => 'Unterhaltung nicht gefunden.';

  @override
  String get chatErrorInvalidMessage => 'Ungültige Nachricht.';

  @override
  String get chatErrorLlmUnavailable =>
      'Lucy ist vorübergehend nicht verfügbar. Versuchen Sie es später erneut.';

  @override
  String get chatErrorInvalidResponse =>
      'Ungültige Serverantwort. Bitte erneut versuchen.';

  @override
  String get chatErrorStreamInProgress =>
      'Eine Antwort wird bereits generiert.';

  @override
  String get chatGenericError =>
      'Etwas ist schiefgelaufen. Bitte erneut versuchen.';

  @override
  String get quizEmptyHint => 'Bitten Sie Lucy im Chat, ein Quiz zu erstellen.';

  @override
  String get quizLibraryEmptyHint =>
      'Bitten Sie Lucy im Chat, ein Quiz oder Karteikarten zu erstellen.';

  @override
  String get quizLibraryHistoryTitle => 'Verlauf';

  @override
  String get quizLibraryTypeQuiz => 'Quiz';

  @override
  String get quizLibraryTypeFlashcards => 'Karteikarten';

  @override
  String get quizLibraryOpen => 'Öffnen';

  @override
  String get quizLibraryDateToday => 'Heute';

  @override
  String get quizLibraryDateYesterday => 'Gestern';

  @override
  String get quizLibraryDeleteConfirmTitle => 'Sitzung löschen?';

  @override
  String quizLibraryDeleteConfirmMessage(String title) {
    return '« $title » löschen? Diese Aktion kann nicht rückgängig gemacht werden.';
  }

  @override
  String get quizLibraryDeleteAction => 'Löschen';

  @override
  String get quizLibraryDeleteCancel => 'Abbrechen';

  @override
  String get quizComingSoon => 'Die Quiz-Generierung kommt bald.';

  @override
  String quizSessionQuestionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fragen',
      one: '$count Frage',
    );
    return '$_temp0';
  }

  @override
  String quizSessionFlashcardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Karten',
      one: '$count Karte',
    );
    return '$_temp0';
  }

  @override
  String get quizSessionPlaceholderMessage =>
      'Diese Sitzung wird hier bald geöffnet.';

  @override
  String get chatLearningSessionCardTitle => 'Quiz bereit';

  @override
  String get chatLearningSessionFlashcardsCardTitle => 'Karteikarten bereit';

  @override
  String get chatLearningSessionQuizSubtitle =>
      'Wiederhole deine Kurse mit einem interaktiven Quiz.';

  @override
  String get chatLearningSessionFlashcardsSubtitle =>
      'Merke dir die wichtigsten Begriffe im Handumdrehen.';

  @override
  String get chatLearningSessionStartQuiz => 'Quiz starten';

  @override
  String get chatLearningSessionStartFlashcards => 'Karteikarten ansehen';

  @override
  String get chatLearningSessionOpen => 'Öffnen';

  @override
  String flashcardsSessionProgress(int current, int total) {
    return 'Karte $current / $total';
  }

  @override
  String get flashcardsSessionFront => 'Vorderseite';

  @override
  String get flashcardsSessionBack => 'Rückseite';

  @override
  String get flashcardsSessionTapToFlip => 'Tippen zum Umdrehen';

  @override
  String get flashcardsSessionPrevious => 'Zurück';

  @override
  String get flashcardsSessionNext => 'Weiter';

  @override
  String quizSessionProgress(int current, int total) {
    return 'Frage $current / $total';
  }

  @override
  String quizSessionProgressPercent(int percent) {
    return '$percent %';
  }

  @override
  String get quizSessionCorrect => 'Richtig!';

  @override
  String get quizSessionIncorrect => 'Falsch';

  @override
  String get quizSessionExplanationTitle => 'Erklärung';

  @override
  String get quizSessionNextQuestion => 'Nächste Frage';

  @override
  String get quizSessionFinish => 'Ergebnis ansehen';

  @override
  String get quizSessionScoreTitle => 'Quiz abgeschlossen!';

  @override
  String quizSessionScoreSubtitle(int correct, int total) {
    return 'Du hast $correct von $total Fragen richtig beantwortet.';
  }

  @override
  String get quizSessionClose => 'Schließen';

  @override
  String get quizSessionRetry => 'Erneut versuchen';

  @override
  String quizSessionScore(int correct, int total) {
    return 'Punkte: $correct / $total';
  }

  @override
  String get quizNoCorpusTitle => 'Keine aktiven Dokumente';

  @override
  String get quizNoCorpusMessage =>
      'Aktivieren Sie die Suche für mindestens ein fertiges Dokument, um ein Quiz zu erstellen.';

  @override
  String get quizNoCorpusCta => 'Zu den Dokumenten';

  @override
  String get quizLoading => 'Laden…';

  @override
  String get quizGenericError =>
      'Etwas ist schiefgelaufen. Bitte erneut versuchen.';

  @override
  String get learningSessionNotFound => 'Diese Sitzung wurde nicht gefunden.';

  @override
  String get learningSessionGenerationFailed =>
      'Die Generierung ist fehlgeschlagen. Versuchen Sie es erneut im Chat.';

  @override
  String get learningSessionValidationError =>
      'Die Generierungsanfrage ist ungültig.';

  @override
  String get learningGenericError =>
      'Etwas ist schiefgelaufen. Bitte erneut versuchen.';
}
