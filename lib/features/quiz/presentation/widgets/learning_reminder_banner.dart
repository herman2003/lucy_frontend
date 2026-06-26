import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../domain/entities/learning_reminder.dart';
import '../../utils/learning_reminder_labels.dart';

/// In-app banner for SM-2 due cards or weak quiz reminders (LEARN-12a-2).
class LearningReminderBanner extends StatelessWidget {
  const LearningReminderBanner({
    super.key,
    required this.reminder,
    this.onPressed,
  });

  final LearningReminder reminder;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final labels = buildLearningReminderLabels(context.l10n, reminder);
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: scheme.primaryContainer.withValues(alpha: 0.45),
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              labels.title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: scheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLow),
            Text(
              labels.message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: scheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyPrimaryButton(
              text: labels.cta,
              onPressed:
                  onPressed ??
                  () => context.push(
                    LucyRoutePaths.quizSession(reminder.sessionId),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
