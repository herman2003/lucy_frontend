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
  String get authUnknownError =>
      'Ein Fehler ist aufgetreten. Bitte erneut versuchen.';

  @override
  String get authUserNotFound => 'Kein Konto mit dieser E-Mail gefunden.';

  @override
  String get authWrongPassword => 'Falsches Passwort.';

  @override
  String get authInvalidCredentials => 'E-Mail oder Passwort falsch.';

  @override
  String get authEmailAlreadyInUse => 'Diese E-Mail wird bereits verwendet.';

  @override
  String get authWeakPassword => 'Das Passwort ist zu schwach.';

  @override
  String get authInvalidEmail => 'Ungültige E-Mail-Adresse.';

  @override
  String get authNetworkError => 'Verbindungsproblem. Netzwerk prüfen.';

  @override
  String get authTooManyRequests =>
      'Zu viele Versuche. Später erneut versuchen.';

  @override
  String get authUserDisabled => 'Dieses Konto wurde deaktiviert.';

  @override
  String get authOperationNotAllowed => 'Diese Operation ist nicht erlaubt.';

  @override
  String get authProfileWriteFailed =>
      'Profil konnte nicht gespeichert werden. Bitte erneut versuchen.';
}
