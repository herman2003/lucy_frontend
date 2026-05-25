# Manual checkpoints — Phase 1 auth

Use this guide after `flutter test` and CI are green. Check items in [tasks/todo.md](../tasks/todo.md) as you complete each step.

## Prerequisites

- Firebase project `lucy-7504c` with Email/Password enabled (see [firebase-console-t11.md](./firebase-console-t11.md))
- Firestore rules deployed: `firebase deploy --only firestore:rules`
- App running: `flutter run -d chrome`

## CP-0 — Splash & routing

1. Open the app → splash shows **Lucy** (not Flutter demo counter).
2. After bootstrap → **login** page with email/password fields.

## CP-1 — Login & session

1. Sign in with a **test user** from Firebase console.
2. Expect navigation to **`/home`**.
3. Tap **Logout** → back to **`/login`**.
4. Hot restart (`R` in terminal) → still on **home** if session persisted.

## CP-2 — Sign up & Firestore

1. **New email** → account created → **`/home`**.
2. In Firestore console → `users/{uid}` with `fullName`, `email`, `createdAt`.
3. **Existing email** → French l10n error (not raw Firebase message).
4. (Optional) Temporarily break rules → signup must **not** reach `/home`.

## CP-3 — Reset password

1. From login → **Réinitialiser** → submit email.
2. Unknown and known emails → **same success UI** (anti-enumeration).
3. **Try again** → form again; **Back to login** → login page.

## CP-4 — Console

1. Confirm rules in Firebase console match `firestore.rules`.
2. Repeat signup → document visible under `users`.

## CP-5 — UI review

- **Web** ~1440px: login, signup, reset (no Google/Apple buttons).
- **Mobile** ~390px: gradient layout, same flows.
- Switch device language **fr / en / de** → labels update.

---

*Ce document a été créé avec Cursor (IA).*
