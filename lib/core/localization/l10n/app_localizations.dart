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
    Locale('fr'),
    Locale('en'),
    Locale('de'),
  ];

  /// Application title
  ///
  /// In fr, this message translates to:
  /// **'Lucy'**
  String get appTitle;

  /// Splash screen loading message
  ///
  /// In fr, this message translates to:
  /// **'Chargement…'**
  String get splashLoading;

  /// Login web branding headline
  ///
  /// In fr, this message translates to:
  /// **'Votre tuteur IA personnel'**
  String get authLoginBrandingTitle;

  /// Login web branding subtitle
  ///
  /// In fr, this message translates to:
  /// **'Progressez à votre rythme avec un accompagnement sur mesure.'**
  String get authLoginBrandingSubtitle;

  /// Login form title
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get authLoginTitle;

  /// Email field label
  ///
  /// In fr, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// Email field hint
  ///
  /// In fr, this message translates to:
  /// **'vous@exemple.com'**
  String get authEmailHint;

  /// Password field label
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get authPasswordLabel;

  /// Password field hint
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre mot de passe'**
  String get authPasswordHint;

  /// Validation when email is empty
  ///
  /// In fr, this message translates to:
  /// **'L’email est requis.'**
  String get authEmailRequired;

  /// Validation when password is empty
  ///
  /// In fr, this message translates to:
  /// **'Le mot de passe est requis.'**
  String get authPasswordRequired;

  /// Login submit button
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get authLoginButton;

  /// Forgot password prompt before link
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get authForgotPasswordPrompt;

  /// Link to reset password page
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get authForgotPasswordLink;

  /// Sign up prompt before link
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ?'**
  String get authNoAccountPrompt;

  /// Link to sign up page
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get authSignUpLink;

  /// Sign up web branding headline
  ///
  /// In fr, this message translates to:
  /// **'Rejoignez Lucy'**
  String get authSignUpBrandingTitle;

  /// Sign up web branding subtitle
  ///
  /// In fr, this message translates to:
  /// **'Créez votre compte et commencez à apprendre avec votre tuteur IA.'**
  String get authSignUpBrandingSubtitle;

  /// Sign up form title
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get authSignUpTitle;

  /// Full name field label
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get authFullNameLabel;

  /// Full name field hint
  ///
  /// In fr, this message translates to:
  /// **'Votre nom'**
  String get authFullNameHint;

  /// Validation when full name is empty
  ///
  /// In fr, this message translates to:
  /// **'Le nom complet est requis.'**
  String get authFullNameRequired;

  /// Sign up submit button
  ///
  /// In fr, this message translates to:
  /// **'Créer mon compte'**
  String get authSignUpButton;

  /// Login prompt before link on sign up
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ?'**
  String get authAlreadyHaveAccountPrompt;

  /// Link to login page from sign up
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get authLoginLink;

  /// Reset password web branding headline
  ///
  /// In fr, this message translates to:
  /// **'Réinitialisez votre mot de passe'**
  String get authResetBrandingTitle;

  /// Reset password web branding subtitle
  ///
  /// In fr, this message translates to:
  /// **'Recevez un lien sécurisé par e-mail pour choisir un nouveau mot de passe.'**
  String get authResetBrandingSubtitle;

  /// Reset password form title
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié'**
  String get authResetTitle;

  /// Reset password form subtitle
  ///
  /// In fr, this message translates to:
  /// **'Saisissez votre adresse e-mail pour recevoir un lien de réinitialisation.'**
  String get authResetSubtitle;

  /// Reset password submit button
  ///
  /// In fr, this message translates to:
  /// **'Envoyer le lien'**
  String get authResetButton;

  /// Reset password success title
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez votre e-mail'**
  String get authResetSuccessTitle;

  /// Reset success message (anti-enumeration)
  ///
  /// In fr, this message translates to:
  /// **'Si un compte est associé à {email}, vous recevrez un e-mail pour réinitialiser votre mot de passe.'**
  String authResetSuccessMessage(String email);

  /// Return to reset form from success
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get authResetTryAgain;

  /// Navigate back to login from reset success
  ///
  /// In fr, this message translates to:
  /// **'Retour à la connexion'**
  String get authResetBackToLogin;

  /// Home placeholder title
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur Lucy'**
  String get homeWelcome;

  /// Logout button on home
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get homeLogout;

  /// Generic auth error
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Réessayez.'**
  String get authUnknownError;

  /// Firebase user-not-found
  ///
  /// In fr, this message translates to:
  /// **'Aucun compte ne correspond à cet email.'**
  String get authUserNotFound;

  /// Firebase wrong-password
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe incorrect.'**
  String get authWrongPassword;

  /// Firebase invalid-credential
  ///
  /// In fr, this message translates to:
  /// **'Email ou mot de passe incorrect.'**
  String get authInvalidCredentials;

  /// Firebase email-already-in-use
  ///
  /// In fr, this message translates to:
  /// **'Cet email est déjà utilisé.'**
  String get authEmailAlreadyInUse;

  /// Firebase weak-password
  ///
  /// In fr, this message translates to:
  /// **'Le mot de passe est trop faible.'**
  String get authWeakPassword;

  /// Firebase invalid-email
  ///
  /// In fr, this message translates to:
  /// **'Adresse email invalide.'**
  String get authInvalidEmail;

  /// Firebase network-request-failed
  ///
  /// In fr, this message translates to:
  /// **'Problème de connexion. Vérifiez votre réseau.'**
  String get authNetworkError;

  /// Firebase too-many-requests
  ///
  /// In fr, this message translates to:
  /// **'Trop de tentatives. Réessayez plus tard.'**
  String get authTooManyRequests;

  /// Firebase user-disabled
  ///
  /// In fr, this message translates to:
  /// **'Ce compte a été désactivé.'**
  String get authUserDisabled;

  /// Firebase operation-not-allowed
  ///
  /// In fr, this message translates to:
  /// **'Cette opération n’est pas autorisée.'**
  String get authOperationNotAllowed;

  /// Firestore profile write failed after signup
  ///
  /// In fr, this message translates to:
  /// **'Impossible d’enregistrer votre profil. Réessayez.'**
  String get authProfileWriteFailed;

  /// Onboarding placeholder screen until chat UI is implemented
  ///
  /// In fr, this message translates to:
  /// **'Configuration de votre profil apprenant'**
  String get onboardingPlaceholderTitle;

  /// Onboarding question q_role (primary_role)
  ///
  /// In fr, this message translates to:
  /// **'Parlez-moi de votre situation : êtes-vous étudiant·e, en reconversion, ou apprenez-vous de votre côté ?'**
  String get onboardingQuestionQRole;

  /// Onboarding question q_domains
  ///
  /// In fr, this message translates to:
  /// **'Quels sujets ou domaines allez-vous travailler avec moi ?'**
  String get onboardingQuestionQDomains;

  /// Onboarding question q_goal
  ///
  /// In fr, this message translates to:
  /// **'Quel est votre objectif principal avec moi ?'**
  String get onboardingQuestionQGoal;

  /// Onboarding question q_level
  ///
  /// In fr, this message translates to:
  /// **'Comment décririez-vous votre niveau aujourd’hui ?'**
  String get onboardingQuestionQLevel;

  /// Onboarding question q_style
  ///
  /// In fr, this message translates to:
  /// **'Comment aimez-vous qu’on vous explique les notions ?'**
  String get onboardingQuestionQStyle;

  /// Onboarding question q_tone
  ///
  /// In fr, this message translates to:
  /// **'Quel ton préférez-vous pour les corrections et le feedback ?'**
  String get onboardingQuestionQTone;

  /// Onboarding question q_language
  ///
  /// In fr, this message translates to:
  /// **'Dans quelle langue dois-je vous expliquer les cours ?'**
  String get onboardingQuestionQLanguage;

  /// Send answer button on onboarding chat
  ///
  /// In fr, this message translates to:
  /// **'Envoyer'**
  String get onboardingSendAnswer;

  /// Step indicator on onboarding chat
  ///
  /// In fr, this message translates to:
  /// **'{current} / {total}'**
  String onboardingStepProgress(int current, int total);

  /// User confirms Lucy understood the answer
  ///
  /// In fr, this message translates to:
  /// **'C’est bon'**
  String get onboardingConfirmTurn;

  /// User rejects Lucy summary and re-enters answer
  ///
  /// In fr, this message translates to:
  /// **'Ce n’est pas ça'**
  String get onboardingRejectTurn;

  /// Generic onboarding API error
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Réessayez.'**
  String get onboardingGenericError;

  /// No description provided for @onboardingErrorUnauthorized.
  ///
  /// In fr, this message translates to:
  /// **'Votre session a expiré. Reconnectez-vous.'**
  String get onboardingErrorUnauthorized;

  /// No description provided for @onboardingErrorValidation.
  ///
  /// In fr, this message translates to:
  /// **'Requête invalide. Réessayez.'**
  String get onboardingErrorValidation;

  /// No description provided for @onboardingErrorAlreadyComplete.
  ///
  /// In fr, this message translates to:
  /// **'Votre profil est déjà configuré.'**
  String get onboardingErrorAlreadyComplete;

  /// No description provided for @onboardingErrorTranscriptIncomplete.
  ///
  /// In fr, this message translates to:
  /// **'Terminez les 7 questions avant de lancer l’analyse.'**
  String get onboardingErrorTranscriptIncomplete;

  /// No description provided for @onboardingErrorProfileIncomplete.
  ///
  /// In fr, this message translates to:
  /// **'Le profil généré est incomplet. Réessayez ou modifiez vos réponses.'**
  String get onboardingErrorProfileIncomplete;

  /// No description provided for @onboardingErrorPendingProfileMissing.
  ///
  /// In fr, this message translates to:
  /// **'Aucun profil en attente de validation. Relancez l’analyse.'**
  String get onboardingErrorPendingProfileMissing;

  /// No description provided for @onboardingErrorLlmInvalid.
  ///
  /// In fr, this message translates to:
  /// **'Lucy n’a pas pu interpréter la réponse. Réessayez dans un instant.'**
  String get onboardingErrorLlmInvalid;

  /// No description provided for @onboardingErrorLlmUnavailable.
  ///
  /// In fr, this message translates to:
  /// **'Lucy est temporairement indisponible. Réessayez plus tard.'**
  String get onboardingErrorLlmUnavailable;

  /// No description provided for @onboardingErrorInternal.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue. Réessayez.'**
  String get onboardingErrorInternal;

  /// Empty answer validation
  ///
  /// In fr, this message translates to:
  /// **'Répondez avant d’envoyer.'**
  String get onboardingAnswerRequired;

  /// Answer exceeds max length
  ///
  /// In fr, this message translates to:
  /// **'Votre réponse est trop longue (2000 caractères maximum).'**
  String get onboardingAnswerTooLong;

  /// Chat answer field hint
  ///
  /// In fr, this message translates to:
  /// **'Votre réponse…'**
  String get onboardingAnswerHint;

  /// Hint after analyze completes (F07 will replace with confirm page)
  ///
  /// In fr, this message translates to:
  /// **'Analyse terminée. L’écran de confirmation arrive bientôt.'**
  String get onboardingAnalysisReadyHint;

  /// No description provided for @onboardingConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Votre profil apprenant'**
  String get onboardingConfirmTitle;

  /// No description provided for @onboardingConfirmSummaryHeading.
  ///
  /// In fr, this message translates to:
  /// **'Ce que Lucy a retenu'**
  String get onboardingConfirmSummaryHeading;

  /// No description provided for @onboardingConfirmAccept.
  ///
  /// In fr, this message translates to:
  /// **'Valider et continuer'**
  String get onboardingConfirmAccept;

  /// No description provided for @onboardingConfirmEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier mes réponses'**
  String get onboardingConfirmEdit;

  /// No description provided for @onboardingConfirmMissingAnalysis.
  ///
  /// In fr, this message translates to:
  /// **'Aucune analyse disponible. Terminez d’abord le questionnaire.'**
  String get onboardingConfirmMissingAnalysis;

  /// No description provided for @onboardingProfileLabelPrimaryRole.
  ///
  /// In fr, this message translates to:
  /// **'Situation'**
  String get onboardingProfileLabelPrimaryRole;

  /// No description provided for @onboardingProfileLabelMainDomains.
  ///
  /// In fr, this message translates to:
  /// **'Domaines'**
  String get onboardingProfileLabelMainDomains;

  /// No description provided for @onboardingProfileLabelLearningGoal.
  ///
  /// In fr, this message translates to:
  /// **'Objectif'**
  String get onboardingProfileLabelLearningGoal;

  /// No description provided for @onboardingProfileLabelSelfAssessedLevel.
  ///
  /// In fr, this message translates to:
  /// **'Niveau'**
  String get onboardingProfileLabelSelfAssessedLevel;

  /// No description provided for @onboardingProfileLabelExplanationStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style d’explication'**
  String get onboardingProfileLabelExplanationStyle;

  /// No description provided for @onboardingProfileLabelFeedbackTone.
  ///
  /// In fr, this message translates to:
  /// **'Ton du feedback'**
  String get onboardingProfileLabelFeedbackTone;

  /// No description provided for @onboardingProfileLabelTutoringLanguage.
  ///
  /// In fr, this message translates to:
  /// **'Langue des explications'**
  String get onboardingProfileLabelTutoringLanguage;

  /// No description provided for @onboardingEnumPrimaryRoleStudent.
  ///
  /// In fr, this message translates to:
  /// **'Étudiant·e'**
  String get onboardingEnumPrimaryRoleStudent;

  /// No description provided for @onboardingEnumPrimaryRoleProfessional.
  ///
  /// In fr, this message translates to:
  /// **'Professionnel·le'**
  String get onboardingEnumPrimaryRoleProfessional;

  /// No description provided for @onboardingEnumPrimaryRoleEducator.
  ///
  /// In fr, this message translates to:
  /// **'Enseignant·e'**
  String get onboardingEnumPrimaryRoleEducator;

  /// No description provided for @onboardingEnumPrimaryRoleSelfLearner.
  ///
  /// In fr, this message translates to:
  /// **'Apprentissage autonome'**
  String get onboardingEnumPrimaryRoleSelfLearner;

  /// No description provided for @onboardingEnumPrimaryRoleOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get onboardingEnumPrimaryRoleOther;

  /// No description provided for @onboardingEnumDomainSciences.
  ///
  /// In fr, this message translates to:
  /// **'Sciences'**
  String get onboardingEnumDomainSciences;

  /// No description provided for @onboardingEnumDomainLaw.
  ///
  /// In fr, this message translates to:
  /// **'Droit'**
  String get onboardingEnumDomainLaw;

  /// No description provided for @onboardingEnumDomainMedicine.
  ///
  /// In fr, this message translates to:
  /// **'Médecine'**
  String get onboardingEnumDomainMedicine;

  /// No description provided for @onboardingEnumDomainLanguages.
  ///
  /// In fr, this message translates to:
  /// **'Langues'**
  String get onboardingEnumDomainLanguages;

  /// No description provided for @onboardingEnumDomainBusiness.
  ///
  /// In fr, this message translates to:
  /// **'Commerce / gestion'**
  String get onboardingEnumDomainBusiness;

  /// No description provided for @onboardingEnumDomainCs.
  ///
  /// In fr, this message translates to:
  /// **'Informatique'**
  String get onboardingEnumDomainCs;

  /// No description provided for @onboardingEnumDomainOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get onboardingEnumDomainOther;

  /// No description provided for @onboardingEnumLearningGoalExam.
  ///
  /// In fr, this message translates to:
  /// **'Préparer un examen'**
  String get onboardingEnumLearningGoalExam;

  /// No description provided for @onboardingEnumLearningGoalUnderstandCourse.
  ///
  /// In fr, this message translates to:
  /// **'Mieux comprendre un cours'**
  String get onboardingEnumLearningGoalUnderstandCourse;

  /// No description provided for @onboardingEnumLearningGoalQuickReview.
  ///
  /// In fr, this message translates to:
  /// **'Révision rapide'**
  String get onboardingEnumLearningGoalQuickReview;

  /// No description provided for @onboardingEnumLearningGoalProfessional.
  ///
  /// In fr, this message translates to:
  /// **'Montée en compétences pro'**
  String get onboardingEnumLearningGoalProfessional;

  /// No description provided for @onboardingEnumLearningGoalCertification.
  ///
  /// In fr, this message translates to:
  /// **'Certification'**
  String get onboardingEnumLearningGoalCertification;

  /// No description provided for @onboardingEnumLearningGoalOther.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get onboardingEnumLearningGoalOther;

  /// No description provided for @onboardingEnumLevelBeginner.
  ///
  /// In fr, this message translates to:
  /// **'Débutant'**
  String get onboardingEnumLevelBeginner;

  /// No description provided for @onboardingEnumLevelIntermediate.
  ///
  /// In fr, this message translates to:
  /// **'Intermédiaire'**
  String get onboardingEnumLevelIntermediate;

  /// No description provided for @onboardingEnumLevelAdvanced.
  ///
  /// In fr, this message translates to:
  /// **'Avancé'**
  String get onboardingEnumLevelAdvanced;

  /// No description provided for @onboardingEnumLevelVariable.
  ///
  /// In fr, this message translates to:
  /// **'Variable selon les sujets'**
  String get onboardingEnumLevelVariable;

  /// No description provided for @onboardingEnumStyleStepByStep.
  ///
  /// In fr, this message translates to:
  /// **'Étape par étape'**
  String get onboardingEnumStyleStepByStep;

  /// No description provided for @onboardingEnumStyleSummaryFirst.
  ///
  /// In fr, this message translates to:
  /// **'Résumé d’abord'**
  String get onboardingEnumStyleSummaryFirst;

  /// No description provided for @onboardingEnumStyleAnalogies.
  ///
  /// In fr, this message translates to:
  /// **'Analogies'**
  String get onboardingEnumStyleAnalogies;

  /// No description provided for @onboardingEnumStyleSocratic.
  ///
  /// In fr, this message translates to:
  /// **'Questions guidées'**
  String get onboardingEnumStyleSocratic;

  /// No description provided for @onboardingEnumToneEncouraging.
  ///
  /// In fr, this message translates to:
  /// **'Encourageant'**
  String get onboardingEnumToneEncouraging;

  /// No description provided for @onboardingEnumToneNeutral.
  ///
  /// In fr, this message translates to:
  /// **'Neutre'**
  String get onboardingEnumToneNeutral;

  /// No description provided for @onboardingEnumToneStrict.
  ///
  /// In fr, this message translates to:
  /// **'Exigeant'**
  String get onboardingEnumToneStrict;

  /// No description provided for @onboardingEnumTutoringLangFr.
  ///
  /// In fr, this message translates to:
  /// **'Français'**
  String get onboardingEnumTutoringLangFr;

  /// No description provided for @onboardingEnumTutoringLangEn.
  ///
  /// In fr, this message translates to:
  /// **'Anglais'**
  String get onboardingEnumTutoringLangEn;

  /// No description provided for @onboardingEnumTutoringLangDe.
  ///
  /// In fr, this message translates to:
  /// **'Allemand'**
  String get onboardingEnumTutoringLangDe;

  /// No description provided for @onboardingEnumTutoringLangMatchDocument.
  ///
  /// In fr, this message translates to:
  /// **'Langue du document'**
  String get onboardingEnumTutoringLangMatchDocument;
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
