# Lucy — Frontend (Flutter)

[English](./README.md) · [Deutsch](./README.de.md)

**Lucy** is a personalized AI learning assistant: upload study documents, chat with RAG answers, generate quizzes and flashcards, and get revision reminders.

| | |
|---|---|
| **Live app (web)** | https://lucy-7504c.web.app |
| **API (backend)** | https://lucy-api-yo4k.onrender.com |
| **Backend repo** | https://github.com/herman2003/lucy_backend |
| **This repo** | https://github.com/herman2003/lucy_frontend |

> Free Render instances sleep after ~15 minutes of inactivity. The first API call after idle can take 30–60 seconds.

## Stack

- **Flutter** (iOS, Android, Web, macOS)
- **Firebase Auth** (email/password)
- **Riverpod** + **Freezed** + **GoRouter**
- **l10n** FR / EN / DE
- Talks only to the NestJS API (no direct Firestore reads for app data)

## Requirements

- Flutter SDK ^3.10
- Firebase project `lucy-7504c` (see `lib/firebase_options.dart`)
- Backend running locally **or** the live Render URL above

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## Run (local)

Default API URL is `http://localhost:3001`.

```bash
flutter run -d chrome
# or: flutter run -d ios / android / macos
```

Point the client at another API (e.g. production):

```bash
flutter run -d chrome \
  --dart-define=LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com
```

## Docker (Flutter web + nginx)

```bash
# Build & serve static web on http://localhost:8080
LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com docker compose up --build
```

Or build only:

```bash
docker build \
  --build-arg LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com \
  -t lucy-frontend-web .
```

## Deploy (Firebase Hosting)

```bash
flutter build web --release \
  --dart-define=LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com
firebase deploy --only hosting --project lucy-7504c
```

Hosting config: `firebase.json` → `public: build/web`.

## Localization (fr / en / de)

- ARB files: `lib/core/localization/l10n/app_*.arb`
- Regenerate: `flutter gen-l10n`
- UI locale defaults to **German** (`de`) via `kLucyAppLocale`

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

## Firebase

- Firestore rules: [`firestore.rules`](./firestore.rules) — deny client access on user data (Nest Admin SDK only)
- Deploy rules: `firebase deploy --only firestore:rules --project lucy-7504c`

## Features (high level)

- Auth + onboarding learner profile
- Document upload (PDF / DOCX / …) via Nest → R2
- Chat with RAG (SSE streaming)
- Quiz & flashcards generation (“Professor Mode”)
- Revision calendar / reminders (FCM)

## Docs

- [SPEC.md](./SPEC.md)
- [docs/](./docs/) — feature specs and manual checkpoints
- [docs/pitch/Lucy-Pitch-Deck.pdf](./docs/pitch/Lucy-Pitch-Deck.pdf) — pitch deck (DE, PDF)
- [tasks/](./tasks/) — implementation plan / todos

## Related repository

Backend (NestJS, Gemini, Firestore, R2):  
https://github.com/herman2003/lucy_backend

---

*Ce document a été créé avec Cursor (IA).*
