# Lucy — Frontend (Flutter)

[English](./README.md) · [Deutsch](./README.de.md)

**Lucy** ist ein personalisierter KI-Lernassistent: Dokumente hochladen, per RAG chatten, Quiz und Karteikarten erzeugen sowie Erinnerungen zur Wiederholung erhalten.

| | |
|---|---|
| **Live-App (Web)** | https://lucy-7504c.web.app |
| **API (Backend)** | https://lucy-api-yo4k.onrender.com |
| **Backend-Repo** | https://github.com/herman2003/lucy_backend |
| **Dieses Repo** | https://github.com/herman2003/lucy_frontend |

> Kostenlose Render-Instanzen schlafen nach ca. 15 Minuten Inaktivität. Der erste API-Aufruf danach kann 30–60 Sekunden dauern.

## Stack

- **Flutter** (iOS, Android, Web, macOS)
- **Firebase Auth**
- **Riverpod** + **Freezed** + **GoRouter**
- **l10n** FR / EN / DE
- Kommunikation nur über die NestJS-API

## Voraussetzungen

- Flutter SDK ^3.10
- Firebase-Projekt `lucy-7504c`
- Backend lokal **oder** die Live-URL oben

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
```

## Lokal starten

Standard-API: `http://localhost:3001`.

```bash
flutter run -d chrome
```

Gegen die Produktions-API:

```bash
flutter run -d chrome \
  --dart-define=LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com
```

## Docker (Flutter Web + nginx)

```bash
LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com docker compose up --build
```

## Deploy (Firebase Hosting)

```bash
flutter build web --release \
  --dart-define=LUCY_API_BASE_URL=https://lucy-api-yo4k.onrender.com
firebase deploy --only hosting --project lucy-7504c
```

## Tests

```bash
flutter test
flutter analyze
```

## Zugehöriges Repository

Backend (NestJS, Gemini, Firestore, R2):  
https://github.com/herman2003/lucy_backend

---

*Dieses Dokument wurde mit Cursor (KI) erstellt.*
