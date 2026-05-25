import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Plan T04/T05 — Firebase SDK isolated to [lib/features/auth/data].
void main() {
  const allowedFirebaseAuthRoots = [
    'lib/features/auth/data/',
  ];
  const allowedFirestoreRoots = [
    'lib/features/auth/data/',
  ];

  final firebaseAuthImport = RegExp(
    r"import\s+'package:firebase_auth/",
  );
  final firestoreImport = RegExp(
    r"import\s+'package:cloud_firestore/",
  );

  test('firebase_auth imports exist only under auth data layer', () {
    for (final file in _dartFilesUnder('lib')) {
      final content = File(file).readAsStringSync();
      if (!firebaseAuthImport.hasMatch(content)) {
        continue;
      }
      expect(
        allowedFirebaseAuthRoots.any(file.startsWith),
        isTrue,
        reason: '$file must not import firebase_auth outside data/',
      );
    }
  });

  test('cloud_firestore imports exist only under auth data layer', () {
    for (final file in _dartFilesUnder('lib')) {
      final content = File(file).readAsStringSync();
      if (!firestoreImport.hasMatch(content)) {
        continue;
      }
      expect(
        allowedFirestoreRoots.any(file.startsWith),
        isTrue,
        reason: '$file must not import cloud_firestore outside data/',
      );
    }
  });

  test('domain, services and presentation never import Firebase SDK', () {
    const forbiddenRoots = [
      'lib/features/auth/domain/',
      'lib/features/auth/services/',
      'lib/features/auth/presentation/',
    ];
    for (final root in forbiddenRoots) {
      for (final file in _dartFilesUnder(root)) {
        final content = File(file).readAsStringSync();
        expect(firebaseAuthImport.hasMatch(content), isFalse, reason: file);
        expect(firestoreImport.hasMatch(content), isFalse, reason: file);
      }
    }
  });

  test('router and splash use colorScheme only (no LucyColors in UI)', () {
    const uiRoots = [
      'lib/core/router/',
      'lib/core/presentation/',
    ];
    final forbidden = [
      RegExp(r'Color\s*\(\s*0x'),
      RegExp(r'LucyColors\.'),
    ];
    for (final root in uiRoots) {
      for (final file in _dartFilesUnder(root)) {
        final content = File(file).readAsStringSync();
        for (final pattern in forbidden) {
          expect(pattern.hasMatch(content), isFalse, reason: file);
        }
      }
    }
  });

  test('platform configs use bundle id com.lucy.app', () {
    const files = [
      'android/app/build.gradle.kts',
      'macos/Runner/Configs/AppInfo.xcconfig',
      'lib/firebase_options.dart',
    ];
    for (final path in files) {
      final content = File(path).readAsStringSync();
      expect(content, contains('com.lucy.app'), reason: path);
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
