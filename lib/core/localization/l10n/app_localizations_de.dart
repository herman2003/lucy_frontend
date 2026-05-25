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
}
