import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';

/// Conversation panel status (spec §7.1 / C15).
enum LucyConversationStatusType {
  loading,
  empty,
  offline,
  noCorpus,
  error,
  ready,
}

/// Centered status or [child] when [LucyConversationStatusType.ready].
class LucyConversationStatus extends StatelessWidget {
  const LucyConversationStatus({
    super.key,
    required this.status,
    required this.child,
    this.onRetry,
    this.errorMessage,
  });

  final LucyConversationStatusType status;
  final Widget child;
  final VoidCallback? onRetry;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return switch (status) {
      LucyConversationStatusType.ready => child,
      LucyConversationStatusType.loading => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            Text(l10n.chatLoading),
          ],
        ),
      ),
      LucyConversationStatusType.empty => Center(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Text(
            l10n.chatEmptyHint,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      LucyConversationStatusType.offline => Center(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Text(
            l10n.chatOfflineBanner,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      LucyConversationStatusType.noCorpus => Center(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Text(
            l10n.chatEmptyHint,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      LucyConversationStatusType.error => Center(
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                errorMessage ?? l10n.chatGenericError,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: LucyConstants.kSpacingMedium),
              LucyPrimaryButton(text: l10n.chatRetry, onPressed: onRetry),
            ],
          ),
        ),
      ),
    };
  }
}
