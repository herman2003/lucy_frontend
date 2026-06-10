import '../../../core/localization/l10n/app_localizations.dart';
import '../../../core/localization/lucy_locale_resolution.dart';

/// Human-readable UI locale label for the settings screen.
abstract final class SettingsUiLocaleL10n {
  static String label(AppLocalizations l10n, String? code) {
    final resolved = code ?? kLucyAppLocale.languageCode;
    return switch (resolved) {
      'fr' => l10n.onboardingEnumTutoringLangFr,
      'en' => l10n.onboardingEnumTutoringLangEn,
      'de' => l10n.onboardingEnumTutoringLangDe,
      _ => resolved,
    };
  }
}
