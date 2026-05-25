# Lucy (frontend)

Flutter client for **Lucy** — personalized AI tutoring (phase 1: Firebase email/password authentication).

## Requirements

- Flutter SDK ^3.10
- Firebase project `lucy-7504c` (see `lib/firebase_options.dart`)

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## Run

```bash
flutter run -d chrome
# or: flutter run -d ios / android
```

## Localization (fr / en / de)

- ARB files: `lib/core/localization/l10n/app_*.arb`
- Regenerate: `flutter gen-l10n`
- Untranslated keys: `untranslated_messages.txt` (should stay empty)
- The app uses the **device language** when it is `fr`, `en`, or `de`; otherwise it falls back to French (`lib/core/localization/lucy_locale_resolution.dart`).

## Code generation

After changing Freezed models or `@riverpod` providers:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Tests

```bash
flutter test
flutter analyze
```

CP-0 web smoke (requires a prior web build):

```bash
flutter build web
flutter test test/smoke/cp0_web_build_test.dart
```

## Firebase (T11)

- Firestore security rules: [`firestore.rules`](./firestore.rules) (`users/{uid}` owner-only, SPEC §C)
- Deploy rules: `firebase deploy --only firestore:rules --project lucy-7504c`
- Console checklist: [docs/firebase-console-t11.md](./docs/firebase-console-t11.md)

## CI

GitHub Actions runs `flutter analyze`, `flutter test`, and `flutter build web` on push/PR (see [.github/workflows/ci.yml](./.github/workflows/ci.yml)).

## Project docs

- [SPEC.md](./SPEC.md) — spec produit (auth livré + onboarding)
- [tasks/plan.md](./tasks/plan.md) — implementation plan
- [tasks/todo.md](./tasks/todo.md) — task checklist
- [docs/manual-checkpoints.md](./docs/manual-checkpoints.md) — auth phase 1 (validation manuelle)
- [docs/manual-checkpoints-onboarding.md](./docs/manual-checkpoints-onboarding.md) — onboarding CP-0 à CP-5
- [docs/dev-local-stack.md](./docs/dev-local-stack.md) — backend mock + memory sans P1/P2

---

*Ce document a été créé avec Cursor (IA).*
