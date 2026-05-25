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
}
