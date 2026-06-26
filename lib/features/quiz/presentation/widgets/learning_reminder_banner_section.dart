import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/primary_learning_reminder_provider.dart';
import 'learning_reminder_banner.dart';

/// Async wrapper that shows [LearningReminderBanner] when a reminder exists.
class LearningReminderBannerSection extends ConsumerWidget {
  const LearningReminderBannerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderAsync = ref.watch(primaryLearningReminderProvider);

    return reminderAsync.when(
      data: (reminder) {
        if (reminder == null) {
          return const SizedBox.shrink();
        }
        return LearningReminderBanner(reminder: reminder);
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
