// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Lucy';

  @override
  String get splashLoading => 'Chargement…';

  @override
  String get authLoginBrandingTitle => 'Votre tuteur IA personnel';

  @override
  String get authLoginBrandingSubtitle =>
      'Progressez à votre rythme avec un accompagnement sur mesure.';

  @override
  String get authLoginTitle => 'Connexion';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'vous@exemple.com';

  @override
  String get authPasswordLabel => 'Mot de passe';

  @override
  String get authPasswordHint => 'Entrez votre mot de passe';

  @override
  String get authEmailRequired => 'L’email est requis.';

  @override
  String get authPasswordRequired => 'Le mot de passe est requis.';

  @override
  String get authLoginButton => 'Se connecter';

  @override
  String get authForgotPasswordPrompt => 'Mot de passe oublié ?';

  @override
  String get authForgotPasswordLink => 'Réinitialiser';

  @override
  String get authNoAccountPrompt => 'Pas encore de compte ?';

  @override
  String get authSignUpLink => 'Créer un compte';

  @override
  String get authSignUpBrandingTitle => 'Rejoignez Lucy';

  @override
  String get authSignUpBrandingSubtitle =>
      'Créez votre compte et commencez à apprendre avec votre tuteur IA.';

  @override
  String get authSignUpTitle => 'Créer un compte';

  @override
  String get authFullNameLabel => 'Nom complet';

  @override
  String get authFullNameHint => 'Votre nom';

  @override
  String get authFullNameRequired => 'Le nom complet est requis.';

  @override
  String get authSignUpButton => 'Créer mon compte';

  @override
  String get authAlreadyHaveAccountPrompt => 'Déjà un compte ?';

  @override
  String get authLoginLink => 'Se connecter';

  @override
  String get authResetBrandingTitle => 'Réinitialisez votre mot de passe';

  @override
  String get authResetBrandingSubtitle =>
      'Recevez un lien sécurisé par e-mail pour choisir un nouveau mot de passe.';

  @override
  String get authResetTitle => 'Mot de passe oublié';

  @override
  String get authResetSubtitle =>
      'Saisissez votre adresse e-mail pour recevoir un lien de réinitialisation.';

  @override
  String get authResetButton => 'Envoyer le lien';

  @override
  String get authResetSuccessTitle => 'Vérifiez votre e-mail';

  @override
  String authResetSuccessMessage(String email) {
    return 'Si un compte est associé à $email, vous recevrez un e-mail pour réinitialiser votre mot de passe.';
  }

  @override
  String get authResetTryAgain => 'Réessayer';

  @override
  String get authResetBackToLogin => 'Retour à la connexion';

  @override
  String get homeWelcome => 'Bienvenue sur Lucy';

  @override
  String get homeLogout => 'Se déconnecter';

  @override
  String get authUnknownError => 'Une erreur est survenue. Réessayez.';

  @override
  String get authUserNotFound => 'Aucun compte ne correspond à cet email.';

  @override
  String get authWrongPassword => 'Mot de passe incorrect.';

  @override
  String get authInvalidCredentials => 'Email ou mot de passe incorrect.';

  @override
  String get authEmailAlreadyInUse => 'Cet email est déjà utilisé.';

  @override
  String get authWeakPassword => 'Le mot de passe est trop faible.';

  @override
  String get authInvalidEmail => 'Adresse email invalide.';

  @override
  String get authNetworkError =>
      'Problème de connexion. Vérifiez votre réseau.';

  @override
  String get authTooManyRequests => 'Trop de tentatives. Réessayez plus tard.';

  @override
  String get authUserDisabled => 'Ce compte a été désactivé.';

  @override
  String get authOperationNotAllowed => 'Cette opération n’est pas autorisée.';

  @override
  String get authProfileWriteFailed =>
      'Impossible d’enregistrer votre profil. Réessayez.';

  @override
  String get onboardingPlaceholderTitle =>
      'Configuration de votre profil apprenant';

  @override
  String get onboardingQuestionQRole =>
      'Parlez-moi de votre situation : êtes-vous étudiant·e, en reconversion, ou apprenez-vous de votre côté ?';

  @override
  String get onboardingQuestionQDomains =>
      'Quels sujets ou domaines allez-vous travailler avec moi ?';

  @override
  String get onboardingQuestionQGoal =>
      'Quel est votre objectif principal avec moi ?';

  @override
  String get onboardingQuestionQLevel =>
      'Comment décririez-vous votre niveau aujourd’hui ?';

  @override
  String get onboardingQuestionQStyle =>
      'Comment aimez-vous qu’on vous explique les notions ?';

  @override
  String get onboardingQuestionQTone =>
      'Quel ton préférez-vous pour les corrections et le feedback ?';

  @override
  String get onboardingQuestionQLanguage =>
      'Dans quelle langue dois-je vous expliquer les cours ?';

  @override
  String get onboardingSendAnswer => 'Envoyer';

  @override
  String onboardingStepProgress(int current, int total) {
    return '$current / $total';
  }

  @override
  String get onboardingStepLocked =>
      'Terminez l’étape en cours avant de continuer.';

  @override
  String get onboardingLucyTyping => 'Lucy écrit…';

  @override
  String get onboardingStepReadOnly => 'Étape terminée — consultation seule.';

  @override
  String get onboardingStepEdit => 'Modifier cette étape';

  @override
  String get onboardingRegenerateProfile => 'Regénérer le profil';

  @override
  String get onboardingConfirmTurn => 'C’est bon';

  @override
  String get onboardingRejectTurn => 'Ce n’est pas ça';

  @override
  String get onboardingGenericError => 'Une erreur est survenue. Réessayez.';

  @override
  String get onboardingErrorUnauthorized =>
      'Votre session a expiré. Reconnectez-vous.';

  @override
  String get onboardingErrorValidation => 'Requête invalide. Réessayez.';

  @override
  String get onboardingErrorAlreadyComplete =>
      'Votre profil est déjà configuré.';

  @override
  String get onboardingErrorTranscriptIncomplete =>
      'Terminez les 7 questions avant de lancer l’analyse.';

  @override
  String get onboardingErrorProfileIncomplete =>
      'Le profil généré est incomplet. Réessayez ou modifiez vos réponses.';

  @override
  String get onboardingErrorPendingProfileMissing =>
      'Aucun profil en attente de validation. Relancez l’analyse.';

  @override
  String get onboardingErrorLlmInvalid =>
      'Lucy n’a pas pu interpréter la réponse. Réessayez dans un instant.';

  @override
  String get onboardingErrorLlmUnavailable =>
      'Lucy est temporairement indisponible. Réessayez plus tard.';

  @override
  String get onboardingErrorInternal => 'Une erreur est survenue. Réessayez.';

  @override
  String get onboardingAnswerRequired => 'Répondez avant d’envoyer.';

  @override
  String get onboardingAnswerTooLong =>
      'Votre réponse est trop longue (2000 caractères maximum).';

  @override
  String get onboardingAnswerHint => 'Votre réponse…';

  @override
  String get onboardingAnalysisReadyHint =>
      'Analyse terminée. L’écran de confirmation arrive bientôt.';

  @override
  String get onboardingConfirmTitle => 'Votre profil apprenant';

  @override
  String get onboardingConfirmSummaryHeading => 'Ce que Lucy a retenu';

  @override
  String get onboardingConfirmAccept => 'Valider et continuer';

  @override
  String get onboardingConfirmEdit => 'Modifier mes réponses';

  @override
  String get onboardingConfirmMissingAnalysis =>
      'Aucune analyse disponible. Terminez d’abord le questionnaire.';

  @override
  String get onboardingProfileLabelPrimaryRole => 'Situation';

  @override
  String get onboardingProfileLabelMainDomains => 'Domaines';

  @override
  String get onboardingProfileLabelLearningGoal => 'Objectif';

  @override
  String get onboardingProfileLabelSelfAssessedLevel => 'Niveau';

  @override
  String get onboardingProfileLabelExplanationStyle => 'Style d’explication';

  @override
  String get onboardingProfileLabelFeedbackTone => 'Ton du feedback';

  @override
  String get onboardingProfileLabelTutoringLanguage =>
      'Langue des explications';

  @override
  String get onboardingEnumPrimaryRoleStudent => 'Étudiant·e';

  @override
  String get onboardingEnumPrimaryRoleProfessional => 'Professionnel·le';

  @override
  String get onboardingEnumPrimaryRoleEducator => 'Enseignant·e';

  @override
  String get onboardingEnumPrimaryRoleSelfLearner => 'Apprentissage autonome';

  @override
  String get onboardingEnumPrimaryRoleOther => 'Autre';

  @override
  String get onboardingEnumDomainSciences => 'Sciences';

  @override
  String get onboardingEnumDomainLaw => 'Droit';

  @override
  String get onboardingEnumDomainMedicine => 'Médecine';

  @override
  String get onboardingEnumDomainLanguages => 'Langues';

  @override
  String get onboardingEnumDomainBusiness => 'Commerce / gestion';

  @override
  String get onboardingEnumDomainCs => 'Informatique';

  @override
  String get onboardingEnumDomainOther => 'Autre';

  @override
  String get onboardingEnumLearningGoalExam => 'Préparer un examen';

  @override
  String get onboardingEnumLearningGoalUnderstandCourse =>
      'Mieux comprendre un cours';

  @override
  String get onboardingEnumLearningGoalQuickReview => 'Révision rapide';

  @override
  String get onboardingEnumLearningGoalProfessional =>
      'Montée en compétences pro';

  @override
  String get onboardingEnumLearningGoalCertification => 'Certification';

  @override
  String get onboardingEnumLearningGoalOther => 'Autre';

  @override
  String get onboardingEnumLevelBeginner => 'Débutant';

  @override
  String get onboardingEnumLevelIntermediate => 'Intermédiaire';

  @override
  String get onboardingEnumLevelAdvanced => 'Avancé';

  @override
  String get onboardingEnumLevelVariable => 'Variable selon les sujets';

  @override
  String get onboardingEnumStyleStepByStep => 'Étape par étape';

  @override
  String get onboardingEnumStyleSummaryFirst => 'Résumé d’abord';

  @override
  String get onboardingEnumStyleAnalogies => 'Analogies';

  @override
  String get onboardingEnumStyleSocratic => 'Questions guidées';

  @override
  String get onboardingEnumToneEncouraging => 'Encourageant';

  @override
  String get onboardingEnumToneNeutral => 'Neutre';

  @override
  String get onboardingEnumToneStrict => 'Exigeant';

  @override
  String get onboardingEnumTutoringLangFr => 'Français';

  @override
  String get onboardingEnumTutoringLangEn => 'Anglais';

  @override
  String get onboardingEnumTutoringLangDe => 'Allemand';

  @override
  String get onboardingEnumTutoringLangMatchDocument => 'Langue du document';
}
