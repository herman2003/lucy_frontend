# Firebase console — T11 checklist (phase 1)

Project: **`lucy-7504c`**

Repo artifacts for Firestore security are versioned (`firestore.rules`, `firebase.json`, `.firebaserc`). Console steps below must still be completed or verified in the [Firebase console](https://console.firebase.google.com/).

---

## Deploy Firestore rules from the repo

```bash
# Requires Firebase CLI: npm i -g firebase-tools && firebase login
firebase deploy --only firestore:rules --project lucy-7504c
```

After deploy, run a signup test and confirm document `users/{uid}` is readable only by that user (SPEC §C).

---

## SPEC §B — Authentication

| Step | Console path | Done |
|------|----------------|------|
| Enable **Email/Password** only | Authentication → Sign-in method | [ ] |
| Disable **Google** | Same | [ ] |
| Disable **Apple** | Same | [ ] |
| Enable **email enumeration protection** | Authentication → Settings | [ ] |

---

## SPEC §C — Firestore profile

| Step | Action | Done |
|------|--------|------|
| Rules deployed | `firebase deploy --only firestore:rules` (see above) | [ ] |
| Signup E2E | New account → `users/{uid}` with `fullName`, `email`, `createdAt` | [ ] |
| Owner-only | Another user cannot read/write foreign `users/{uid}` | [ ] |

---

## SPEC §D — Password reset & web domains

| Step | Console path | Done |
|------|----------------|------|
| Authorized domains | Authentication → Settings → Authorized domains | [ ] |
| Add `localhost` | For local web dev | [ ] |
| Add production domain | When hosting is known | [ ] |
| Reset email template | Authentication → Templates → Password reset | [ ] |
| Action URL (optional) | Point to prod web app or Firebase default | [ ] |

---

## Android / test accounts

| Step | Done |
|------|------|
| Debug SHA-1 registered (see [firebase-oauth-setup.md](./firebase-oauth-setup.md)) | [ ] |
| Test users created (Authentication → Users) | [ ] |

---

## CP-4 verification

- [ ] Rules visible in Firebase console (Firestore → Rules) match `firestore.rules` in git
- [ ] Signup from app creates `users/{uid}` document

---

*Ce document a été créé avec Cursor (IA).*
