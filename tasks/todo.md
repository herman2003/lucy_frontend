# Lucy Phase 1 — Liste de tâches

> Suivi d’exécution pour [plan.md](./plan.md). Cocher `[x]` au fur et à mesure.  
> **Ne pas commencer T04+ avant CP-0** (analyze vert + Firebase init).

---

## Légende

- **ID** : identifiant tâche  
- **CP** : checkpoint de phase  
- **Bloc** : dépendance externe (console Firebase / Apple)

---

## Phase 0 — Fondation

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | T01 | Aligner bundle ID (`com.lucy.app`) + `flutterfire configure` | CP-0 |
| [x] | T02 | `pubspec` deps Firebase/Riverpod/GoRouter + init `main.dart` | CP-0 |
| [x] | T03 | Core : `LucyFlexTheme` + l10n + routes ; couleurs UI = **colorScheme** only | CP-0 |

**CP-0 — Vérification :**
- [x] `flutter analyze` → 0 issue
- [ ] `flutter run -d chrome` → splash Lucy + GoRouter (plus demo compteur)

---

## Phase 1 — Login email → Home

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | T04 | Auth + **Firestore** profil (`users/{uid}`) + rollback signup | — |
| [x] | T05 | `AuthService` + `auth_error_translator` + clés ARB erreurs | — |
| [x] | T06 | GoRouter + **splash** + guard + `authStateProvider` | — |
| [x] | T07 | Shared : Lucy*Button, Lucy*TextField, logo (pattern AfroSchool, thème) | — |
| [x] | T08 | `LoginPage` + `HomePage` placeholder + slice email E2E | **CP-1** |

**CP-1 — Vérification :**
- [ ] Login compte Firebase test → `/home`
- [ ] Logout → `/login`
- [ ] Hot restart web : session toujours active

---

## Phase 2 — Sign up

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | T09 | `SignUpPage` + Auth + Firestore → `/home` si tout OK | **CP-2** |

**CP-2 — Vérification :**
- [ ] Nouveau compte → doc Firestore `users/{uid}` + `/home`
- [ ] Échec Firestore → pas de `/home` (rollback)
- [ ] Email existant → message l10n (pas message Firebase brut)

---

## Phase 3 — Reset password

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | T10 | `ResetPasswordPage` form + succès + `sendPasswordResetEmail` | **CP-3** |

**CP-3 — Vérification :**
- [ ] Email reset reçu ou succès côté Firebase Auth
- [ ] UI succès identique email inconnu / connu (anti-énumération)
- [ ] Try again + Back to login OK

---

## Phase 4 — Console & qualité

| Statut | ID | Tâche | CP | Bloc |
|--------|-----|--------|-----|------|
| [ ] | T11 | Console : Email only, **Firestore rules**, domaines, enum protection | **CP-4** | **Bloc** |
| ~~[ ]~~ | ~~T12~~ | ~~OAuth~~ — **annulé** | — | — |

**CP-4 — Vérification :**
- [ ] Règles Firestore déployées
- [ ] Signup test → document `users/{uid}` visible

---

## Phase 5 — Qualité

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | T13 | l10n fr/en/de complète + branding web (`index.html`, manifest) | — |
| [x] | T14 | Tests unit/widget + DoD SPEC §1.4 | **CP-5** |

**CP-5 — Vérification :**
- [x] `flutter test` vert (58 tests)
- [x] `flutter analyze` vert
- [ ] Revue UI : login, signup, reset — web ~1440px + mobile ~390px
- [ ] Tous les AC [SPEC.md §1.4](../SPEC.md) cochés

---

## Checklist SPEC §1.4 (Definition of Done)

- [ ] 3 écrans conformes design (l10n fr/en/de), shared widgets + thème — **revue visuelle manuelle**
- [x] Flux UI → Notifier → Service → Repository ; **mapper** data → entity domain (tests notifiers + mappers + `AuthService`)
- [x] Erreurs Firebase → translator → l10n (`auth_error_translator_test`)
- [x] `authStateChanges` + splash bootstrap + guard GoRouter + signOut (router + page tests)
- [x] Aucun bouton / code Google ou Apple (`lucy_auth_ui_conventions_test`)
- [x] Layouts web + mobile (`widget_test` + `AuthWebLayout` / `AuthMobileLayout`)
- [x] Redirect post auth → `/home` (login/signup page tests)
- [x] `build_runner` documenté / exécuté après Freezed-Riverpod (README)

---

## Checklist console Firebase (T11 — humain)

- [ ] Email/Password activé (**seul** provider)
- [ ] Firestore : règles `users/{uid}` (owner only)
- [ ] Email enumeration protection activée
- [ ] Domaines autorisés web (`localhost` + prod)
- [ ] Template / lien reset password configuré
- [ ] SHA-1 Android (debug) dans Firebase
- [ ] Comptes de test créés

---

## Ordre rapide

```
T01 → T02 → T03 → T04 → T05 → T06 → T08 (+ T07 en parallèle après T03)
→ T09 → T10 → (T11 → T12) → T13 → T14
```

---

*Ce document a été créé avec Cursor (IA).*
