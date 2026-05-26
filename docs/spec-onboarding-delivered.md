# Onboarding — spec livrée (archive)

> Hors `SPEC.md` actif. Conservé pour traçabilité et tests `spec_48_spec_markdown_sync_test.dart`.

### 4.8 Critères d’acceptation

**Statut MVP** : cases `[x]` = livré. Tests : `test/core/architecture/spec_48_onboarding_dod_test.dart`, `backend/.../spec-48-dod.spec.ts`.

#### App

- [x] 7 questions ; réponses texte libre.
- [x] **`validate-answer` après chaque saisie** ; si `valid: true`, **`turnSummary` + confirmation utilisateur** avant question suivante.
- [x] Si `valid: false` : **`rephrasedQuestion` remplace** le libellé (pas « Peux-tu préciser »).
- [x] max **10** tentatives / question ; 10 échecs validate → **`fallbackSummary`** + validation / rendu réduit si refus.
- [x] **« Ce n’est pas ça »** après `turnSummary` → retour saisie sans `confirm-turn`.
- [x] **`confirm-turn`** après « C’est bon » ; Nest écrit Firestore ; miroir local.
- [x] **`analyze`** + **`finalize`** pour clôturer (écran confirmation profil).
- [x] fallback profil après 10 échecs analyze.
- [x] **7 chats** (1 step = 1 fil) ; typing Lucy pendant appels IA ; steps futurs **verrouillés**.
- [x] Design messagerie complète (avatar, `colorScheme`) ; **swipe entre steps** terminés + courant.
- [x] Retour arrière : modifier un tour n’efface pas les autres.
- [x] Réponses ≤ **2000 caractères** ; boutons désactivés pendant appels (widget partagé).
- [x] Guard router : `isConfigured` lu via **`GET /v1/users/me`** (plus Firestore client).
- [x] Confirmation obligatoire avant Firestore.
- [x] `onboardingTranscript` + `learnerProfile` + `isConfigured: true` après validation.
- [x] Pas de skip ; garde `/home` si `false`.
- [x] l10n fr/en/de ; Clean Architecture ; pas de message API brut.

#### Backend

- [x] Catalogue `questionId` + `locale` côté serveur ; client n’envoie pas `questionText`.
- [x] `validate-answer` : vague → `valid: false` + `rephrasedQuestion` ; clair → `valid: true` + **`turnSummary` obligatoire**.
- [x] `isConfigured === true` → **403** sur les deux routes.
- [x] `analyze` : lit Firestore, 7 entrées → 200 + `learnerProfile` §4.4.1.
- [x] Transcript Firestore &lt; 7 → `ONBOARDING_TRANSCRIPT_INCOMPLETE`.
- [x] &gt; **2000 caractères** → `ANSWER_TOO_LONG` ; catalogue `questions/` ; `confirm-turn` + `finalize`.
- [x] Nest **Admin** : seul writer onboarding ; Flutter read + local mirror.
- [x] JSON IA invalide → 502 ; profil incomplet → 422.
- [x] Deux prompts distincts dans `src/prompts/`.
- [x] Tests : `OnboardingService` + `LlmPort` mocké (validate + analyze).

### 4.9 Plan de mise en place

(terminé)

---

*Créé par Cursor (IA). Archive extraite de SPEC.md, 2026-05-25.*
