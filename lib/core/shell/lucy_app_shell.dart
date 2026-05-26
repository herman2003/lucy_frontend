import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions/context.dart';
import '../router/lucy_route_paths.dart';

/// Post-login shell with bottom navigation (SPEC §2, ref. telC `TcAppShell`).
class LucyAppShell extends StatelessWidget {
  const LucyAppShell({
    super.key,
    required this.navigationShell,
    required this.state,
  });

  final StatefulNavigationShell navigationShell;
  final GoRouterState state;

  static const List<IconData> _icons = [
    Icons.description_outlined,
    Icons.chat_bubble_outline,
    Icons.quiz_outlined,
    Icons.settings_outlined,
  ];

  int _activeIndex() {
    final path = state.uri.path;
    if (path.startsWith(LucyRoutePaths.chat)) return 1;
    if (path.startsWith(LucyRoutePaths.quiz)) return 2;
    if (path.startsWith(LucyRoutePaths.settings)) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: navigationShell,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _icons,
        activeIndex: _activeIndex(),
        gapLocation: GapLocation.none,
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        onTap: navigationShell.goBranch,
        backgroundColor: scheme.surface,
        activeColor: scheme.primary,
        inactiveColor: scheme.onSurfaceVariant,
      ),
    );
  }
}
