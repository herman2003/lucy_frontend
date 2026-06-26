# Todo — Mode professeur (LEARN-06 → LEARN-11)

> **Actif** : génération quiz/cartes guidée · **Specs** : [spec-learning-generation-dialogue.md](../docs/spec-learning-generation-dialogue.md) · [spec-learning-composition-prep.md](../docs/spec-learning-composition-prep.md)

**Légende** : `[ ]` à faire · `[x]` fait

**Décision validée (2026-06-10)** : mode professeur pour **toute** demande quiz/carte. Lot complet LEARN-06→11.

---

## LEARN-06 — Dialogue & garde-fous

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | LEARN-06a | Types `pendingLearningGeneration` + patch thread Firestore |
| [x] | LEARN-06b | Machine à états + tests unitaires |
| [x] | LEARN-06c | Intégration `chat-stream.service` + messages FR/EN/DE |
| [x] | LEARN-06d | Annulation + désambiguïsation quiz vs cartes (base) |
| [x] | LEARN-06e | Checklist CP-LEARN-06 manuelle + message attente stream UX |

---

## LEARN-07 — Mode professeur

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | LEARN-07a | `StudyFocusArea` + `CorpusStudyAnalyzerService` |
| [x] | LEARN-07b | `analyzing` / `awaiting_focus_selection` + cache plan |
| [x] | LEARN-07c | Parser sélection parties |
| [x] | LEARN-07d | Retrieval + generate scopés |
| [x] | LEARN-07e | Profil apprenant + difficulté dans prompts |

---

## LEARN-08 — Outline ingestion

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | LEARN-08a | `document.outline[]` à l’ingestion |
| [ ] | LEARN-08b | Analyzer utilise outline |

---

## LEARN-09 — Qualité session

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | LEARN-09a | Titres session intelligents |
| [ ] | LEARN-09b | Erreurs actionnables |
| [ ] | LEARN-09c | Regénération depuis chat |
| [ ] | LEARN-09d | Prompts définitions + liens |
| [ ] | LEARN-09e | UI sources par item |

---

## LEARN-10 — Suivi pédagogique

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | LEARN-10a | Cartes sur erreurs quiz |
| [ ] | LEARN-10b | Type d’épreuve optionnel |
| [ ] | LEARN-10c | Plan révision en chat |

---

## LEARN-11 — Confort & tardif

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | LEARN-11a | Chips chat |
| [ ] | LEARN-11b | Nombres en lettres |
| [ ] | LEARN-11c | Spaced repetition |
| [ ] | LEARN-11d | Calendrier J-N |
| [ ] | LEARN-11e | *(Option)* Génération onglet Quiz |
| [ ] | LEARN-11f | *(Option)* Choix PDF unique |

---

## Prérequis — livré

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | LEARN-01→05 | Génération + bibliothèque |
| [x] | CHAT-01→10 | Chat P4a |

---

*Ce document a été créé avec Cursor (IA).*
