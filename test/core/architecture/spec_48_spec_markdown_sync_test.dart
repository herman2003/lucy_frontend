import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Keeps [SPEC.md] §4.8 checkboxes aligned with the delivered onboarding MVP.
void main() {
  late String specSection48;

  setUpAll(() {
    final spec = File('SPEC.md').readAsStringSync();
    final start = spec.indexOf('### 4.8 Critères d’acceptation');
    final end = spec.indexOf('### 4.9 Plan de mise en place');
    expect(start, greaterThan(0));
    expect(end, greaterThan(start));
    specSection48 = spec.substring(start, end);
  });

  test('MVP app DoD items are checked in SPEC §4.8', () {
    for (final snippet in [
      ..._mvpAppCheckedSnippets,
      ..._mvpAppCheckedSnippetsExtra,
      ..._mvpAppCheckedSnippetsExtraAnalyze,
    ]) {
      expect(specSection48, contains(snippet), reason: snippet);
    }
  });

  test('MVP backend DoD items are checked in SPEC §4.8', () {
    for (final snippet in _mvpBackendCheckedSnippets) {
      expect(specSection48, contains(snippet), reason: snippet);
    }
  });

  test('delivered post-MVP UX-1 item is checked in SPEC §4.8', () {
    for (final snippet in _postMvpCheckedSnippetsUx1) {
      expect(specSection48, contains(snippet), reason: snippet);
    }
  });

  test('remaining post-MVP UX items stay unchecked in SPEC §4.8', () {
    for (final snippet in _postMvpUncheckedSnippets) {
      expect(specSection48, contains(snippet), reason: snippet);
    }
  });

  test('SPEC §4.8 documents MVP vs post-MVP status', () {
    expect(specSection48, contains('**Statut MVP**'));
    expect(specSection48, contains('spec_48_onboarding_dod_test.dart'));
  });
}

const _mvpAppCheckedSnippets = [
  '- [x] 7 questions ; réponses texte libre.',
  '- [x] **`validate-answer` après chaque saisie**',
  '- [x] Si `valid: false` : **`rephrasedQuestion` remplace**',
  '- [x] **« Ce n’est pas ça »**',
  '- [x] **`confirm-turn`**',
  '- [x] **`analyze`** + **`finalize`**',
  '- [x] Réponses ≤ **2000 caractères**',
  '- [x] Guard router : `isConfigured`',
  '- [x] Confirmation obligatoire',
  '- [x] `onboardingTranscript` + `learnerProfile`',
  '- [x] Pas de skip',
  '- [x] l10n fr/en/de',
];

const _mvpBackendCheckedSnippets = [
  '- [x] Catalogue `questionId`',
  '- [x] `validate-answer` : vague',
  '- [x] `isConfigured === true` → **403**',
  '- [x] `analyze` : lit Firestore',
  '- [x] Transcript Firestore',
  '- [x] &gt; **2000 caractères** → `ANSWER_TOO_LONG`',
  '- [x] Nest **Admin**',
  '- [x] JSON IA invalide',
  '- [x] Deux prompts distincts',
  '- [x] Tests : `OnboardingService`',
];

const _mvpAppCheckedSnippetsExtra = [
  '- [x] max **10** tentatives / question',
];

const _mvpAppCheckedSnippetsExtraAnalyze = [
  '- [x] fallback profil après 10 échecs analyze.',
];

const _postMvpCheckedSnippetsUx1 = [
  '- [x] **7 chats**',
];

const _postMvpUncheckedSnippets = [
  '- [ ] Design messagerie complète (avatar, `colorScheme`) ; **swipe entre steps**',
  '- [ ] Retour arrière : modifier un tour',
];
