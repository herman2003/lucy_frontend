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

## Historique — Auth phase 1 (terminé)

- [x] T01–T14 auth (voir commits / ancien suivi)
- [x] Auth livré — spec détaillée dans [SPEC.md](../SPEC.md) §3

---

*Ce document a été créé avec Cursor (IA).*
