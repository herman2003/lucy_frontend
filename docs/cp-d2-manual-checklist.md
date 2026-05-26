# CP-D2 — Checklist validation manuelle (indexation RAG)

À exécuter après **DOC-12**, avec backend en mode Firebase (`FIRESTORE_PROVIDER=firebase`, `GEMINI_API_KEY` configurée) et app Flutter.

## Prérequis

- CP-D1 validé (upload + liste OK)
- Ingestion async active (`POST …/complete` déclenche le pipeline)
- Index vectoriel Firestore sur `chunks.embedding` (dimension **768**, voir `backend/README.md`)

## Checklist

| # | Scénario | Attendu | Web | Mobile |
|---|----------|---------|-----|--------|
| 1 | Upload un `.txt` avec **2 paragraphes** distincts | Statut passe par `processing` puis **`ready`** | [ ] | [ ] |
| 2 | Console Firestore `users/{uid}/documents/{docId}` | `chunkCount` **> 0**, `status: ready` | [ ] | — |
| 3 | Sous-collection **`chunks`** | Au moins 1 doc avec `text`, `ordinal`, `embedding` (768 dims) | [ ] | — |
| 4 | Upload un **PDF 2 pages** (texte extractible) | `ready`, `chunkCount > 0`, éventuellement `pageStart` / `pageEnd` sur chunks | [ ] | [ ] |
| 5 | Forcer un **MIME incohérent** (fichier texte renommé `.pdf`) | `failed`, snackbar l10n, bouton **Réessayer** ou supprimer | [ ] | [ ] |
| 6 | Document **`failed`** → **Réessayer** (reprocess) | Repasse en `processing` puis `ready` si fichier Storage intact | [ ] | [ ] |
| 7 | Pendant **`processing`** | Poll liste ~3 s, bandeau « traitement en cours » | [ ] | [ ] |

## Commandes automatisées (régression D2)

```bash
cd backend && npm test -- document-ingestion documents.d2-flow
cd frontend && flutter test test/features/documents/
```

---

*Ce document a été créé avec Cursor (IA).*
