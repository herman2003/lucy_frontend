# Todo — Lucy frontend

> **Chat (actif)** : [plan-chat.md](./plan-chat.md) · **Index plans** : [plan.md](./plan.md)

**Légende** : `[ ]` à faire · `[x]` fait · `[-]` annulé

---

## Checkpoint CP-CHAT-1 (backend SSE + CRUD)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | CHAT-01 | Backend `ChatModule` + CRUD memory + codes erreur `CHAT_*` |
| [x] | CHAT-02 | Lecture `learnerProfile` + `GET /v1/chats/eligibility` |
| [x] | CHAT-03 | `FirestoreChatsRepository` + factory memory/firestore |
| [x] | CHAT-04 | `chat-tutor.system.hbs` + `LlmStreamingPort` + export `RetrievalService` |
| [x] | CHAT-05 | `POST …/messages/stream` (SSE) + citations post-flux |
| [x] | CHAT-06 | `POST …/messages` JSON (tests) + DELETE fil + tests auth |

**Validation** : curl SSE → `text_delta` + `sources` + `done` (voir plan-chat § CP-CHAT-1).

---

## Checkpoint CP-CHAT-2 (Flutter stream + sources UI)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | CHAT-07 | Flutter data layer + `ApiEndpoints` + l10n + `chat_error_translator` |
| [x] | CHAT-08 | Client SSE + `ChatPage` + bulles + `ChatSourceCard` |

---

## Checkpoint CP-CHAT-3 (miroir local + garde corpus)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | CHAT-09 | Miroir `SharedPreferences` + resync + purge logout + offline |
| [ ] | CHAT-10 | Bannière « activer documents » + tests + checklist manuelle |

---

## Documents & RAG — terminé

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | DOC-01 → DOC-14 | Voir commits / [docs/spec-documents-rag.md](../docs/spec-documents-rag.md) |

---

## Phase D4b — Quiz (après chat)

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | QUIZ-01 | Quiz depuis corpus (spec séparée) |

---

## Stockage R2 (ops)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | R2-01 → R2-05 | Config + adapter + docs |
| [ ] | R2-06 | Validation manuelle web + mobile |

---

## Vérification globale (chaque tâche chat)

```bash
cd backend && npm test -- chat
cd frontend
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n && flutter analyze && flutter test test/features/chat/
```

---

*Ce document a été créé avec Cursor (IA). Todo — Chat P4a actif, 2026-05-27.*
