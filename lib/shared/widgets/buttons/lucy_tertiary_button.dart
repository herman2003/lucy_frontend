import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';

/// Text link button using [ColorScheme.tertiary].
class LucyTertiaryButton extends StatelessWidget {
  const LucyTertiaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
  });

  final String text;
  final VoidCallback? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    final button = TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: scheme.tertiary,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          color: scheme.tertiary,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
        ),
      ),
    );

    if (width != null) {
      return SizedBox(width: width, child: button);
    }

    return button;
  }
}
