import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/responsive_constants.dart';
import '../extensions/context.dart';
import '../router/lucy_route_paths.dart';
import 'lucy_sidebar.dart';

/// Responsive post-login shell (ref. telC [TcAppShell]).
///
/// Width &lt; 600: bottom bar (4 onglets).
/// Width ≥ 600: sidebar ; entre 600 et 1024, menu hamburger pour afficher la sidebar.
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

  static const List<IconData> _mobileIcons = [
    Icons.description_outlined,
    Icons.chat_bubble_outline,
    Icons.quiz_outlined,
    Icons.settings_outlined,
  ];

  int _mobileActiveIndex() {
    final path = widget.state.uri.path;
    if (path.startsWith(LucyRoutePaths.chat)) return 1;
    if (path.startsWith(LucyRoutePaths.quiz)) return 2;
    if (path.startsWith(LucyRoutePaths.settings)) return 3;
    return 0;
  }

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
    final scheme = context.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final useMobileLayout = _useMobileLayoutFor(width);
        final isNarrowDesktop = _isNarrowDesktopFor(width);

        if (useMobileLayout) {
          return Scaffold(
            backgroundColor: scheme.surface,
            body: widget.navigationShell,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: _mobileIcons,
              activeIndex: _mobileActiveIndex(),
              gapLocation: GapLocation.none,
              leftCornerRadius: 24,
              rightCornerRadius: 24,
              onTap: widget.navigationShell.goBranch,
              backgroundColor: scheme.surface,
              activeColor: scheme.primary,
              inactiveColor: scheme.onSurfaceVariant,
            ),
          );
        }

        final showSidebarPermanent = !isNarrowDesktop;
        final showSidebar = showSidebarPermanent || _sidebarOpen;

        return Scaffold(
          backgroundColor: scheme.surface,
          appBar: isNarrowDesktop
              ? AppBar(
                  backgroundColor: scheme.surface,
                  foregroundColor: scheme.onSurface,
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
              if (showSidebar) ...[
                LucySidebar(
                  navigationShell: widget.navigationShell,
                  currentPath: widget.state.uri.path,
                ),
              ],
              Expanded(child: widget.navigationShell),
            ],
          ),
        );
      },
    );
  }
}
