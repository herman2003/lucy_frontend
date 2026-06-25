import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/responsive_constants.dart';
import '../extensions/context.dart';
import '../theme/lucy_theme_extensions.dart';
import 'lucy_bottom_nav.dart';
import 'lucy_desktop_sidebar.dart';
import 'lucy_shell_navigation.dart';

/// Responsive post-login shell — V3 desktop sidebar + V4 mobile bottom nav.
///
/// Width &lt; 600: bottom nav with emojis.
/// Width ≥ 600: sidebar ; between 600 and 1024, hamburger toggles sidebar.
class LucyAppShell extends ConsumerStatefulWidget {
  const LucyAppShell({
    super.key,
    required this.navigationShell,
    required this.state,
  });

  final StatefulNavigationShell navigationShell;
  final GoRouterState state;

  @override
  ConsumerState<LucyAppShell> createState() => _LucyAppShellState();
}

class _LucyAppShellState extends ConsumerState<LucyAppShell> {
  bool _sidebarOpen = false;

  bool _isNarrowDesktopFor(double width) {
    if (width < ResponsiveConstants.kTabletBreakpoint) return false;
    return width < ResponsiveConstants.kDesktopBreakpoint;
  }

  bool _useMobileLayoutFor(double width) {
    if (width <= 0) return false;
    return width < ResponsiveConstants.kTabletBreakpoint;
  }

  @override
  Widget build(BuildContext context) {
    final lucyTheme = context.lucyTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final useMobileLayout = _useMobileLayoutFor(width);
        final isNarrowDesktop = _isNarrowDesktopFor(width);
        final path = widget.state.uri.path;
        final activeIndex = LucyShellNavigation.indexForPath(path);

        if (useMobileLayout) {
          return Scaffold(
            backgroundColor: lucyTheme.scaffoldBackground,
            body: widget.navigationShell,
            bottomNavigationBar: LucyBottomNav(
              activeIndex: activeIndex,
              onTap: widget.navigationShell.goBranch,
            ),
          );
        }

        final showSidebarPermanent = !isNarrowDesktop;
        final showSidebar = showSidebarPermanent || _sidebarOpen;

        return Scaffold(
          backgroundColor: lucyTheme.scaffoldBackground,
          appBar: isNarrowDesktop
              ? AppBar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  leading: IconButton(
                    icon: const Icon(Icons.menu),
                    tooltip: context.l10n.shellMenu,
                    onPressed: () {
                      setState(() => _sidebarOpen = !_sidebarOpen);
                    },
                  ),
                )
              : null,
          body: Row(
            children: [
              if (showSidebar)
                LucyDesktopSidebar(
                  navigationShell: widget.navigationShell,
                  currentPath: path,
                ),
              Expanded(child: widget.navigationShell),
            ],
          ),
        );
      },
    );
  }
}
