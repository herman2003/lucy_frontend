# Todo — Documents & RAG

> Plan détaillé : [plan.md](./plan.md) · Spec : [SPEC.md](../SPEC.md) §3

**Légende** : `[ ]` à faire · `[x]` fait · `[-]` annulé

---

## Checkpoint CP-D1 (upload + liste)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | DOC-01 | Backend create + list (memory, DTOs, erreurs document) |
| [x] | DOC-02 | Backend complete, delete, download URL, PATCH searchEnabled (max 5), validations MIME/taille |
| [x] | DOC-03 | Firebase Storage signed URL + Firestore repository |
| [x] | DOC-04 | Flutter data layer (models, datasource, repository, l10n erreurs) |
| [x] | DOC-05 | Flutter UI liste + upload (file_picker, PUT, statuts) |
| [x] | DOC-06 | Tests D1 + validation manuelle CP-D1 |

---

## Checkpoint CP-D2 (indexation RAG)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | DOC-07 | Extracteurs PDF / DOCX / txt / md |
| [x] | DOC-08 | Service chunking (pur + tests) |
| [x] | DOC-09 | EmbeddingPort Gemini uniquement (`text-embedding-004` défaut) ; fake en test |
| [x] | DOC-10 | Pipeline ingestion async après complete |
| [ ] | DOC-11 | Chunks Firestore + UI refresh processing/failed |
| [ ] | DOC-12 | Tests D2 + validation manuelle CP-D2 |

---

## Checkpoint CP-D3 (retrieval)

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | DOC-13 | `POST /v1/retrieval/search` top-k |
| [ ] | DOC-14 | Tests retrieval + validation manuelle CP-D3 |

---

## Phase D4 (backlog — pas dans ce sprint)

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | DOC-20 | Chat source-based (consomme retrieval) |
| [ ] | DOC-21 | Quiz depuis corpus |

---

## Vérification globale (chaque tâche)

```bash
cd backend && npm test
cd frontend && flutter analyze && flutter test
```

---

*Ce document a été créé avec Cursor (IA). Todo Documents/RAG — aligné Q1–Q10, 2026-05-26.*
