import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';

class ChatComposer extends StatefulWidget {
  const ChatComposer({
    super.key,
    required this.enabled,
    required this.onSend,
  });

  final bool enabled;
  final ValueChanged<String> onSend;

  @override
  State<ChatComposer> createState() => _ChatComposerState();
}

class _ChatComposerState extends State<ChatComposer> {
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
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
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
                hintText: l10n.chatComposerHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    LucyConstants.kButtonBorderRadius,
                  ),
                ),
              ),
              onSubmitted: widget.enabled ? (_) => _submit() : null,
            ),
          ),
          const SizedBox(width: LucyConstants.kSpacingLow),
          LucyPrimaryButton(
            text: l10n.chatSend,
            onPressed: widget.enabled ? _submit : null,
          ),
        ],
      ),
    );
  }
}
