import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:frontend/features/onboarding/presentation/widgets/onboarding_step_progress_dots.dart';

void main() {
  testWidgets('locked step shows lock icon and ignores tap', (tester) async {
    int? selectedIndex;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OnboardingStepProgressDots(
            stepStatusForIndex: (index) {
              if (index == 0) {
                return OnboardingStepStatus.current;
              }
              return OnboardingStepStatus.locked;
            },
            onStepSelected: (index) => selectedIndex = index,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.lock_outline), findsNWidgets(6));

    await tester.tap(find.byIcon(Icons.lock_outline).first);
    await tester.pump();

    expect(selectedIndex, isNull);
  });

  testWidgets('completed step dot is tappable', (tester) async {
    int? selectedIndex;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OnboardingStepProgressDots(
            stepStatusForIndex: (index) {
              if (index == 0) {
                return OnboardingStepStatus.completed;
              }
              if (index == 1) {
                return OnboardingStepStatus.current;
              }
              return OnboardingStepStatus.locked;
            },
            onStepSelected: (index) => selectedIndex = index,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton).first);
    await tester.pump();

    expect(selectedIndex, 0);
  });
}
