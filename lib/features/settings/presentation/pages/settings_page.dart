import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/constants/responsive_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../utils/settings_error_translator.dart';
import '../../utils/settings_ui_locale_l10n.dart';
import '../controllers/settings_notifier.dart';
import '../controllers/settings_state.dart';
import '../widgets/settings_appearance_section.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_language_sheet.dart';
import '../widgets/settings_logout_button.dart';
import '../widgets/settings_navigation_tile.dart';
import '../widgets/settings_profile_header.dart';
import '../widgets/settings_section_header.dart';

/// Settings hub — appearance, profile card, language, Lucy config.
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) {
        return;
      }
      ref.read(settingsProvider.notifier).load();
    });
  }

  Future<void> _pickLanguage(String? current) async {
    await showSettingsLanguageSheet(
      context: context,
      currentCode: current,
      onSelected: (code) async {
        if (code == current) {
          return;
        }
        final ok = await ref.read(settingsProvider.notifier).saveUiLocale(code);
        if (!mounted) {
          return;
        }
        if (ok) {
          LucySnackBar.showSuccess(
            context,
            message: context.l10n.settingsProfileSaved,
          );
          return;
        }
        final errorCode = ref.read(settingsProvider).saveErrorCode;
        if (errorCode != null) {
          LucySnackBar.showError(
            context,
            message: SettingsErrorTranslator.translate(context, errorCode),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(settingsProvider);
    final width = MediaQuery.sizeOf(context).width;
    final useAppBar = width < ResponsiveConstants.kTabletBreakpoint;
    final showMobileLogout = width < ResponsiveConstants.kTabletBreakpoint;

    return Scaffold(
      backgroundColor: context.lucyTheme.scaffoldBackground,
      appBar: useAppBar ? AppBar(title: Text(l10n.settingsTitle)) : null,
      body: _buildBody(context, state, useAppBar, showMobileLogout),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SettingsState state,
    bool useAppBar,
    bool showMobileLogout,
  ) {
    final l10n = context.l10n;

    if (state.errorCode != null && state.email.isEmpty && !state.isLoading) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(LucySpacing.spaceXl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                SettingsErrorTranslator.translate(context, state.errorCode!),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: LucySpacing.spaceMd),
              LucySecondaryButton(
                text: l10n.chatRetry,
                onPressed: () => ref.read(settingsProvider.notifier).load(),
              ),
            ],
          ),
        ),
      );
    }

    final displayName = state.fullName.trim().isNotEmpty
        ? state.fullName.trim()
        : state.email;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: LucyConstants.kSettingsContentMaxWidth,
        ),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: LucySpacing.spaceXl),
          children: [
            if (!useAppBar)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  LucySpacing.spaceLg,
                  LucySpacing.spaceXl,
                  LucySpacing.spaceLg,
                  LucySpacing.spaceMd,
                ),
                child: Text(
                  l10n.settingsTitle,
                  style: context.textTheme.headlineSmall,
                ),
              ),
            const SettingsAppearanceSection(),
            SettingsSectionHeader(title: l10n.settingsSectionAccount),
            SettingsProfileHeader(
              displayName: displayName,
              email: state.email,
              isLoading: state.isLoading && state.email.isEmpty,
              showChevron: true,
              onTap: state.isLoading && state.email.isEmpty
                  ? null
                  : () => context.push(LucyRoutePaths.settingsProfile),
            ),
            const SizedBox(height: LucySpacing.spaceLg),
            SettingsSectionHeader(title: l10n.settingsSectionApplication),
            SettingsGroup(
              children: [
                SettingsNavigationTile(
                  icon: Icons.language,
                  label: l10n.settingsUiLocaleLabel,
                  trailingText: SettingsUiLocaleL10n.label(l10n, state.uiLocale),
                  onTap: state.isSaving
                      ? null
                      : () => _pickLanguage(state.uiLocale),
                ),
              ],
            ),
            SettingsSectionHeader(title: l10n.settingsHubSection),
            SettingsGroup(
              children: [
                SettingsNavigationTile(
                  icon: Icons.auto_awesome,
                  label: l10n.settingsAiConfigTitle,
                  trailingText: l10n.settingsAiConfigHubHint,
                  onTap: () => context.push(LucyRoutePaths.settingsAiConfig),
                ),
              ],
            ),
            if (showMobileLogout) ...[
              const SizedBox(height: LucySpacing.spaceXl),
              SettingsLogoutButton(
                label: l10n.homeLogout,
                onPressed: state.isLoading
                    ? null
                    : () => ref.read(authServiceProvider).signOut(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
