import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('firestore.rules denies client access on users/{uid}', () {
    final rulesFile = File('firestore.rules');
    expect(rulesFile.existsSync(), isTrue);

    final content = rulesFile.readAsStringSync();
    expect(content, contains('rules_version'));
    expect(content, contains('match /users/{userId}'));
    expect(content, contains('allow read, write: if false'));
    expect(content, isNot(contains('request.auth.uid == userId')));
    expect(content, isNot(contains('allow read, write: if true')));
  });

  test('firebase.json references firestore rules for deploy', () {
    final configFile = File('firebase.json');
    expect(configFile.existsSync(), isTrue);

    final config =
        jsonDecode(configFile.readAsStringSync()) as Map<String, dynamic>;
    final firestore = config['firestore'] as Map<String, dynamic>?;

    expect(firestore, isNotNull);
    expect(firestore!['rules'], 'firestore.rules');
  });

  test('.firebaserc points to lucy-7504c project', () {
    final rcFile = File('.firebaserc');
    expect(rcFile.existsSync(), isTrue);

    final rc = jsonDecode(rcFile.readAsStringSync()) as Map<String, dynamic>;
    final projects = rc['projects'] as Map<String, dynamic>;

    expect(projects['default'], 'lucy-7504c');
  });
}
