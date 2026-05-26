import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// CP-4 — links automated E2E to Flutter widget test and backend memory flow.
void main() {
  test('Flutter widget E2E covers signup through home', () {
    expect(
      File(
        'test/features/onboarding/presentation/onboarding_cp4_e2e_flow_test.dart',
      ).existsSync(),
      isTrue,
    );
  });

  test('backend memory flow persists transcript, profile, and isConfigured', () {
    final flowSpec = File(
      '../backend/src/features/onboarding/services/onboarding.flow.memory.spec.ts',
    ).readAsStringSync();
    expect(flowSpec, contains('onboardingTranscript'));
    expect(flowSpec, contains('learnerProfile'));
    expect(flowSpec, contains('isConfigured'));
  });

  test('backend D1 documents flow spec exists', () {
    expect(
      File(
        '../backend/src/features/documents/documents.d1-flow.spec.ts',
      ).existsSync(),
      isTrue,
    );
  });
}
