import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// SPEC §1.4 — auth/shared UI must not use raw hex or [LucyColors] in widgets.
void main() {
  const scanRoots = [
    'lib/features/auth/presentation',
    'lib/shared/widgets',
  ];

  final forbiddenColorPatterns = [
    RegExp(r'Color\s*\(\s*0x'),
    RegExp(r'LucyColors\.'),
  ];

  final forbiddenOAuthPatterns = [
    RegExp(r'continue with', caseSensitive: false),
    RegExp(r'sign_in_with_google', caseSensitive: false),
    RegExp(r'sign_in_with_apple', caseSensitive: false),
    RegExp(r'GoogleSignIn', caseSensitive: false),
    RegExp(r'SignInWithApple', caseSensitive: false),
  ];

  test('auth presentation and shared widgets avoid hardcoded colors', () {
    for (final root in scanRoots) {
      for (final file in _dartFilesUnder(root)) {
        final content = File(file).readAsStringSync();
        for (final pattern in forbiddenColorPatterns) {
          expect(
            pattern.hasMatch(content),
            isFalse,
            reason: '$file must use Theme colorScheme only',
          );
        }
      }
    }
  });

  test('auth pages contain no OAuth sign-in code or copy', () {
    for (final file in _dartFilesUnder('lib/features/auth/presentation/pages')) {
      final content = File(file).readAsStringSync();
      for (final pattern in forbiddenOAuthPatterns) {
        expect(
          pattern.hasMatch(content),
          isFalse,
          reason: '$file must not reference OAuth (phase 1)',
        );
      }
    }
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
