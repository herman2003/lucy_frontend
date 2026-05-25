import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/lucy_constants.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../domain/providers/auth_provider.dart';

/// Placeholder home after successful login (T08).
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = context.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.homeWelcome,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineMedium?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: LucyConstants.kSpacingLarge),
              LucyPrimaryButton(
                text: context.l10n.homeLogout,
                onPressed: () =>
                    ref.read(authServiceProvider).signOut(),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
