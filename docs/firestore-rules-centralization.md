# Firestore rules — centralisation backend (C-OPS)

After migration **C-F3**, the Flutter app no longer imports `cloud_firestore`. All reads and writes on `users/{uid}` go through Nest (`GET/POST /v1/users/me`, onboarding routes, Admin SDK).

## Rule policy

| Path | Client SDK | Nest Admin SDK |
|------|------------|----------------|
| `users/{uid}` | **Denied** (`allow read, write: if false`) | Allowed (service account) |

Source of truth in git: [`firestore.rules`](../firestore.rules).

## Deploy

From the Flutter repo root (where `firebase.json` lives):

```bash
firebase deploy --only firestore:rules --project lucy-7504c
```

Verify in [Firebase console](https://console.firebase.google.com/) → Firestore → Rules that the deployed rules match git.

## When to deploy

- **Before** pointing production/staging Flutter builds at Nest-only data paths (post C-F3).
- **After** any change to `firestore.rules` on `main`.

## Rollback

If a legacy client still needs owner read/write temporarily, revert `firestore.rules` to the previous owner-only policy and redeploy. Post-centralization, rollback should not be required.

## Related

- [spec-backend-centralization.md](./spec-backend-centralization.md) §1.2, §6.2
- [firebase-console-t11.md](./firebase-console-t11.md) — console checklist
- Backend README — `users/me`, `onboarding/progress` endpoints

---

*Ce document a été créé avec Cursor (IA).*
