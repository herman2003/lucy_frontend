# Plan — Travail actif

> **Plan mode** — document de pilotage, pas de code applicatif ici.

| Domaine | Statut | Document |
|---------|--------|----------|
| Documents & RAG D1–D3 | **Terminé** | Historique dans [todo.md](./todo.md) (DOC-01→14), spec [docs/spec-documents-rag.md](../docs/spec-documents-rag.md) |
| **Chat P4a** | **Terminé** (CHAT-01→10) | Plan : **[plan-chat.md](./plan-chat.md)** · checklist [cp-chat-manual-checklist.md](../docs/cp-chat-manual-checklist.md) |
| **Quiz P4b** | **En cours** (QUIZ-01 fait) | Spec : [docs/spec-quiz.md](../docs/spec-quiz.md) · Plan : [plan-quiz.md](./plan-quiz.md) |
| Stockage R2 | Implémenté (R2-01→05) | Validation : [cp-r2-manual-checklist.md](../docs/cp-r2-manual-checklist.md) |

**Spec chat** : [SPEC.md](../SPEC.md) §6 · [docs/spec-chat-rag.md](../docs/spec-chat-rag.md)

---

## Résumé exécutif (Chat)

1. **Backend** : CRUD fils Firestore → prompt `learnerProfile` + retrieval → **SSE stream** + citations → tests.
2. **Flutter** : data layer → UI stream + sources → **miroir SharedPreferences** → garde « activer documents ».
3. **Checkpoints** : CP-CHAT-1 (curl SSE) → CP-CHAT-2 (UI stream) → CP-CHAT-3 (cache + logout + quiz orientation).

Voir tâches détaillées avec AC dans [plan-chat.md](./plan-chat.md) et suivi dans [todo.md](./todo.md).

---

*Ce document a été créé avec Cursor (IA). Index des plans — 2026-05-27.*
