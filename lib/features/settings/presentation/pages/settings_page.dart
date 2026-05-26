import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';

/// Settings tab — logout and future account preferences (SPEC §2).
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = context.colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text(context.l10n.settingsTitle),
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.pageUnderDevelopment,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: LucyConstants.kSpacingLarge),
              LucyPrimaryButton(
                text: context.l10n.homeLogout,
                onPressed: () => ref.read(authServiceProvider).signOut(),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
