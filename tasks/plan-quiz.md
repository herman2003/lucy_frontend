# Plan — Quiz source-based (P4b)

> **Spec** : [docs/spec-quiz.md](../docs/spec-quiz.md) (proposition MVP)  
> **Prérequis** : documents D3, chat P4a

---

## Tâches

### QUIZ-01 — Eligibility + garde corpus UI

| | |
|--|--|
| **Livrable** | `GET /v1/quizzes/eligibility`, feature Flutter data + `QuizPage` garde |
| **AC** | [x] `canQuiz: false` → bannière + pas d’action génération ; [x] CTA → `/documents` ; [x] tests Nest + Flutter |

### QUIZ-02 — Génération quiz (à faire)

`POST /v1/quizzes/generate`, prompt LLM structuré, UI questions/réponses.

### QUIZ-03 — Finition + CP-QUIZ (à faire)

Persistance, checklist manuelle, tests e2e.

---

*Ce document a été créé avec Cursor (IA).*
