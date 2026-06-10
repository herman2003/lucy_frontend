import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/providers/auth_provider.dart';
import '../../shared/widgets/branding/lucy_shell_brand.dart';
import '../constants/lucy_constants.dart';
import '../constants/responsive_constants.dart';
import '../extensions/context.dart';
import '../router/lucy_route_paths.dart';

/// Desktop sidebar for post-login shell (ref. telC [TcSidebar]).
class LucySidebar extends ConsumerWidget {
  const LucySidebar({
    super.key,
    required this.navigationShell,
    required this.currentPath,
  });

  final StatefulNavigationShell navigationShell;
  final String currentPath;

  static const int _branchDocuments = 0;
  static const int _branchChat = 1;
  static const int _branchQuiz = 2;
  static const int _branchSettings = 3;

  int _indexForPath(String path) {
    if (path.startsWith(LucyRoutePaths.chat)) return _branchChat;
    if (path.startsWith(LucyRoutePaths.quiz)) return _branchQuiz;
    if (path.startsWith(LucyRoutePaths.settings)) return _branchSettings;
    return _branchDocuments;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final activeIndex = _indexForPath(currentPath);

    final navItems = <_NavItem>[
      _NavItem(
        branch: _branchDocuments,
        icon: Icons.description_outlined,
        label: l10n.navDocuments,
      ),
      _NavItem(
        branch: _branchChat,
        icon: Icons.chat_bubble_outline,
        label: l10n.navChat,
      ),
      _NavItem(
        branch: _branchQuiz,
        icon: Icons.quiz_outlined,
        label: l10n.navQuiz,
      ),
      _NavItem(
        branch: _branchSettings,
        icon: Icons.settings_outlined,
        label: l10n.navSettings,
      ),
    ];

    final width = MediaQuery.sizeOf(context).width;
    final isTablet =
        width >= ResponsiveConstants.kTabletBreakpoint &&
        width < ResponsiveConstants.kDesktopBreakpoint;
    final borderAlpha = isTablet ? 0.35 : 0.6;

    return Container(
      width: LucyConstants.kShellSidebarWidth,
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border(
          right: BorderSide(
            color: scheme.outlineVariant.withValues(alpha: borderAlpha),
            width: LucyConstants.kBorderWidthSmall,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: LucyConstants.kSpacingLarge,
              horizontal: LucyConstants.kSpacingMedium,
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: LucyShellBrand(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: LucyConstants.kContainerPaddingSmall,
              ),
              itemCount: navItems.length,
              itemBuilder: (context, index) {
                final item = navItems[index];
                final isActive = activeIndex == item.branch;
                final tile = ListTile(

                  leading: Icon(
                    item.icon,
                    size: LucyConstants.kIconMedium,
                    color: isActive
                        ? scheme.surface
                        : scheme.onSurface,
                  ),
                  title: Text(
                    item.label,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: isActive
                          ? scheme.surface
                          : scheme.onSurface,
                      fontWeight: isActive ? FontWeight.w600 : null,
                    ),
                  ),
                  onTap: () => navigationShell.goBranch(item.branch),
                );
                if (!isActive) {
                  return tile;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: LucyConstants.kSpacingLow,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: scheme.primary,
                      borderRadius: BorderRadius.circular(
                        LucyConstants.kBorderRadiusMedium,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: scheme.shadow.withValues(alpha: 0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: tile,
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: LucyConstants.kIconMedium,
              color: scheme.onSurface,
            ),
            title: Text(
              l10n.homeLogout,
              style: context.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurface,
              ),
            ),
            onTap: () => ref.read(authServiceProvider).signOut(),
          ),
          const SizedBox(height: LucyConstants.kSpacingMedium),
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.branch,
    required this.icon,
    required this.label,
  });

  final int branch;
  final IconData icon;
  final String label;
}
