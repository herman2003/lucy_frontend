import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';

/// Account header card (primary + surface).
class SettingsProfileHeader extends StatelessWidget {
  const SettingsProfileHeader({
    super.key,
    required this.displayName,
    required this.email,
    required this.isLoading,
  });

  final String displayName;
  final String email;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final initial = displayName.isNotEmpty ? displayName[0].toUpperCase() : '?';

    return Padding(
      padding: const EdgeInsets.all(LucyConstants.kContainerPaddingMedium),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
          border: Border.all(color: scheme.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kContainerPaddingMedium),
          child: isLoading
              ? Center(child: CircularProgressIndicator(color: scheme.primary))
              : Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: scheme.primary,
                      foregroundColor: scheme.surface,
                      child: Text(
                        initial,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: scheme.surface,
                        ),
                      ),
                    ),
                    const SizedBox(width: LucyConstants.kSpacingHigh),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: scheme.primary,
                            ),
                          ),
                          if (email.isNotEmpty) ...[
                            const SizedBox(
                              height: LucyConstants.kSpacingLow / 2,
                            ),
                            Text(
                              email,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: scheme.primary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
