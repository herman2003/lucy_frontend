# Lucy Onboarding — Liste de tâches

> Suivi pour [plan.md](./plan.md) et [SPEC.md](../SPEC.md) §4.  
> Cocher `[x]` au fur et à mesure. **Auth phase 1** : terminée (historique en bas).

---

## Légende

| Colonne | Signification |
|---------|----------------|
| **ID** | Tâche |
| **CP** | Checkpoint |
| **Bloc** | Prérequis humain / externe |

---

## Prérequis humains

| Statut | ID | Action |
|--------|-----|--------|
| [x] | P0 | Repo `Lucy/backend/` créé (hors repo git `frontend/`) |
| [x] | P1 | `GEMINI_API_KEY` dans `backend/.env` (dev : `LLM_PROVIDER=mock` + B09 ; prod : clé réelle) |
| [x] | P2 | Compte de service Firebase pour Nest (dev : memory + `dev:<uid>` + B09 ; prod : Admin SDK) |
| [x] | P3 | CORS backend (Flutter web + localhost) |
| [x] | P4 | Firestore rules commentées (R6) — onboarding écrit par Nest en prod |

---

## Phase 0 — Fondation

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | B01 | Scaffold NestJS + health | CP-0 |
| [x] | B02 | Core : Firebase guard, LlmPort, Gemini, errors | CP-0 |
| [x] | F01 | `dio` + `ApiEndpoints` + `LucyDioClient` (token + 401 retry) | CP-0 |
| [x] | F02 | `isConfigured: false` au signup + mapper + `fetchUserProfile` | CP-0 |
| [x] | B07 | `MockLlmAdapter` + `LLM_PROVIDER=mock` (dev sans clé Gemini) | — |
| [x] | B08 | Firestore mémoire + auth `dev:<uid>` (dev sans service account) | — |
| [x] | B09 | `npm run start:dev:local` + `/health` dev stack + doc | — |

**CP-0 — Vérification :**

- [x] `cd backend && npm run start:dev` OK
- [x] `flutter analyze` → 0 issue
- [x] Signup test → Firestore `isConfigured: false` (`cp0_signup_is_configured_test` + `auth_repository_impl_test`)

---

## Phase 1 — Backend `validate-answer`

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | B03 | Prompts `onboarding-validate-answer` + PromptLoader | — |
| [x] | B04 | `POST /v1/onboarding/validate-answer` + tests | **CP-1** |

**CP-1 — Vérification :**

- [x] `curl` réponse claire → `valid: true` (auto : `onboarding.service.mock-llm.spec` avec `LLM_PROVIDER=mock`)
- [x] `curl` réponse vague → `valid: false` + `rephrasedQuestion` (pas « Peux-tu préciser »)

---

## Phase 2 — Flutter 1 tour + validate

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | F03 | Route `/onboarding` + guards `isConfigured` | — |
| [x] | F04 | Feature skeleton + l10n 7 questions | — |
| [x] | F05 | `OnboardingChatPage` + appel validate | **CP-2** |

**CP-2 — Vérification :**

- [x] Connecté, `isConfigured: false` → `/onboarding` (auto : `lucy_router_guards_onboarding_test`)
- [x] Réponse vague → bulle `rephrasedQuestion`, même étape (auto : `onboarding_chat_page_test`)
- [x] Réponse claire → acknowledgment, tour enregistré (auto : `onboarding_chat_confirm_test`)

---

## Phase 3 — Backend `analyze`

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | B05 | Prompts analyze + `POST /v1/onboarding/analyze` + tests | **CP-3** |

**CP-3 — Vérification :**

- [x] Transcript 7 tours → 200 + `learnerProfile` §SPEC 4.4.1 (auto : `onboarding.flow.memory.spec.ts`)
- [x] Transcript incomplet → 400 (auto : `onboarding-analyze.spec.ts` + flow memory)

---

## Phase 4 — Parcours complet Flutter

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | F06 | Boucle 7 questions + `analyze` | — |
| [x] | F07 | Écran confirmation + Firestore + `/home` | — |
| [x] | F07b | Signup/login → `/onboarding` si non configuré | **CP-4** |

**CP-4 — Vérification :**

- [x] E2E : signup → 7 Q/R → confirm → `/home` (auto : `onboarding_cp4_e2e_flow_test`)
- [x] Firestore : `learnerProfile`, `onboardingTranscript`, `isConfigured: true` (auto : `onboarding.flow.memory.spec.ts` + finalize E2E)

---

## Phase 5 — Qualité

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | F08 | `onboarding_error_translator` + l10n erreurs API | — |
| [x] | F09 | Tests unit/widget/router | — |
| [x] | B06 | README backend | **CP-5** |

**CP-5 — Vérification :**

- [x] `flutter test` vert
- [x] `flutter analyze` vert
- [x] Checklist SPEC §4.8 app + backend cochée (DoD automatisé ; voir `docs/manual-checkpoints-onboarding.md` pour E2E)

---

## Checklist SPEC §4.8 (Definition of Done)

### App

- [x] 7 questions ; réponses texte libre
- [x] `validate-answer` après chaque réponse
- [x] `valid: false` → `rephrasedQuestion` (pas « Peux-tu préciser »)
- [x] `analyze` après 7 tours validés
- [x] Confirmation avant Firestore
- [x] Pas de skip ; garde router
- [x] l10n fr/en/de ; Clean Architecture

### Backend

- [x] `validate-answer` + `analyze` conformes SPEC
- [x] Prompts dans `src/prompts/`
- [x] `LlmPort` + Gemini
- [x] Tests unitaires

---

## Ordre rapide

```
P0–P2 → B01 → B02 → B03 → B04 (CP-1)
              ↘ F01 → F02 → F03 → F04 → F05 (CP-2)
→ B05 (CP-3) → F06 → F07 → F07b (CP-4) → F08 → F09 → B06 (CP-5)
```

---

## Phase 6 — Documentation

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | DOC-1 | Aligner SPEC §4.8 (MVP `[x]` / post-MVP `[ ]`) + test sync | — |

---

## Phase 7 — Post-MVP SPEC §4.6

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | UX-2 | Max 10 `validate` / question + `fallbackSummary` + `fallbackReduced` | — |
| [x] | UX-3 | Max 10 `analyze` + `fallbackProfileSummary` + `profileReduced` | — |
| [x] | UX-1 | 7 chats isolés + typing Lucy + steps futurs verrouillés | — |
| [x] | UX-4 | Design messagerie (avatar) + swipe steps terminés | — |
| [x] | UX-5 | Retour arrière sans effacer les autres tours | — |

---

## Phase 8 — Reprise Firestore (Q3)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | Q3 | `bootstrap` : lire `onboardingTranscript` + rouvrir premier step non confirmé | — |

**Q3 — Vérification :**

- [x] `OnboardingProgressRepository` + datasource Firestore `users/{uid}`
- [x] `buildOnboardingResumeState` + tests unitaires
- [x] `OnboardingChatNotifier.bootstrap` + test + overrides widget/auth
- [x] `flutter test` onboarding + architecture Firestore onboarding/data

---

## Phase 9 — Reprise écran confirmation (Q3 suite)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | Q3b | `awaiting_final_confirm` : `pendingSummaryForUser` + `pendingLearnerProfile` → confirm | — |

**Q3b — Vérification :**

- [x] Lecture Firestore des champs `pending*`
- [x] `buildOnboardingResumeState` → `analysisReady` + navigation confirm
- [x] Tests unitaires + `bootstrap`

---

## Phase 10 — Reprise analyze (Q3 suite)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | Q3c | `awaiting_analyze` + 7 tours → relancer `analyze` au bootstrap | — |

**Q3c — Vérification :**

- [x] `shouldResumeAnalyze` + état `analyzing` dans le builder
- [x] `bootstrap` appelle `_runAnalyze` automatiquement
- [x] Tests unitaires + bootstrap

---

## Phase 11 — Miroir local (A16)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | A16 | `shared_preferences` : `uiLocale` + brouillon onboarding (Firestore prioritaire) | — |

**A16 — Vérification :**

- [x] `OnboardingLocalDraftRepository` + prefs datasource
- [x] Persistance brouillon (réponse, confirmation en attente, tours locaux)
- [x] `bootstrap` : Firestore d’abord, sinon brouillon local
- [x] Effacement du brouillon après `finalize`
- [x] `flutter test` / `flutter analyze`

---

## Historique — Auth phase 1 (terminé)

- [x] T01–T14 auth (voir commits / ancien suivi)
- [x] Auth livré — spec détaillée dans [SPEC.md](../SPEC.md) §3

---

## Phase 12 — Centralisation backend : profil user (C-B1 + C-F1)

> Spec : [docs/spec-backend-centralization.md](../docs/spec-backend-centralization.md)  
> Plan : [plan.md](./plan.md) §11

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | C-B1a | `UsersModule` + port repository (Firebase / memory) | — |
| [x] | C-B1b | DTOs parse create + response profil | — |
| [x] | C-B1c | `GET` + `POST /v1/users/me` + guard + tests | **CP-C1** |
| [x] | C-B1d | Erreur `USER_PROFILE_CONFLICT` (409) si conflit | — |
| [ ] | C-F1a | `ApiEndpoints.usersMe` + `UserProfileApiRemoteDataSource` | — |
| [ ] | C-F1b | Swap provider auth : API au lieu de Firestore ; signup POST | — |
| [ ] | C-F1c | Router / bootstrap `isConfigured` via API | **CP-C2** |
| [ ] | C-F1d | Translator l10n nouveaux codes API | — |

**CP-C1 — Vérification :**

- [x] `curl -H "Authorization: Bearer <token>" http://localhost:3000/v1/users/me` → 200
- [x] `curl -X POST …/v1/users/me` → 201 profil ; second POST → 200 idempotent
- [x] `npm test` users vert

**CP-C2 — Vérification :**

- [ ] Signup app → doc Firestore créé par Nest (pas SDK client)
- [ ] Login `isConfigured: false` → `/onboarding` ; `true` → `/home`
- [ ] `auth_repository_impl_test` + guards verts

---

## Phase 13 — Centralisation backend : reprise onboarding (C-B2 + C-F2)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [ ] | C-B2a | DTO `onboarding-progress-response` | — |
| [ ] | C-B2b | `GET /v1/onboarding/progress` + tests | **CP-C3** |
| [ ] | C-F2a | `ApiEndpoints.onboardingProgress` + datasource API | — |
| [ ] | C-F2b | Provider onboarding : Firestore → API | **CP-C4** |
| [ ] | C-F2c | Fallback brouillon local si API indisponible (A16) | — |

**CP-C3 — Vérification :**

- [ ] `curl GET …/v1/onboarding/progress` mid-parcours → transcript + status
- [ ] État vide → 200 `not_started` (pas 404 bruyant)

**CP-C4 — Vérification :**

- [ ] `onboarding_bootstrap_resume_test` vert (API mock)
- [ ] Reprise manuelle kill app → panels restaurés

---

## Phase 14 — Nettoyage Firestore client (C-F3)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [ ] | C-F3a | Supprimer `firestore_user_profile_remote_data_source.dart` | — |
| [ ] | C-F3b | Supprimer `onboarding_progress_firestore_data_source.dart` | — |
| [ ] | C-F3c | Retirer `cloud_firestore` du `pubspec.yaml` | — |
| [ ] | C-F3d | Mettre à jour `lucy_clean_architecture_test` | **CP-C5** |

**CP-C5 — Vérification :**

- [ ] Aucun `import cloud_firestore` dans `lib/`
- [ ] `flutter analyze` → 0 issue
- [ ] `flutter test` vert
- [ ] `npm test` backend vert

---

## Phase 15 — Ops & documentation (C-OPS + C-DOC)

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [ ] | C-OPSa | Firestore rules : deny client read/write `users/{uid}` (doc) | — |
| [ ] | C-OPSb | README backend : endpoints `users/me`, `onboarding/progress` | — |
| [ ] | C-DOC | Aligner SPEC.md §3, §4.1 A7, §4.7 | **CP-C6** |

**CP-C6 — Vérification :**

- [ ] E2E manuel : signup → onboarding complet → `/home` (backend `.env` Firebase réel)
- [ ] Checklist [docs/spec-backend-centralization.md](../docs/spec-backend-centralization.md) §9 DoD cochée

---

## Prérequis — Centralisation (P5–P6)

| Statut | ID | Action |
|--------|-----|--------|
| [x] | P5 | `backend/.env` + `GOOGLE_APPLICATION_CREDENTIALS` configurés |
| [ ] | P6 | `npm run start:dev` OK ; `curl /health` → 200 |

---

## Ordre rapide — Centralisation

```
P5–P6
→ C-B1 (CP-C1) → C-F1 (CP-C2)
→ C-B2 (CP-C3) → C-F2 (CP-C4)
→ C-F3 (CP-C5) → C-OPS + C-DOC (CP-C6)
```

---

*Ce document a été créé avec Cursor (IA).*
