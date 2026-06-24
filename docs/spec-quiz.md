# Lucy — Quiz source-based (spec)

> **Statut** : **Partiellement livré** — QUIZ-01 OK ; génération → **[docs/spec-learning-generation.md](./spec-learning-generation.md)**  
> **Parent** : [SPEC.md](../SPEC.md) §7 · [docs/spec-documents-rag.md](./spec-documents-rag.md) · [docs/spec-chat-rag.md](./spec-chat-rag.md)  
> **Dépendances** : documents D1–D3, chat P4a (eligibility corpus aligné)

---

## 1. Objectif

### 1.1 Utilisateurs

| Persona | Besoin |
|---------|--------|
| **Apprenant** | Générer un **quiz** (QCM) à partir des documents **actifs** (`searchEnabled`, `ready`) |
| **Apprenant** | Sans corpus actif : **CTA Documents** — pas de génération à vide |
| **Développeur** | API Nest + Flutter Clean Architecture, mêmes règles auth / corpus que le chat |

### 1.2 Hors périmètre MVP (proposition)

| Exclu | Détail |
|-------|--------|
| Génération quiz **depuis le chat** | Orientation texte uniquement (déjà en place) |
| Historique multi-sessions quiz complexe | MVP : session courante ou liste simple (à trancher §10) |
| Streaming quiz | Réponse JSON structurée en une requête |

### 1.3 Corpus (aligné chat C3 / C5)

- Même garde que le chat : au moins un document `ready` + `searchEnabled`.
- `GET /v1/quizzes/eligibility` → `{ canQuiz, activeDocumentCount }`.

---

## 2. API Nest (proposition)

| Méthode | Route | Rôle |
|---------|-------|------|
| `GET` | `/v1/quizzes/eligibility` | Garde corpus (+ profil requis avant génération) |
| `POST` | `/v1/quizzes/generate` | Body `{ questionCount?: number }` → quiz structuré (QUIZ-02+) |

Auth : `FirebaseAuthGuard` (identique chat / documents).

Codes erreur proposés : `QUIZ_NO_ACTIVE_DOCUMENTS`, `QUIZ_LEARNER_PROFILE_MISSING` (miroir chat).

---

## 3. Flutter

- Feature `lib/features/quiz/` — Clean Architecture.
- `QuizPage` : eligibility au mount, bannière si `!canQuiz`, CTA Documents.
- l10n dédiées (`quizNoCorpus*`, etc.).

---

## 4. Phases (plan)

| Id | Livrable |
|----|----------|
| **QUIZ-01** | Spec + `GET eligibility` + garde UI |
| **QUIZ-02** | `POST generate` + affichage QCM |
| **QUIZ-03** | Persistance tentatives + polish + checklist CP-QUIZ |

---

## 5. Questions ouvertes (validation produit)

1. Nombre de questions par défaut (5 ? 10 ?) et plafond ?
2. Types de questions : QCM 4 choix uniquement en MVP ?
3. Faut-il citer les sources (chunks) sous chaque question comme le chat ?
4. Persistance Firestore des sessions quiz : oui/non pour MVP ?

---

*Ce document a été créé avec Cursor (IA).*
