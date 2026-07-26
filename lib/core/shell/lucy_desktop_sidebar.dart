import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/providers/auth_provider.dart';
import '../../shared/widgets/branding/lucy_brand_mark.dart';
import '../constants/lucy_constants.dart';
import '../constants/lucy_spacing.dart';
import '../extensions/context.dart';
import '../theme/lucy_colors.dart';
import '../theme/lucy_theme_extensions.dart';
import '../theme/lucy_typography.dart';
import 'lucy_shell_navigation.dart';

/// Desktop sidebar — design system (#22315C) with emoji nav (V3).
class LucyDesktopSidebar extends ConsumerWidget {
  const LucyDesktopSidebar({
    super.key,
    required this.navigationShell,
    required this.currentPath,
    required this.onBranchTap,
  });

  final StatefulNavigationShell navigationShell;
  final String currentPath;
  final ValueChanged<int> onBranchTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final lucyTheme = context.lucyTheme;
    final activeIndex = LucyShellNavigation.indexForPath(currentPath);
    final items = LucyShellNavigation.navItems(l10n);
    final user = ref.watch(authRepositoryProvider).currentUser;
    final initial = _userInitial(user?.displayName, user?.email);

    return Container(
      width: LucySpacing.shellSidebarWidth,
      color: lucyTheme.railBackground,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              LucyConstants.kSpacingMedium,
              LucyConstants.kSpacingLarge,
              LucyConstants.kSpacingMedium,
              LucyConstants.kSpacingLarge,
            ),
            child: Row(
              children: [
                const LucyBrandMark(size: 34),
                const SizedBox(width: LucySpacing.spaceMd),
                Text(
                  l10n.appTitle,
                  style: LucyTypography.brandMark(
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: LucyConstants.kContainerPaddingSmall,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isActive = activeIndex == item.branchIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: _SidebarNavTile(
                    item: item,
                    isActive: isActive,
                    onTap: () => onBranchTap(item.branchIndex),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1, color: Color(0x1FFFFFFF)),
          ListTile(
            dense: true,
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: LucyColors.colorSchemeTertiaryLightSeed,
              child: Text(
                initial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            title: Text(
              l10n.homeLogout,
              style: context.textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.85),
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => ref.read(authServiceProvider).signOut(),
          ),
          const SizedBox(height: LucySpacing.spaceMd),
        ],
      ),
    );
  }

  static String _userInitial(String? displayName, String? email) {
    final source = (displayName?.trim().isNotEmpty ?? false)
        ? displayName!.trim()
        : (email ?? '?');
    return source.substring(0, 1).toUpperCase();
  }
}

class _SidebarNavTile extends StatelessWidget {
  const _SidebarNavTile({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final LucyShellNavItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final inactiveColor = Colors.white.withValues(alpha: 0.72);

    return Material(
      color: isActive ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
      elevation: isActive ? 2 : 0,
      shadowColor: Colors.black26,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          child: Row(
            children: [
              Text(item.emoji, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  item.label,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: isActive ? LucyColors.railTextActive : inactiveColor,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
