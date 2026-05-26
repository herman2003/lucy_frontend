import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/build_context_responsive.dart';

/// Overlay feedback for backend / API errors (not field validation).
///
/// Semantic colors from [ColorScheme] only: success → [secondary], info →
/// [primary], error → [error]. Field errors stay on [TextFormField] validators.
class LucySnackBar {
  LucySnackBar._();

  static OverlayEntry? _currentOverlay;

  static void showError(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) {
    _show(
      context,
      message: message,
      title: title,
      type: LucySnackBarType.error,
      duration: duration,
    );
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) {
    _show(
      context,
      message: message,
      title: title,
      type: LucySnackBarType.success,
      duration: duration,
    );
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) {
    _show(
      context,
      message: message,
      title: title,
      type: LucySnackBarType.info,
      duration: duration,
    );
  }

  static void hideAll() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }

  static void _show(
    BuildContext context, {
    required String message,
    String? title,
    required LucySnackBarType type,
    Duration? duration,
  }) {
    _currentOverlay?.remove();
    _currentOverlay = null;

    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null || !overlay.mounted) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    final theme = Theme.of(context);
    final entry = OverlayEntry(
      builder: (_) => _LucySnackBarOverlay(
        message: message,
        title: title,
        type: type,
        duration: duration ?? const Duration(seconds: 4),
        theme: theme,
        isMobileLayout: context.isMobile,
        onDismiss: () {
          _currentOverlay?.remove();
          _currentOverlay = null;
        },
      ),
    );
    _currentOverlay = entry;
    overlay.insert(entry);
  }
}

enum LucySnackBarType { success, error, info }

class _LucySnackBarOverlay extends StatefulWidget {
  const _LucySnackBarOverlay({
    required this.message,
    required this.title,
    required this.type,
    required this.duration,
    required this.theme,
    required this.isMobileLayout,
    required this.onDismiss,
  });

  final String message;
  final String? title;
  final LucySnackBarType type;
  final Duration duration;
  final ThemeData theme;
  final bool isMobileLayout;
  final VoidCallback onDismiss;

  @override
  State<_LucySnackBarOverlay> createState() => _LucySnackBarOverlayState();
}

class _LucySnackBarOverlayState extends State<_LucySnackBarOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
    final fromBottom = widget.isMobileLayout;
    _slide = Tween<Offset>(
      begin: fromBottom ? const Offset(0, 1) : const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
    _dismissTimer = Timer(widget.duration, _dismiss);
  }

  Future<void> _dismiss() async {
    if (!mounted) {
      return;
    }
    await _controller.reverse();
    if (mounted) {
      widget.onDismiss();
    }
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = widget.isMobileLayout
        ? MediaQuery.sizeOf(context).height * 0.08
        : null;

    return Positioned(
      top: widget.isMobileLayout ? null : 72,
      bottom: widget.isMobileLayout ? bottomInset : null,
      left: widget.isMobileLayout ? LucyConstants.kSpacingMedium : null,
      right: LucyConstants.kSpacingMedium,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Material(
            color: Colors.transparent,
            child: _LucySnackBarCard(
              message: widget.message,
              title: widget.title,
              type: widget.type,
              theme: widget.theme,
              isMobileLayout: widget.isMobileLayout,
              onDismiss: () {
                _dismissTimer?.cancel();
                _dismiss();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _LucySnackBarCard extends StatelessWidget {
  const _LucySnackBarCard({
    required this.message,
    required this.title,
    required this.type,
    required this.theme,
    required this.isMobileLayout,
    required this.onDismiss,
  });

  final String message;
  final String? title;
  final LucySnackBarType type;
  final ThemeData theme;
  final bool isMobileLayout;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final colors = _snackBarColors(theme.colorScheme, type);
    final width = isMobileLayout ? double.infinity : 360.0;

    return Container(
      width: width,
      padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(
          LucyConstants.kBorderRadiusAuthCard,
        ),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: colors.iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              colors.icon,
              color: colors.iconForeground,
              size: LucyConstants.kIconMedium,
            ),
          ),
          const SizedBox(width: LucyConstants.kSpacingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colors.text,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.text,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: colors.text, size: 20),
            onPressed: onDismiss,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }
}

/// SnackBar palette derived from [ColorScheme] semantic slots.
class _SnackBarColors {
  const _SnackBarColors({
    required this.background,
    required this.border,
    required this.shadow,
    required this.iconBackground,
    required this.iconForeground,
    required this.text,
    required this.icon,
  });

  final Color background;
  final Color border;
  final Color shadow;
  final Color iconBackground;
  final Color iconForeground;
  final Color text;
  final IconData icon;
}

_SnackBarColors _snackBarColors(ColorScheme scheme, LucySnackBarType type) {
  final accent = switch (type) {
    LucySnackBarType.success => scheme.secondary,
    LucySnackBarType.error => scheme.error,
    LucySnackBarType.info => scheme.primary,
  };
  final onAccent = switch (type) {
    LucySnackBarType.success => scheme.onSecondary,
    LucySnackBarType.error => scheme.onError,
    LucySnackBarType.info => scheme.onPrimary,
  };
  final icon = switch (type) {
    LucySnackBarType.success => Icons.check_circle_outline,
    LucySnackBarType.error => Icons.error_outline,
    LucySnackBarType.info => Icons.info_outline,
  };

  return _SnackBarColors(
    background: accent.withValues(alpha: 0.1),
    border: accent.withValues(alpha: 0.3),
    shadow: accent.withValues(alpha: 0.15),
    iconBackground: accent,
    iconForeground: onAccent,
    text: accent,
    icon: icon,
  );
}
