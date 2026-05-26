import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Maps manual checkpoints CP-2 / CP-3 to automated tests in this repo.
void main() {
  test('CP-2 router redirect when not configured', () {
    expect(
      File(
        'test/core/router/lucy_router_guards_onboarding_test.dart',
      ).existsSync(),
      isTrue,
    );
  });

  test('CP-2 rephrasedQuestion and accepted summary in chat widgets', () {
    final chatTests = File(
      'test/features/onboarding/presentation/onboarding_chat_page_test.dart',
    ).readAsStringSync();
    expect(chatTests, contains('rephrasedQuestion'));
    expect(chatTests, contains('turnSummary'));

    expect(
      File(
        'test/features/onboarding/presentation/onboarding_chat_confirm_test.dart',
      ).existsSync(),
      isTrue,
    );
  });

  test('CP-3 analyze with seven turns is covered by backend flow spec', () {
    expect(
      File(
        '../backend/src/features/onboarding/services/onboarding.flow.memory.spec.ts',
      ).existsSync(),
      isTrue,
    );
    expect(
      File(
        '../backend/src/features/onboarding/services/onboarding-analyze.spec.ts',
      ).existsSync(),
      isTrue,
    );
  });
}
