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
| [ ] | P1 | `GEMINI_API_KEY` dans `backend/.env` |
| [ ] | P2 | Compte de service Firebase pour Nest |
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

**CP-0 — Vérification :**

- [x] `cd backend && npm run start:dev` OK
- [x] `flutter analyze` → 0 issue
- [ ] Signup test → Firestore `isConfigured: false`

---

## Phase 1 — Backend `validate-answer`

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | B03 | Prompts `onboarding-validate-answer` + PromptLoader | — |
| [x] | B04 | `POST /v1/onboarding/validate-answer` + tests | **CP-1** |

**CP-1 — Vérification :**

- [ ] `curl` réponse claire → `valid: true`
- [ ] `curl` réponse vague → `valid: false` + `rephrasedQuestion` (pas « Peux-tu préciser »)

---

## Phase 2 — Flutter 1 tour + validate

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | F03 | Route `/onboarding` + guards `isConfigured` | — |
| [x] | F04 | Feature skeleton + l10n 7 questions | — |
| [x] | F05 | `OnboardingChatPage` + appel validate | **CP-2** |

**CP-2 — Vérification :**

- [ ] Connecté, `isConfigured: false` → `/onboarding`
- [ ] Réponse vague → bulle `rephrasedQuestion`, même étape
- [ ] Réponse claire → acknowledgment, tour enregistré

---

## Phase 3 — Backend `analyze`

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | B05 | Prompts analyze + `POST /v1/onboarding/analyze` + tests | **CP-3** |

**CP-3 — Vérification :**

- [ ] Transcript 7 tours → 200 + `learnerProfile` §SPEC 4.4.1
- [ ] Transcript incomplet → 400

---

## Phase 4 — Parcours complet Flutter

| Statut | ID | Tâche | CP |
|--------|-----|--------|-----|
| [x] | F06 | Boucle 7 questions + `analyze` | — |
| [x] | F07 | Écran confirmation + Firestore + `/home` | — |
| [x] | F07b | Signup/login → `/onboarding` si non configuré | **CP-4** |

**CP-4 — Vérification :**

- [ ] E2E : signup → 7 Q/R → confirm → `/home`
- [ ] Firestore : `learnerProfile`, `onboardingTranscript`, `isConfigured: true`

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

## Historique — Auth phase 1 (terminé)

- [x] T01–T14 auth (voir commits / ancien suivi)
- [x] Auth livré — spec détaillée dans [SPEC.md](../SPEC.md) §3

---

*Ce document a été créé avec Cursor (IA).*
