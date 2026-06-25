import '../../core/localization/l10n/app_localizations.dart';
import '../router/lucy_route_paths.dart';

/// Shared shell branch indices and path resolution (mobile + desktop).
abstract final class LucyShellNavigation {
  static const int branchDocuments = 0;
  static const int branchChat = 1;
  static const int branchQuiz = 2;
  static const int branchSettings = 3;

  static int indexForPath(String path) {
    if (path.startsWith(LucyRoutePaths.chat)) {
      return branchChat;
    }
    if (path.startsWith(LucyRoutePaths.quiz)) {
      return branchQuiz;
    }
    if (path.startsWith(LucyRoutePaths.settings)) {
      return branchSettings;
    }
    return branchDocuments;
  }

  static List<LucyShellNavItem> navItems(AppLocalizations l10n) {
    return [
      LucyShellNavItem(
        emoji: '📄',
        label: l10n.navDocuments,
        branchIndex: branchDocuments,
      ),
      LucyShellNavItem(
        emoji: '💬',
        label: l10n.navChat,
        branchIndex: branchChat,
      ),
      LucyShellNavItem(
        emoji: '🎯',
        label: l10n.navQuiz,
        branchIndex: branchQuiz,
      ),
      LucyShellNavItem(
        emoji: '⚙️',
        label: l10n.navSettings,
        branchIndex: branchSettings,
      ),
    ];
  }
}

/// One entry in the post-login shell navigation.
class LucyShellNavItem {
  const LucyShellNavItem({
    required this.emoji,
    required this.label,
    required this.branchIndex,
  });

  final String emoji;
  final String label;
  final int branchIndex;
}
