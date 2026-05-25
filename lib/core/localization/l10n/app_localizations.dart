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
