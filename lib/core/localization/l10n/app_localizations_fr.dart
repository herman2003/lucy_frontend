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
}
