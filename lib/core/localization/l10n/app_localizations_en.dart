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
  String get authLoginBrandingTitle => 'Your personal AI tutor';

  @override
  String get authLoginBrandingSubtitle =>
      'Learn at your own pace with tailored guidance.';

  @override
  String get authLoginTitle => 'Log in';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'you@example.com';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordHint => 'Enter your password';

  @override
  String get authEmailRequired => 'Email is required.';

  @override
  String get authPasswordRequired => 'Password is required.';

  @override
  String get authLoginButton => 'Log in';

  @override
  String get authForgotPasswordPrompt => 'Forgot password?';

  @override
  String get authForgotPasswordLink => 'Reset';

  @override
  String get authNoAccountPrompt => 'Don\'t have an account?';

  @override
  String get authSignUpLink => 'Sign up';

  @override
  String get homeWelcome => 'Welcome to Lucy';

  @override
  String get homeLogout => 'Log out';

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
