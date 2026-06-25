import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/responsive_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../controllers/settings_notifier.dart';
import '../controllers/settings_state.dart';
import '../../utils/settings_error_translator.dart';
import '../widgets/settings_appearance_section.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_navigation_tile.dart';
import '../widgets/settings_section_header.dart';

/// Settings hub — Profil vs configuration Lucy (two separate areas).
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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final state = ref.watch(settingsProvider);
    final width = MediaQuery.sizeOf(context).width;
    final useAppBar = width < ResponsiveConstants.kTabletBreakpoint;
    final showMobileLogout = width < ResponsiveConstants.kTabletBreakpoint;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: useAppBar
          ? AppBar(
              title: Text(
                l10n.settingsTitle,
                style: TextStyle(color: scheme.primary),
              ),
              backgroundColor: scheme.surface,
              foregroundColor: scheme.primary,
              iconTheme: IconThemeData(color: scheme.primary),
            )
          : null,
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
    final scheme = context.colorScheme;

    if (state.errorCode != null && state.email.isEmpty && !state.isLoading) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                SettingsErrorTranslator.translate(context, state.errorCode!),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: scheme.primary,
                ),
              ),
              const SizedBox(height: LucyConstants.kSpacingMedium),
              LucySecondaryButton(
                text: l10n.chatRetry,
                onPressed: () => ref.read(settingsProvider.notifier).load(),
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: LucyConstants.kSettingsContentMaxWidth,
        ),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            bottom: LucyConstants.kContainerPaddingLarge,
          ),
          children: [
            if (!useAppBar)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  LucyConstants.kContainerPaddingMedium,
                  LucyConstants.kContainerPaddingLarge,
                  LucyConstants.kContainerPaddingMedium,
                  LucyConstants.kSpacingMedium,
                ),
                child: Text(
                  l10n.settingsTitle,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: scheme.primary,
                  ),
                ),
              ),
            const SettingsAppearanceSection(),
            SettingsSectionHeader(title: l10n.settingsHubSection),
            SettingsGroup(
              children: [
                SettingsNavigationTile(
                  icon: Icons.person_outline,
                  label: l10n.settingsProfileTitle,
                  trailingText: l10n.settingsProfileHubHint,
                  onTap: () => context.push(LucyRoutePaths.settingsProfile),
                ),
                SettingsNavigationTile(
                  icon: Icons.auto_awesome,
                  label: l10n.settingsAiConfigTitle,
                  trailingText: l10n.settingsAiConfigHubHint,
                  onTap: () => context.push(LucyRoutePaths.settingsAiConfig),
                ),
              ],
            ),
            if (showMobileLogout)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  LucyConstants.kContainerPaddingMedium,
                  LucyConstants.kSpacingHigh,
                  LucyConstants.kContainerPaddingMedium,
                  LucyConstants.kSpacingMedium,
                ),
                child: LucySecondaryButton(
                  text: l10n.homeLogout,
                  onPressed: state.isLoading
                      ? null
                      : () => ref.read(authServiceProvider).signOut(),
                  width: double.infinity,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
