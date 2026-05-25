import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Automated checks for SPEC §4.8 app Definition of Done (structural).
void main() {
  test('onboarding catalogue defines exactly 7 ordered question ids', () {
    final content = File(
      'lib/features/onboarding/utils/onboarding_question_ids.dart',
    ).readAsStringSync();
    expect(content, contains('static const int stepCount = 7'));
    for (final id in [
      'q_role',
      'q_domains',
      'q_goal',
      'q_level',
      'q_style',
      'q_tone',
      'q_language',
    ]) {
      expect(content, contains("'$id'"));
    }
  });

  test('ApiEndpoints exposes all onboarding and user HTTP routes', () {
    final content = File('lib/core/network/api_endpoints.dart').readAsStringSync();
    for (final segment in [
      'validate-answer',
      'confirm-turn',
      'analyze',
      'finalize',
      'users/me',
      'onboarding/progress',
    ]) {
      expect(content, contains(segment));
    }
  });

  test('onboarding feature follows Clean Architecture layers', () {
    for (final layer in ['data', 'domain', 'presentation', 'services']) {
      expect(
        Directory('lib/features/onboarding/$layer').existsSync(),
        isTrue,
        reason: 'missing lib/features/onboarding/$layer',
      );
    }
  });

  test('onboarding pages map caught errors via OnboardingErrorTranslator', () {
    for (final file
        in _dartFilesUnder('lib/features/onboarding/presentation/pages/')) {
      final content = File(file).readAsStringSync();
      if (!content.contains('catch (error)')) {
        continue;
      }
      expect(
        content,
        contains('OnboardingErrorTranslator'),
        reason: '$file should not surface raw API messages',
      );
    }
  });

  test('l10n defines seven onboarding questions in fr, en, and de', () {
    const keys = [
      'onboardingQuestionQRole',
      'onboardingQuestionQDomains',
      'onboardingQuestionQGoal',
      'onboardingQuestionQLevel',
      'onboardingQuestionQStyle',
      'onboardingQuestionQTone',
      'onboardingQuestionQLanguage',
    ];
    for (final arb in ['app_fr.arb', 'app_en.arb', 'app_de.arb']) {
      final content = File('lib/core/localization/l10n/$arb').readAsStringSync();
      for (final key in keys) {
        expect(content, contains('"$key"'), reason: '$arb missing $key');
      }
    }
  });

  test('answer max length matches SPEC 2000 characters', () {
    final content = File(
      'lib/features/onboarding/utils/onboarding_constants.dart',
    ).readAsStringSync();
    expect(content, contains('maxAnswerLength = 2000'));
    expect(content, contains('maxValidateAttemptsPerQuestion = 10'));
    expect(content, contains('maxAnalyzeAttempts = 10'));
  });

  test('router guards reference onboarding paths and isConfigured', () {
    final content = File('lib/core/router/lucy_router_guards.dart').readAsStringSync();
    expect(content, contains('isConfigured'));
    expect(content, contains('LucyRoutePaths.onboarding'));
    expect(content, contains('LucyRoutePaths.onboardingConfirm'));
  });
}

Iterable<String> _dartFilesUnder(String root) sync* {
  final directory = Directory(root);
  if (!directory.existsSync()) {
    return;
  }
  for (final entity in directory.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) {
      continue;
    }
    if (entity.path.endsWith('.freezed.dart') ||
        entity.path.endsWith('.g.dart')) {
      continue;
    }
    yield entity.path;
  }
}
