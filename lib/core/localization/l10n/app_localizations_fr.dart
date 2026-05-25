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
}
