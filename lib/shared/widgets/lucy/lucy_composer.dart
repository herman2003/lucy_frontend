import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';

/// Message composer with multiline field and square send button (V3/V4).
class LucyComposer extends StatefulWidget {
  const LucyComposer({
    required this.enabled,
    required this.hintText,
    required this.onSend,
    super.key,
  });

  final bool enabled;
  final String hintText;
  final ValueChanged<String> onSend;

  @override
  State<LucyComposer> createState() => _LucyComposerState();
}

class _LucyComposerState extends State<LucyComposer> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty || !widget.enabled) {
      return;
    }
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final canSend = widget.enabled;

    return Padding(
      padding: const EdgeInsets.all(LucySpacing.spaceLg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: widget.enabled,
              maxLines: 4,
              minLines: 1,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: widget.hintText,
                filled: true,
                fillColor: scheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
                  borderSide: BorderSide(color: lucy.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
                  borderSide: BorderSide(color: lucy.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
                  borderSide: BorderSide(color: scheme.primary, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: LucySpacing.spaceMd,
                  vertical: LucySpacing.spaceSm + 2,
                ),
              ),
              onSubmitted: widget.enabled ? (_) => _submit() : null,
            ),
          ),
          const SizedBox(width: LucySpacing.spaceSm),
          _SendButton(enabled: canSend, onPressed: _submit),
        ],
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({required this.enabled, required this.onPressed});

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Material(
      color: enabled ? scheme.primary : scheme.primary.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: const SizedBox(
          width: LucySpacing.minTouchTarget,
          height: LucySpacing.minTouchTarget,
          child: Icon(Icons.arrow_upward, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
