import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('fr'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In de, this message translates to:
  /// **'Lucy'**
  String get appTitle;

  /// No description provided for @splashLoading.
  ///
  /// In de, this message translates to:
  /// **'Wird geladen…'**
  String get splashLoading;

  /// No description provided for @authLoginBrandingTitle.
  ///
  /// In de, this message translates to:
  /// **'Ihr persönlicher KI-Tutor'**
  String get authLoginBrandingTitle;

  /// No description provided for @authLoginBrandingSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Lernen Sie in Ihrem Tempo mit individueller Begleitung.'**
  String get authLoginBrandingSubtitle;

  /// No description provided for @authLoginTitle.
  ///
  /// In de, this message translates to:
  /// **'Anmelden'**
  String get authLoginTitle;

  /// No description provided for @authEmailLabel.
  ///
  /// In de, this message translates to:
  /// **'E-Mail'**
  String get authEmailLabel;

  /// No description provided for @authEmailHint.
  ///
  /// In de, this message translates to:
  /// **'sie@beispiel.de'**
  String get authEmailHint;

  /// No description provided for @authPasswordLabel.
  ///
  /// In de, this message translates to:
  /// **'Passwort'**
  String get authPasswordLabel;

  /// No description provided for @authPasswordHint.
  ///
  /// In de, this message translates to:
  /// **'Passwort eingeben'**
  String get authPasswordHint;

  /// No description provided for @authEmailRequired.
  ///
  /// In de, this message translates to:
  /// **'E-Mail ist erforderlich.'**
  String get authEmailRequired;

  /// No description provided for @authPasswordRequired.
  ///
  /// In de, this message translates to:
  /// **'Passwort ist erforderlich.'**
  String get authPasswordRequired;

  /// No description provided for @authLoginButton.
  ///
  /// In de, this message translates to:
  /// **'Anmelden'**
  String get authLoginButton;

  /// No description provided for @authForgotPasswordPrompt.
  ///
  /// In de, this message translates to:
  /// **'Passwort vergessen?'**
  String get authForgotPasswordPrompt;

  /// No description provided for @authForgotPasswordLink.
  ///
  /// In de, this message translates to:
  /// **'Zurücksetzen'**
  String get authForgotPasswordLink;

  /// No description provided for @authNoAccountPrompt.
  ///
  /// In de, this message translates to:
  /// **'Noch kein Konto?'**
  String get authNoAccountPrompt;

  /// No description provided for @authSignUpLink.
  ///
  /// In de, this message translates to:
  /// **'Konto erstellen'**
  String get authSignUpLink;

  /// No description provided for @authSignUpBrandingTitle.
  ///
  /// In de, this message translates to:
  /// **'Lucy beitreten'**
  String get authSignUpBrandingTitle;

  /// No description provided for @authSignUpBrandingSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Erstellen Sie Ihr Konto und lernen Sie mit Ihrem KI-Tutor.'**
  String get authSignUpBrandingSubtitle;

  /// No description provided for @authSignUpTitle.
  ///
  /// In de, this message translates to:
  /// **'Konto erstellen'**
  String get authSignUpTitle;

  /// No description provided for @authFullNameLabel.
  ///
  /// In de, this message translates to:
  /// **'Vollständiger Name'**
  String get authFullNameLabel;

  /// No description provided for @authFullNameHint.
  ///
  /// In de, this message translates to:
  /// **'Ihr Name'**
  String get authFullNameHint;

  /// No description provided for @authFullNameRequired.
  ///
  /// In de, this message translates to:
  /// **'Der vollständige Name ist erforderlich.'**
  String get authFullNameRequired;

  /// No description provided for @authSignUpButton.
  ///
  /// In de, this message translates to:
  /// **'Konto erstellen'**
  String get authSignUpButton;

  /// No description provided for @authAlreadyHaveAccountPrompt.
  ///
  /// In de, this message translates to:
  /// **'Bereits ein Konto?'**
  String get authAlreadyHaveAccountPrompt;

  /// No description provided for @authLoginLink.
  ///
  /// In de, this message translates to:
  /// **'Anmelden'**
  String get authLoginLink;

  /// No description provided for @authResetBrandingTitle.
  ///
  /// In de, this message translates to:
  /// **'Passwort zurücksetzen'**
  String get authResetBrandingTitle;

  /// No description provided for @authResetBrandingSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Erhalten Sie einen sicheren Link per E-Mail für ein neues Passwort.'**
  String get authResetBrandingSubtitle;

  /// No description provided for @authResetTitle.
  ///
  /// In de, this message translates to:
  /// **'Passwort vergessen'**
  String get authResetTitle;

  /// No description provided for @authResetSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Geben Sie Ihre E-Mail-Adresse ein, um einen Reset-Link zu erhalten.'**
  String get authResetSubtitle;

  /// No description provided for @authResetButton.
  ///
  /// In de, this message translates to:
  /// **'Link senden'**
  String get authResetButton;

  /// No description provided for @authResetSuccessTitle.
  ///
  /// In de, this message translates to:
  /// **'E-Mail prüfen'**
  String get authResetSuccessTitle;

  /// No description provided for @authResetSuccessMessage.
  ///
  /// In de, this message translates to:
  /// **'Wenn ein Konto für {email} existiert, erhalten Sie eine E-Mail zum Zurücksetzen des Passworts.'**
  String authResetSuccessMessage(String email);

  /// No description provided for @authResetTryAgain.
  ///
  /// In de, this message translates to:
  /// **'Erneut versuchen'**
  String get authResetTryAgain;

  /// No description provided for @authResetBackToLogin.
  ///
  /// In de, this message translates to:
  /// **'Zurück zur Anmeldung'**
  String get authResetBackToLogin;

  /// No description provided for @homeWelcome.
  ///
  /// In de, this message translates to:
  /// **'Willkommen bei Lucy'**
  String get homeWelcome;

  /// No description provided for @homeLogout.
  ///
  /// In de, this message translates to:
  /// **'Abmelden'**
  String get homeLogout;

  /// No description provided for @pageUnderDevelopment.
  ///
  /// In de, this message translates to:
  /// **'In Entwicklung'**
  String get pageUnderDevelopment;

  /// No description provided for @navDocuments.
  ///
  /// In de, this message translates to:
  /// **'Dokumente'**
  String get navDocuments;

  /// No description provided for @navChat.
  ///
  /// In de, this message translates to:
  /// **'Chat'**
  String get navChat;

  /// No description provided for @navQuiz.
  ///
  /// In de, this message translates to:
  /// **'Quiz'**
  String get navQuiz;

  /// No description provided for @navSettings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get navSettings;

  /// No description provided for @documentsTitle.
  ///
  /// In de, this message translates to:
  /// **'Dokumente'**
  String get documentsTitle;

  /// No description provided for @chatTitle.
  ///
  /// In de, this message translates to:
  /// **'Chat'**
  String get chatTitle;

  /// No description provided for @quizTitle.
  ///
  /// In de, this message translates to:
  /// **'Quiz'**
  String get quizTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get settingsTitle;

  /// No description provided for @settingsSectionAccount.
  ///
  /// In de, this message translates to:
  /// **'Konto'**
  String get settingsSectionAccount;

  /// No description provided for @settingsSectionLearnerProfile.
  ///
  /// In de, this message translates to:
  /// **'Lernprofil'**
  String get settingsSectionLearnerProfile;

  /// No description provided for @settingsSectionApplication.
  ///
  /// In de, this message translates to:
  /// **'Anwendung'**
  String get settingsSectionApplication;

  /// No description provided for @settingsUiLocaleLabel.
  ///
  /// In de, this message translates to:
  /// **'Oberflächensprache'**
  String get settingsUiLocaleLabel;

  /// No description provided for @settingsUiLocaleReadOnly.
  ///
  /// In de, this message translates to:
  /// **'Die Oberflächensprache ist derzeit festgelegt.'**
  String get settingsUiLocaleReadOnly;

  /// No description provided for @settingsLearnerProfileUnavailable.
  ///
  /// In de, this message translates to:
  /// **'Kein Lernprofil hinterlegt.'**
  String get settingsLearnerProfileUnavailable;

  /// No description provided for @settingsGenericError.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen konnten nicht geladen werden. Bitte erneut versuchen.'**
  String get settingsGenericError;

  /// No description provided for @settingsErrorUnauthorized.
  ///
  /// In de, this message translates to:
  /// **'Sitzung abgelaufen. Bitte erneut anmelden.'**
  String get settingsErrorUnauthorized;

  /// No description provided for @settingsThemeSituation.
  ///
  /// In de, this message translates to:
  /// **'Ihre Situation'**
  String get settingsThemeSituation;

  /// No description provided for @settingsThemeGoals.
  ///
  /// In de, this message translates to:
  /// **'Ziele'**
  String get settingsThemeGoals;

  /// No description provided for @settingsThemeLucyStyle.
  ///
  /// In de, this message translates to:
  /// **'Lucy-Stil'**
  String get settingsThemeLucyStyle;

  /// No description provided for @settingsLearnerDomainsHint.
  ///
  /// In de, this message translates to:
  /// **'Wählen Sie ein oder mehrere Fächer.'**
  String get settingsLearnerDomainsHint;

  /// No description provided for @settingsSaveChanges.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get settingsSaveChanges;

  /// No description provided for @settingsProfileSaved.
  ///
  /// In de, this message translates to:
  /// **'Profil aktualisiert'**
  String get settingsProfileSaved;

  /// No description provided for @settingsProfileSaveFailed.
  ///
  /// In de, this message translates to:
  /// **'Profil konnte nicht gespeichert werden. Bitte erneut versuchen.'**
  String get settingsProfileSaveFailed;

  /// No description provided for @settingsProfileTitle.
  ///
  /// In de, this message translates to:
  /// **'Profil'**
  String get settingsProfileTitle;

  /// No description provided for @settingsHubSection.
  ///
  /// In de, this message translates to:
  /// **'Menü'**
  String get settingsHubSection;

  /// No description provided for @settingsProfileHubHint.
  ///
  /// In de, this message translates to:
  /// **'Name, E-Mail, Passwort'**
  String get settingsProfileHubHint;

  /// No description provided for @settingsAiConfigTitle.
  ///
  /// In de, this message translates to:
  /// **'Lucy-Konfiguration'**
  String get settingsAiConfigTitle;

  /// No description provided for @settingsAiConfigHubHint.
  ///
  /// In de, this message translates to:
  /// **'KI-Profil, Sprache'**
  String get settingsAiConfigHubHint;

  /// No description provided for @settingsAiConfigIntro.
  ///
  /// In de, this message translates to:
  /// **'Passen Sie an, wie Lucy Sie beim Lernen begleitet.'**
  String get settingsAiConfigIntro;

  /// No description provided for @settingsFirstNameLabel.
  ///
  /// In de, this message translates to:
  /// **'Vorname'**
  String get settingsFirstNameLabel;

  /// No description provided for @settingsLastNameLabel.
  ///
  /// In de, this message translates to:
  /// **'Nachname'**
  String get settingsLastNameLabel;

  /// No description provided for @settingsFirstNameRequired.
  ///
  /// In de, this message translates to:
  /// **'Vorname ist erforderlich.'**
  String get settingsFirstNameRequired;

  /// No description provided for @settingsFieldMinTwoChars.
  ///
  /// In de, this message translates to:
  /// **'Mindestens 2 Zeichen erforderlich.'**
  String get settingsFieldMinTwoChars;

  /// No description provided for @settingsSecuritySection.
  ///
  /// In de, this message translates to:
  /// **'Sicherheit'**
  String get settingsSecuritySection;

  /// No description provided for @settingsChangePassword.
  ///
  /// In de, this message translates to:
  /// **'Passwort ändern'**
  String get settingsChangePassword;

  /// No description provided for @settingsChangePasswordSubtitle.
  ///
  /// In de, this message translates to:
  /// **'Aktuelles Passwort eingeben, dann das neue Passwort.'**
  String get settingsChangePasswordSubtitle;

  /// No description provided for @settingsCurrentPassword.
  ///
  /// In de, this message translates to:
  /// **'Aktuelles Passwort'**
  String get settingsCurrentPassword;

  /// No description provided for @settingsNewPassword.
  ///
  /// In de, this message translates to:
  /// **'Neues Passwort'**
  String get settingsNewPassword;

  /// No description provided for @settingsConfirmNewPassword.
  ///
  /// In de, this message translates to:
  /// **'Passwort bestätigen'**
  String get settingsConfirmNewPassword;

  /// No description provided for @settingsPasswordChanged.
  ///
  /// In de, this message translates to:
  /// **'Passwort aktualisiert'**
  String get settingsPasswordChanged;

  /// No description provided for @settingsPasswordChangeFailed.
  ///
  /// In de, this message translates to:
  /// **'Passwort konnte nicht geändert werden. Bitte erneut versuchen.'**
  String get settingsPasswordChangeFailed;

  /// No description provided for @settingsInvalidCurrentPassword.
  ///
  /// In de, this message translates to:
  /// **'Aktuelles Passwort ist falsch.'**
  String get settingsInvalidCurrentPassword;

  /// No description provided for @settingsPasswordMismatch.
  ///
  /// In de, this message translates to:
  /// **'Passwörter stimmen nicht überein.'**
  String get settingsPasswordMismatch;

  /// No description provided for @settingsEmailReadOnly.
  ///
  /// In de, this message translates to:
  /// **'E-Mail kann hier nicht geändert werden.'**
  String get settingsEmailReadOnly;

  /// No description provided for @shellMenu.
  ///
  /// In de, this message translates to:
  /// **'Menü'**
  String get shellMenu;

  /// No description provided for @authUnknownError.
  ///
  /// In de, this message translates to:
  /// **'Etwas ist schiefgelaufen. Bitte erneut versuchen.'**
  String get authUnknownError;

  /// No description provided for @authUserNotFound.
  ///
  /// In de, this message translates to:
  /// **'Kein Konto mit dieser E-Mail gefunden.'**
  String get authUserNotFound;

  /// No description provided for @authWrongPassword.
  ///
  /// In de, this message translates to:
  /// **'Falsches Passwort.'**
  String get authWrongPassword;

  /// No description provided for @authInvalidCredentials.
  ///
  /// In de, this message translates to:
  /// **'E-Mail oder Passwort ist falsch.'**
  String get authInvalidCredentials;

  /// No description provided for @authEmailAlreadyInUse.
  ///
  /// In de, this message translates to:
  /// **'Diese E-Mail wird bereits verwendet.'**
  String get authEmailAlreadyInUse;

  /// No description provided for @authWeakPassword.
  ///
  /// In de, this message translates to:
  /// **'Das Passwort ist zu schwach.'**
  String get authWeakPassword;

  /// No description provided for @authInvalidEmail.
  ///
  /// In de, this message translates to:
  /// **'Ungültige E-Mail-Adresse.'**
  String get authInvalidEmail;

  /// No description provided for @authNetworkError.
  ///
  /// In de, this message translates to:
  /// **'Verbindungsproblem. Prüfen Sie Ihr Netzwerk.'**
  String get authNetworkError;

  /// No description provided for @authTooManyRequests.
  ///
  /// In de, this message translates to:
  /// **'Zu viele Versuche. Später erneut versuchen.'**
  String get authTooManyRequests;

  /// No description provided for @authUserDisabled.
  ///
  /// In de, this message translates to:
  /// **'Dieses Konto wurde deaktiviert.'**
  String get authUserDisabled;

  /// No description provided for @authOperationNotAllowed.
  ///
  /// In de, this message translates to:
  /// **'Diese Aktion ist nicht erlaubt.'**
  String get authOperationNotAllowed;

  /// No description provided for @authProfileWriteFailed.
  ///
  /// In de, this message translates to:
  /// **'Profil konnte nicht gespeichert werden. Bitte erneut versuchen.'**
  String get authProfileWriteFailed;

  /// No description provided for @authUserProfileConflict.
  ///
  /// In de, this message translates to:
  /// **'Diese E-Mail ist bereits mit einem anderen Profil verknüpft.'**
  String get authUserProfileConflict;

  /// No description provided for @onboardingPlaceholderTitle.
  ///
  /// In de, this message translates to:
  /// **'Einrichtung Ihres Lernprofils'**
  String get onboardingPlaceholderTitle;

  /// No description provided for @onboardingQuestionQRole.
  ///
  /// In de, this message translates to:
  /// **'Erzählen Sie mir von Ihrer Situation: Studium, Berufswechsel oder selbstständiges Lernen?'**
  String get onboardingQuestionQRole;

  /// No description provided for @onboardingQuestionQDomains.
  ///
  /// In de, this message translates to:
  /// **'Welche Fächer oder Bereiche möchten Sie mit mir bearbeiten?'**
  String get onboardingQuestionQDomains;

  /// No description provided for @onboardingQuestionQGoal.
  ///
  /// In de, this message translates to:
  /// **'Was ist Ihr Hauptziel mit mir?'**
  String get onboardingQuestionQGoal;

  /// No description provided for @onboardingQuestionQLevel.
  ///
  /// In de, this message translates to:
  /// **'Wie würden Sie Ihr aktuelles Niveau beschreiben?'**
  String get onboardingQuestionQLevel;

  /// No description provided for @onboardingQuestionQStyle.
  ///
  /// In de, this message translates to:
  /// **'Wie sollen Ihnen Inhalte am besten erklärt werden?'**
  String get onboardingQuestionQStyle;

  /// No description provided for @onboardingQuestionQTone.
  ///
  /// In de, this message translates to:
  /// **'Welchen Ton bevorzugen Sie bei Korrekturen und Feedback?'**
  String get onboardingQuestionQTone;

  /// No description provided for @onboardingQuestionQLanguage.
  ///
  /// In de, this message translates to:
  /// **'In welcher Sprache soll ich Ihnen den Unterricht erklären?'**
  String get onboardingQuestionQLanguage;

  /// No description provided for @onboardingSendAnswer.
  ///
  /// In de, this message translates to:
  /// **'Senden'**
  String get onboardingSendAnswer;

  /// No description provided for @onboardingStepProgress.
  ///
  /// In de, this message translates to:
  /// **'{current} / {total}'**
  String onboardingStepProgress(int current, int total);

  /// No description provided for @onboardingStepLocked.
  ///
  /// In de, this message translates to:
  /// **'Schließe zuerst den aktuellen Schritt ab.'**
  String get onboardingStepLocked;

  /// No description provided for @onboardingLucyTyping.
  ///
  /// In de, this message translates to:
  /// **'Lucy schreibt…'**
  String get onboardingLucyTyping;

  /// No description provided for @onboardingStepReadOnly.
  ///
  /// In de, this message translates to:
  /// **'Schritt abgeschlossen — nur Ansicht.'**
  String get onboardingStepReadOnly;

  /// No description provided for @onboardingStepEdit.
  ///
  /// In de, this message translates to:
  /// **'Schritt bearbeiten'**
  String get onboardingStepEdit;

  /// No description provided for @onboardingRegenerateProfile.
  ///
  /// In de, this message translates to:
  /// **'Profil neu erstellen'**
  String get onboardingRegenerateProfile;

  /// No description provided for @onboardingConfirmTurn.
  ///
  /// In de, this message translates to:
  /// **'Passt'**
  String get onboardingConfirmTurn;

  /// No description provided for @onboardingRejectTurn.
  ///
  /// In de, this message translates to:
  /// **'Das stimmt nicht'**
  String get onboardingRejectTurn;

  /// No description provided for @onboardingGenericError.
  ///
  /// In de, this message translates to:
  /// **'Ein Fehler ist aufgetreten. Bitte erneut versuchen.'**
  String get onboardingGenericError;

  /// No description provided for @onboardingErrorUnauthorized.
  ///
  /// In de, this message translates to:
  /// **'Ihre Sitzung ist abgelaufen. Bitte melden Sie sich erneut an.'**
  String get onboardingErrorUnauthorized;

  /// No description provided for @onboardingErrorValidation.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Anfrage. Bitte erneut versuchen.'**
  String get onboardingErrorValidation;

  /// No description provided for @onboardingErrorAlreadyComplete.
  ///
  /// In de, this message translates to:
  /// **'Ihr Profil ist bereits eingerichtet.'**
  String get onboardingErrorAlreadyComplete;

  /// No description provided for @onboardingErrorTranscriptIncomplete.
  ///
  /// In de, this message translates to:
  /// **'Beantworten Sie alle 7 Fragen, bevor Sie die Analyse starten.'**
  String get onboardingErrorTranscriptIncomplete;

  /// No description provided for @onboardingErrorProfileIncomplete.
  ///
  /// In de, this message translates to:
  /// **'Das erzeugte Profil ist unvollständig. Versuchen Sie es erneut oder passen Sie Ihre Antworten an.'**
  String get onboardingErrorProfileIncomplete;

  /// No description provided for @onboardingErrorPendingProfileMissing.
  ///
  /// In de, this message translates to:
  /// **'Kein Profil wartet auf Bestätigung. Starten Sie die Analyse erneut.'**
  String get onboardingErrorPendingProfileMissing;

  /// No description provided for @onboardingErrorLlmInvalid.
  ///
  /// In de, this message translates to:
  /// **'Lucy konnte die Antwort nicht verarbeiten. Bitte gleich erneut versuchen.'**
  String get onboardingErrorLlmInvalid;

  /// No description provided for @onboardingErrorLlmUnavailable.
  ///
  /// In de, this message translates to:
  /// **'Lucy ist vorübergehend nicht verfügbar. Bitte später erneut versuchen.'**
  String get onboardingErrorLlmUnavailable;

  /// No description provided for @onboardingErrorInternal.
  ///
  /// In de, this message translates to:
  /// **'Ein Fehler ist aufgetreten. Bitte erneut versuchen.'**
  String get onboardingErrorInternal;

  /// No description provided for @onboardingAnswerRequired.
  ///
  /// In de, this message translates to:
  /// **'Bitte geben Sie zuerst eine Antwort ein.'**
  String get onboardingAnswerRequired;

  /// No description provided for @onboardingAnswerTooLong.
  ///
  /// In de, this message translates to:
  /// **'Ihre Antwort ist zu lang (max. 2000 Zeichen).'**
  String get onboardingAnswerTooLong;

  /// No description provided for @onboardingAnswerHint.
  ///
  /// In de, this message translates to:
  /// **'Ihre Antwort…'**
  String get onboardingAnswerHint;

  /// No description provided for @onboardingAnalysisReadyHint.
  ///
  /// In de, this message translates to:
  /// **'Analyse abgeschlossen. Der Bestätigungsbildschirm folgt in Kürze.'**
  String get onboardingAnalysisReadyHint;

  /// No description provided for @onboardingConfirmTitle.
  ///
  /// In de, this message translates to:
  /// **'Ihr Lernprofil'**
  String get onboardingConfirmTitle;

  /// No description provided for @onboardingConfirmSummaryHeading.
  ///
  /// In de, this message translates to:
  /// **'Was Lucy verstanden hat'**
  String get onboardingConfirmSummaryHeading;

  /// No description provided for @onboardingConfirmAccept.
  ///
  /// In de, this message translates to:
  /// **'Bestätigen und weiter'**
  String get onboardingConfirmAccept;

  /// No description provided for @onboardingConfirmEdit.
  ///
  /// In de, this message translates to:
  /// **'Antworten bearbeiten'**
  String get onboardingConfirmEdit;

  /// No description provided for @onboardingConfirmMissingAnalysis.
  ///
  /// In de, this message translates to:
  /// **'Keine Analyse verfügbar. Bitte zuerst den Fragebogen abschließen.'**
  String get onboardingConfirmMissingAnalysis;

  /// No description provided for @onboardingProfileLabelPrimaryRole.
  ///
  /// In de, this message translates to:
  /// **'Situation'**
  String get onboardingProfileLabelPrimaryRole;

  /// No description provided for @onboardingProfileLabelMainDomains.
  ///
  /// In de, this message translates to:
  /// **'Fachgebiete'**
  String get onboardingProfileLabelMainDomains;

  /// No description provided for @onboardingProfileLabelLearningGoal.
  ///
  /// In de, this message translates to:
  /// **'Ziel'**
  String get onboardingProfileLabelLearningGoal;

  /// No description provided for @onboardingProfileLabelSelfAssessedLevel.
  ///
  /// In de, this message translates to:
  /// **'Niveau'**
  String get onboardingProfileLabelSelfAssessedLevel;

  /// No description provided for @onboardingProfileLabelExplanationStyle.
  ///
  /// In de, this message translates to:
  /// **'Erklärungsstil'**
  String get onboardingProfileLabelExplanationStyle;

  /// No description provided for @onboardingProfileLabelFeedbackTone.
  ///
  /// In de, this message translates to:
  /// **'Feedback-Ton'**
  String get onboardingProfileLabelFeedbackTone;

  /// No description provided for @onboardingProfileLabelTutoringLanguage.
  ///
  /// In de, this message translates to:
  /// **'Erklärungssprache'**
  String get onboardingProfileLabelTutoringLanguage;

  /// No description provided for @onboardingEnumPrimaryRoleStudent.
  ///
  /// In de, this message translates to:
  /// **'Studierende'**
  String get onboardingEnumPrimaryRoleStudent;

  /// No description provided for @onboardingEnumPrimaryRoleProfessional.
  ///
  /// In de, this message translates to:
  /// **'Berufstätige'**
  String get onboardingEnumPrimaryRoleProfessional;

  /// No description provided for @onboardingEnumPrimaryRoleEducator.
  ///
  /// In de, this message translates to:
  /// **'Lehrende'**
  String get onboardingEnumPrimaryRoleEducator;

  /// No description provided for @onboardingEnumPrimaryRoleSelfLearner.
  ///
  /// In de, this message translates to:
  /// **'Selbstlerner'**
  String get onboardingEnumPrimaryRoleSelfLearner;

  /// No description provided for @onboardingEnumPrimaryRoleOther.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges'**
  String get onboardingEnumPrimaryRoleOther;

  /// No description provided for @onboardingEnumDomainSciences.
  ///
  /// In de, this message translates to:
  /// **'Naturwissenschaften'**
  String get onboardingEnumDomainSciences;

  /// No description provided for @onboardingEnumDomainLaw.
  ///
  /// In de, this message translates to:
  /// **'Recht'**
  String get onboardingEnumDomainLaw;

  /// No description provided for @onboardingEnumDomainMedicine.
  ///
  /// In de, this message translates to:
  /// **'Medizin'**
  String get onboardingEnumDomainMedicine;

  /// No description provided for @onboardingEnumDomainLanguages.
  ///
  /// In de, this message translates to:
  /// **'Sprachen'**
  String get onboardingEnumDomainLanguages;

  /// No description provided for @onboardingEnumDomainBusiness.
  ///
  /// In de, this message translates to:
  /// **'Wirtschaft'**
  String get onboardingEnumDomainBusiness;

  /// No description provided for @onboardingEnumDomainCs.
  ///
  /// In de, this message translates to:
  /// **'Informatik'**
  String get onboardingEnumDomainCs;

  /// No description provided for @onboardingEnumDomainOther.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges'**
  String get onboardingEnumDomainOther;

  /// No description provided for @onboardingEnumLearningGoalExam.
  ///
  /// In de, this message translates to:
  /// **'Prüfungsvorbereitung'**
  String get onboardingEnumLearningGoalExam;

  /// No description provided for @onboardingEnumLearningGoalUnderstandCourse.
  ///
  /// In de, this message translates to:
  /// **'Kurs besser verstehen'**
  String get onboardingEnumLearningGoalUnderstandCourse;

  /// No description provided for @onboardingEnumLearningGoalQuickReview.
  ///
  /// In de, this message translates to:
  /// **'Schnelle Wiederholung'**
  String get onboardingEnumLearningGoalQuickReview;

  /// No description provided for @onboardingEnumLearningGoalProfessional.
  ///
  /// In de, this message translates to:
  /// **'Berufliche Weiterbildung'**
  String get onboardingEnumLearningGoalProfessional;

  /// No description provided for @onboardingEnumLearningGoalCertification.
  ///
  /// In de, this message translates to:
  /// **'Zertifizierung'**
  String get onboardingEnumLearningGoalCertification;

  /// No description provided for @onboardingEnumLearningGoalOther.
  ///
  /// In de, this message translates to:
  /// **'Sonstiges'**
  String get onboardingEnumLearningGoalOther;

  /// No description provided for @onboardingEnumLevelBeginner.
  ///
  /// In de, this message translates to:
  /// **'Anfänger'**
  String get onboardingEnumLevelBeginner;

  /// No description provided for @onboardingEnumLevelIntermediate.
  ///
  /// In de, this message translates to:
  /// **'Mittelstufe'**
  String get onboardingEnumLevelIntermediate;

  /// No description provided for @onboardingEnumLevelAdvanced.
  ///
  /// In de, this message translates to:
  /// **'Fortgeschritten'**
  String get onboardingEnumLevelAdvanced;

  /// No description provided for @onboardingEnumLevelVariable.
  ///
  /// In de, this message translates to:
  /// **'Je nach Thema unterschiedlich'**
  String get onboardingEnumLevelVariable;

  /// No description provided for @onboardingEnumStyleStepByStep.
  ///
  /// In de, this message translates to:
  /// **'Schritt für Schritt'**
  String get onboardingEnumStyleStepByStep;

  /// No description provided for @onboardingEnumStyleSummaryFirst.
  ///
  /// In de, this message translates to:
  /// **'Zuerst Zusammenfassung'**
  String get onboardingEnumStyleSummaryFirst;

  /// No description provided for @onboardingEnumStyleAnalogies.
  ///
  /// In de, this message translates to:
  /// **'Analogien'**
  String get onboardingEnumStyleAnalogies;

  /// No description provided for @onboardingEnumStyleSocratic.
  ///
  /// In de, this message translates to:
  /// **'Geführte Fragen'**
  String get onboardingEnumStyleSocratic;

  /// No description provided for @onboardingEnumToneEncouraging.
  ///
  /// In de, this message translates to:
  /// **'Ermutigend'**
  String get onboardingEnumToneEncouraging;

  /// No description provided for @onboardingEnumToneNeutral.
  ///
  /// In de, this message translates to:
  /// **'Neutral'**
  String get onboardingEnumToneNeutral;

  /// No description provided for @onboardingEnumToneStrict.
  ///
  /// In de, this message translates to:
  /// **'Streng'**
  String get onboardingEnumToneStrict;

  /// No description provided for @onboardingEnumTutoringLangFr.
  ///
  /// In de, this message translates to:
  /// **'Französisch'**
  String get onboardingEnumTutoringLangFr;

  /// No description provided for @onboardingEnumTutoringLangEn.
  ///
  /// In de, this message translates to:
  /// **'Englisch'**
  String get onboardingEnumTutoringLangEn;

  /// No description provided for @onboardingEnumTutoringLangDe.
  ///
  /// In de, this message translates to:
  /// **'Deutsch'**
  String get onboardingEnumTutoringLangDe;

  /// No description provided for @onboardingEnumTutoringLangMatchDocument.
  ///
  /// In de, this message translates to:
  /// **'Sprache des Dokuments'**
  String get onboardingEnumTutoringLangMatchDocument;

  /// No description provided for @documentGenericError.
  ///
  /// In de, this message translates to:
  /// **'Bei Ihren Dokumenten ist ein Fehler aufgetreten. Bitte erneut versuchen.'**
  String get documentGenericError;

  /// No description provided for @documentErrorValidation.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Anfrage. Prüfen Sie die Datei und versuchen Sie es erneut.'**
  String get documentErrorValidation;

  /// No description provided for @documentErrorUnauthorized.
  ///
  /// In de, this message translates to:
  /// **'Ihre Sitzung ist abgelaufen. Bitte melden Sie sich erneut an.'**
  String get documentErrorUnauthorized;

  /// No description provided for @documentErrorUploadNotReady.
  ///
  /// In de, this message translates to:
  /// **'Die Datei ist noch nicht bereit. Warten Sie kurz und versuchen Sie es erneut.'**
  String get documentErrorUploadNotReady;

  /// No description provided for @documentErrorUploadNetwork.
  ///
  /// In de, this message translates to:
  /// **'Upload zum Speicher fehlgeschlagen (Netzwerk oder CORS). Firebase-Storage-CORS für Web prüfen.'**
  String get documentErrorUploadNetwork;

  /// No description provided for @documentErrorProcessingNoDelete.
  ///
  /// In de, this message translates to:
  /// **'Verarbeitung läuft. Dieses Dokument kann noch nicht gelöscht werden.'**
  String get documentErrorProcessingNoDelete;

  /// No description provided for @documentErrorOneUploadAtATime.
  ///
  /// In de, this message translates to:
  /// **'Ein anderer Upload läuft bereits. Bitte warten Sie, bis er abgeschlossen ist.'**
  String get documentErrorOneUploadAtATime;

  /// No description provided for @documentErrorSearchActiveLimit.
  ///
  /// In de, this message translates to:
  /// **'Sie können höchstens 5 Dokumente für die Suche aktivieren.'**
  String get documentErrorSearchActiveLimit;

  /// No description provided for @documentErrorTypeNotAllowed.
  ///
  /// In de, this message translates to:
  /// **'Dieser Dateityp wird nicht unterstützt.'**
  String get documentErrorTypeNotAllowed;

  /// No description provided for @documentErrorTypeMismatch.
  ///
  /// In de, this message translates to:
  /// **'Der Dateiinhalt entspricht nicht dem angegebenen Typ.'**
  String get documentErrorTypeMismatch;

  /// No description provided for @documentErrorTooLarge.
  ///
  /// In de, this message translates to:
  /// **'Diese Datei ist zu groß (maximal 20 MB).'**
  String get documentErrorTooLarge;

  /// No description provided for @documentErrorEmptyExtraction.
  ///
  /// In de, this message translates to:
  /// **'Lucy konnte nicht genug Text aus diesem Dokument extrahieren.'**
  String get documentErrorEmptyExtraction;

  /// No description provided for @documentErrorPasswordProtected.
  ///
  /// In de, this message translates to:
  /// **'Diese PDF ist passwortgeschützt. Entfernen Sie den Schutz und versuchen Sie es erneut.'**
  String get documentErrorPasswordProtected;

  /// No description provided for @documentErrorOcrRequired.
  ///
  /// In de, this message translates to:
  /// **'Dieses Dokument scheint ein Scan ohne lesbaren Text zu sein.'**
  String get documentErrorOcrRequired;

  /// No description provided for @documentErrorNotFound.
  ///
  /// In de, this message translates to:
  /// **'Dokument nicht gefunden.'**
  String get documentErrorNotFound;

  /// No description provided for @documentProcessingFailed.
  ///
  /// In de, this message translates to:
  /// **'Die Dokumentverarbeitung ist fehlgeschlagen. Sie können es erneut versuchen.'**
  String get documentProcessingFailed;

  /// No description provided for @documentErrorUploadAbandoned.
  ///
  /// In de, this message translates to:
  /// **'Der Upload ist abgelaufen. Löschen Sie den Eintrag und versuchen Sie es erneut.'**
  String get documentErrorUploadAbandoned;

  /// No description provided for @documentErrorEmbeddingUnavailable.
  ///
  /// In de, this message translates to:
  /// **'Die Indizierung ist vorübergehend nicht verfügbar. Versuchen Sie es später erneut.'**
  String get documentErrorEmbeddingUnavailable;

  /// No description provided for @documentsAdd.
  ///
  /// In de, this message translates to:
  /// **'Hinzufügen'**
  String get documentsAdd;

  /// No description provided for @documentsAddTitle.
  ///
  /// In de, this message translates to:
  /// **'Dokument hinzufügen'**
  String get documentsAddTitle;

  /// No description provided for @documentsEmpty.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Dokumente. Fügen Sie eine PDF-, Word- oder Textdatei hinzu.'**
  String get documentsEmpty;

  /// No description provided for @documentsProcessingHint.
  ///
  /// In de, this message translates to:
  /// **'Lucy verarbeitet Ihr Dokument. Das kann einen Moment dauern.'**
  String get documentsProcessingHint;

  /// No description provided for @documentsPickFile.
  ///
  /// In de, this message translates to:
  /// **'Datei auswählen'**
  String get documentsPickFile;

  /// No description provided for @documentsPickFileRequired.
  ///
  /// In de, this message translates to:
  /// **'Bitte wählen Sie eine Datei zum Hochladen.'**
  String get documentsPickFileRequired;

  /// No description provided for @documentsFieldTitle.
  ///
  /// In de, this message translates to:
  /// **'Titel'**
  String get documentsFieldTitle;

  /// No description provided for @documentsUpload.
  ///
  /// In de, this message translates to:
  /// **'Hochladen'**
  String get documentsUpload;

  /// No description provided for @documentsDownload.
  ///
  /// In de, this message translates to:
  /// **'Herunterladen'**
  String get documentsDownload;

  /// No description provided for @documentsDelete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get documentsDelete;

  /// No description provided for @documentsDialogCancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get documentsDialogCancel;

  /// No description provided for @documentsDeleteConfirmTitle.
  ///
  /// In de, this message translates to:
  /// **'Dokument löschen?'**
  String get documentsDeleteConfirmTitle;

  /// No description provided for @documentsDeleteConfirmMessage.
  ///
  /// In de, this message translates to:
  /// **'„{title}“ löschen? Dies kann nicht rückgängig gemacht werden.'**
  String documentsDeleteConfirmMessage(String title);

  /// No description provided for @documentsStatusUploading.
  ///
  /// In de, this message translates to:
  /// **'Hochladen'**
  String get documentsStatusUploading;

  /// No description provided for @documentsStatusProcessing.
  ///
  /// In de, this message translates to:
  /// **'Verarbeitung'**
  String get documentsStatusProcessing;

  /// No description provided for @documentsStatusReady.
  ///
  /// In de, this message translates to:
  /// **'Bereit'**
  String get documentsStatusReady;

  /// No description provided for @documentsStatusFailed.
  ///
  /// In de, this message translates to:
  /// **'Fehlgeschlagen'**
  String get documentsStatusFailed;

  /// Default title for a new chat thread
  ///
  /// In de, this message translates to:
  /// **'Neue Unterhaltung'**
  String get chatDefaultTitle;

  /// No description provided for @chatNewConversation.
  ///
  /// In de, this message translates to:
  /// **'Neue Unterhaltung'**
  String get chatNewConversation;

  /// No description provided for @chatShowThreadList.
  ///
  /// In de, this message translates to:
  /// **'Unterhaltungsliste'**
  String get chatShowThreadList;

  /// No description provided for @chatSourcesTitle.
  ///
  /// In de, this message translates to:
  /// **'Quellen'**
  String get chatSourcesTitle;

  /// No description provided for @chatSourcePages.
  ///
  /// In de, this message translates to:
  /// **'Seiten {pageStart}–{pageEnd}'**
  String chatSourcePages(int pageStart, int pageEnd);

  /// No description provided for @chatEmptyHint.
  ///
  /// In de, this message translates to:
  /// **'Stellen Sie eine Frage zu Ihren aktiven Dokumenten.'**
  String get chatEmptyHint;

  /// No description provided for @chatComposerHint.
  ///
  /// In de, this message translates to:
  /// **'Ihre Nachricht…'**
  String get chatComposerHint;

  /// No description provided for @chatSend.
  ///
  /// In de, this message translates to:
  /// **'Senden'**
  String get chatSend;

  /// No description provided for @chatRetry.
  ///
  /// In de, this message translates to:
  /// **'Erneut versuchen'**
  String get chatRetry;

  /// No description provided for @chatLoading.
  ///
  /// In de, this message translates to:
  /// **'Laden…'**
  String get chatLoading;

  /// No description provided for @chatOfflineBanner.
  ///
  /// In de, this message translates to:
  /// **'Offline — Cache wird angezeigt. Senden ist deaktiviert.'**
  String get chatOfflineBanner;

  /// No description provided for @chatNoCorpusTitle.
  ///
  /// In de, this message translates to:
  /// **'Keine aktiven Dokumente'**
  String get chatNoCorpusTitle;

  /// No description provided for @chatNoCorpusMessage.
  ///
  /// In de, this message translates to:
  /// **'Aktivieren Sie die Suche für mindestens ein fertiges Dokument im Tab Dokumente.'**
  String get chatNoCorpusMessage;

  /// No description provided for @chatNoCorpusCta.
  ///
  /// In de, this message translates to:
  /// **'Zu Dokumente'**
  String get chatNoCorpusCta;

  /// No description provided for @chatErrorNoActiveDocuments.
  ///
  /// In de, this message translates to:
  /// **'Aktivieren Sie mindestens ein Dokument, um mit Lucy zu chatten.'**
  String get chatErrorNoActiveDocuments;

  /// No description provided for @chatErrorLearnerProfileMissing.
  ///
  /// In de, this message translates to:
  /// **'Schließen Sie das Onboarding ab, um den Chat zu nutzen.'**
  String get chatErrorLearnerProfileMissing;

  /// No description provided for @chatErrorUnauthorized.
  ///
  /// In de, this message translates to:
  /// **'Sitzung abgelaufen. Bitte erneut anmelden.'**
  String get chatErrorUnauthorized;

  /// No description provided for @chatErrorNotFound.
  ///
  /// In de, this message translates to:
  /// **'Unterhaltung nicht gefunden.'**
  String get chatErrorNotFound;

  /// No description provided for @chatErrorInvalidMessage.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Nachricht.'**
  String get chatErrorInvalidMessage;

  /// No description provided for @chatErrorLlmUnavailable.
  ///
  /// In de, this message translates to:
  /// **'Lucy ist vorübergehend nicht verfügbar. Versuchen Sie es später erneut.'**
  String get chatErrorLlmUnavailable;

  /// No description provided for @chatErrorInvalidResponse.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Serverantwort. Bitte erneut versuchen.'**
  String get chatErrorInvalidResponse;

  /// No description provided for @chatErrorStreamInProgress.
  ///
  /// In de, this message translates to:
  /// **'Eine Antwort wird bereits generiert.'**
  String get chatErrorStreamInProgress;

  /// No description provided for @chatGenericError.
  ///
  /// In de, this message translates to:
  /// **'Etwas ist schiefgelaufen. Bitte erneut versuchen.'**
  String get chatGenericError;

  /// No description provided for @quizEmptyHint.
  ///
  /// In de, this message translates to:
  /// **'Bitten Sie Lucy im Chat, ein Quiz zu erstellen.'**
  String get quizEmptyHint;

  /// No description provided for @quizLibraryEmptyHint.
  ///
  /// In de, this message translates to:
  /// **'Bitten Sie Lucy im Chat, ein Quiz oder Karteikarten zu erstellen.'**
  String get quizLibraryEmptyHint;

  /// No description provided for @quizLibraryHistoryTitle.
  ///
  /// In de, this message translates to:
  /// **'Verlauf'**
  String get quizLibraryHistoryTitle;

  /// No description provided for @quizLibraryDateToday.
  ///
  /// In de, this message translates to:
  /// **'Heute'**
  String get quizLibraryDateToday;

  /// No description provided for @quizLibraryDateYesterday.
  ///
  /// In de, this message translates to:
  /// **'Gestern'**
  String get quizLibraryDateYesterday;

  /// No description provided for @quizLibraryDeleteConfirmTitle.
  ///
  /// In de, this message translates to:
  /// **'Sitzung löschen?'**
  String get quizLibraryDeleteConfirmTitle;

  /// No description provided for @quizLibraryDeleteConfirmMessage.
  ///
  /// In de, this message translates to:
  /// **'« {title} » löschen? Diese Aktion kann nicht rückgängig gemacht werden.'**
  String quizLibraryDeleteConfirmMessage(String title);

  /// No description provided for @quizLibraryDeleteAction.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get quizLibraryDeleteAction;

  /// No description provided for @quizLibraryDeleteCancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get quizLibraryDeleteCancel;

  /// No description provided for @quizComingSoon.
  ///
  /// In de, this message translates to:
  /// **'Die Quiz-Generierung kommt bald.'**
  String get quizComingSoon;

  /// No description provided for @quizSessionQuestionCount.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, one{{count} Frage} other{{count} Fragen}}'**
  String quizSessionQuestionCount(int count);

  /// No description provided for @quizSessionFlashcardCount.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, one{{count} Karte} other{{count} Karten}}'**
  String quizSessionFlashcardCount(int count);

  /// No description provided for @quizSessionPlaceholderMessage.
  ///
  /// In de, this message translates to:
  /// **'Diese Sitzung wird hier bald geöffnet.'**
  String get quizSessionPlaceholderMessage;

  /// No description provided for @chatLearningSessionCardTitle.
  ///
  /// In de, this message translates to:
  /// **'Quiz bereit'**
  String get chatLearningSessionCardTitle;

  /// No description provided for @chatLearningSessionFlashcardsCardTitle.
  ///
  /// In de, this message translates to:
  /// **'Karteikarten bereit'**
  String get chatLearningSessionFlashcardsCardTitle;

  /// No description provided for @chatLearningSessionOpen.
  ///
  /// In de, this message translates to:
  /// **'Öffnen'**
  String get chatLearningSessionOpen;

  /// No description provided for @flashcardsSessionProgress.
  ///
  /// In de, this message translates to:
  /// **'Karte {current} / {total}'**
  String flashcardsSessionProgress(int current, int total);

  /// No description provided for @flashcardsSessionFront.
  ///
  /// In de, this message translates to:
  /// **'Vorderseite'**
  String get flashcardsSessionFront;

  /// No description provided for @flashcardsSessionBack.
  ///
  /// In de, this message translates to:
  /// **'Rückseite'**
  String get flashcardsSessionBack;

  /// No description provided for @flashcardsSessionTapToFlip.
  ///
  /// In de, this message translates to:
  /// **'Tippen zum Umdrehen'**
  String get flashcardsSessionTapToFlip;

  /// No description provided for @flashcardsSessionPrevious.
  ///
  /// In de, this message translates to:
  /// **'Zurück'**
  String get flashcardsSessionPrevious;

  /// No description provided for @flashcardsSessionNext.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get flashcardsSessionNext;

  /// No description provided for @quizSessionProgress.
  ///
  /// In de, this message translates to:
  /// **'Frage {current} / {total}'**
  String quizSessionProgress(int current, int total);

  /// No description provided for @quizSessionCorrect.
  ///
  /// In de, this message translates to:
  /// **'Richtig!'**
  String get quizSessionCorrect;

  /// No description provided for @quizSessionIncorrect.
  ///
  /// In de, this message translates to:
  /// **'Falsch'**
  String get quizSessionIncorrect;

  /// No description provided for @quizSessionNextQuestion.
  ///
  /// In de, this message translates to:
  /// **'Nächste Frage'**
  String get quizSessionNextQuestion;

  /// No description provided for @quizSessionFinish.
  ///
  /// In de, this message translates to:
  /// **'Ergebnis ansehen'**
  String get quizSessionFinish;

  /// No description provided for @quizSessionScore.
  ///
  /// In de, this message translates to:
  /// **'Punkte: {correct} / {total}'**
  String quizSessionScore(int correct, int total);

  /// No description provided for @quizNoCorpusTitle.
  ///
  /// In de, this message translates to:
  /// **'Keine aktiven Dokumente'**
  String get quizNoCorpusTitle;

  /// No description provided for @quizNoCorpusMessage.
  ///
  /// In de, this message translates to:
  /// **'Aktivieren Sie die Suche für mindestens ein fertiges Dokument, um ein Quiz zu erstellen.'**
  String get quizNoCorpusMessage;

  /// No description provided for @quizNoCorpusCta.
  ///
  /// In de, this message translates to:
  /// **'Zu den Dokumenten'**
  String get quizNoCorpusCta;

  /// No description provided for @quizLoading.
  ///
  /// In de, this message translates to:
  /// **'Laden…'**
  String get quizLoading;

  /// No description provided for @quizGenericError.
  ///
  /// In de, this message translates to:
  /// **'Etwas ist schiefgelaufen. Bitte erneut versuchen.'**
  String get quizGenericError;

  /// No description provided for @learningSessionNotFound.
  ///
  /// In de, this message translates to:
  /// **'Diese Sitzung wurde nicht gefunden.'**
  String get learningSessionNotFound;

  /// No description provided for @learningSessionGenerationFailed.
  ///
  /// In de, this message translates to:
  /// **'Die Generierung ist fehlgeschlagen. Versuchen Sie es erneut im Chat.'**
  String get learningSessionGenerationFailed;

  /// No description provided for @learningSessionValidationError.
  ///
  /// In de, this message translates to:
  /// **'Die Generierungsanfrage ist ungültig.'**
  String get learningSessionValidationError;

  /// No description provided for @learningGenericError.
  ///
  /// In de, this message translates to:
  /// **'Etwas ist schiefgelaufen. Bitte erneut versuchen.'**
  String get learningGenericError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
