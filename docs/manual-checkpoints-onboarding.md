# Manual checkpoints — Onboarding (SPEC §4)

Use after `flutter test`, `flutter analyze`, and `cd ../backend && npm test` are green.  
Automated structural DoD: `test/core/architecture/spec_48_onboarding_dod_test.dart` and `backend/src/features/onboarding/spec-48-dod.spec.ts`.

## Prerequisites

- [tasks/todo.md](../tasks/todo.md) P1: `GEMINI_API_KEY` in `backend/.env`
- P2: `GOOGLE_APPLICATION_CREDENTIALS` (service account) for Firestore Admin
- Backend: `cd ../backend && npm run start:dev` → `curl http://localhost:3000/health`
- App: `flutter run -d chrome` (API base `http://localhost:3000` via `ApiEndpoints`)

## CP-0 — Signup profile flag

1. Create a **new** account via signup.
2. Firestore `users/{uid}` → `isConfigured: false`.

## CP-1 — validate-answer (curl or app)

1. With Firebase id token, `POST /v1/onboarding/validate-answer` with a **clear** answer → `valid: true` + `turnSummary`.
2. Repeat with a **vague** answer → `valid: false` + `rephrasedQuestion` (not a generic “Peux-tu préciser”).

## CP-2 — Flutter first turns

1. Login as user with `isConfigured: false` → redirect **`/onboarding`**.
2. Vague answer → Lucy shows `rephrasedQuestion`, same step.
3. Clear answer → summary + confirm → next question after `confirm-turn`.

## CP-3 — analyze

1. After **7** confirmed turns in Firestore, `POST /v1/onboarding/analyze` → `200` + `learnerProfile`.
2. With &lt; 7 turns → `ONBOARDING_TRANSCRIPT_INCOMPLETE` (422).

## CP-4 — Full E2E

1. Signup → complete **7** Q/R with confirmations → analyze → **`/onboarding/confirm`** → finalize.
2. Land on **`/home`**; logout/login still respects `isConfigured: true`.
3. Firestore: `isConfigured: true`, `learnerProfile`, onboarding transcript per backend writes.

## CP-5 — Automated + review

- [x] `flutter test` / `flutter analyze`
- [x] `npm test` in `backend/`
- [ ] Full SPEC §4.8 UX items (7 isolated chats, swipe, fallback after 10 failures) — product review if not in MVP scope

---

*Ce document a été créé avec Cursor (IA).*
