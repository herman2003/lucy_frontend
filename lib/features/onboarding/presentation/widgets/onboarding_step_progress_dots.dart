import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../pages/onboarding_chat/onboarding_chat_state.dart';
import '../../utils/onboarding_question_ids.dart';

/// Seven-step progress indicator: done / current / locked (SPEC §4.5.1).
class OnboardingStepProgressDots extends StatelessWidget {
  const OnboardingStepProgressDots({
    super.key,
    required this.stepStatusForIndex,
    required this.onStepSelected,
  });

  final OnboardingStepStatus Function(int index) stepStatusForIndex;
  final ValueChanged<int> onStepSelected;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: LucyConstants.kSpacingMedium,
        vertical: LucyConstants.kSpacingLow,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(OnboardingQuestionIds.stepCount, (index) {
            final status = stepStatusForIndex(index);
            final color = switch (status) {
              OnboardingStepStatus.completed => scheme.primary,
              OnboardingStepStatus.current => scheme.secondary,
              OnboardingStepStatus.locked => scheme.outlineVariant,
            };
            final icon = status == OnboardingStepStatus.locked
                ? Icons.lock_outline
                : null;

            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : LucyConstants.kSpacingLow / 2,
                right: index == OnboardingQuestionIds.stepCount - 1
                    ? 0
                    : LucyConstants.kSpacingLow / 2,
              ),
              child: IconButton(
                onPressed: status == OnboardingStepStatus.locked
                    ? null
                    : () => onStepSelected(index),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                icon: icon != null
                    ? Icon(icon, size: 14, color: color)
                    : Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
