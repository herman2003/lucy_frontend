import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_composer.dart';

class ChatComposer extends StatelessWidget {
  const ChatComposer({super.key, required this.enabled, required this.onSend});

  final bool enabled;
  final ValueChanged<String> onSend;

  @override
  Widget build(BuildContext context) {
    return LucyComposer(
      enabled: enabled,
      hintText: context.l10n.chatComposerHint,
      onSend: onSend,
    );
  }
}
