import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/build_context_responsive.dart';

/// Overlay feedback for backend / API errors (not field validation).
///
/// Colors from [ColorScheme] only. Field errors stay on [TextFormField] validators.
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
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final (:surface, :border, :iconBg, :iconFg, :icon, :textColor) = switch (type) {
      LucySnackBarType.success => (
        surface: scheme.primary.withValues(alpha: isDark ? 0.22 : 0.12),
        border: scheme.primary.withValues(alpha: 0.35),
        iconBg: scheme.primary,
        iconFg: scheme.onPrimary,
        icon: Icons.check_circle_outline,
        textColor: scheme.primary,
      ),
      LucySnackBarType.error => (
        surface: scheme.error.withValues(alpha: isDark ? 0.22 : 0.12),
        border: scheme.error.withValues(alpha: 0.35),
        iconBg: scheme.error,
        iconFg: scheme.onError,
        icon: Icons.error_outline,
        textColor: scheme.error,
      ),
      LucySnackBarType.info => (
        surface: scheme.secondary.withValues(alpha: isDark ? 0.22 : 0.12),
        border: scheme.secondary.withValues(alpha: 0.35),
        iconBg: scheme.secondary,
        iconFg: scheme.onSecondary,
        icon: Icons.info_outline,
        textColor: scheme.secondary,
      ),
    };

    final width = isMobileLayout ? double.infinity : 360.0;

    return Container(
      width: width,
      padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusAuthCard),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconFg, size: LucyConstants.kIconMedium),
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
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: textColor, size: 20),
            onPressed: onDismiss,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }
}
