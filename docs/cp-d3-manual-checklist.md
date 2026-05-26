# CP-D3 — Checklist validation manuelle (retrieval RAG)

À exécuter après **DOC-14**, avec backend en mode dev (`Bearer dev:<uid>`) ou Firebase, et au moins un document **`ready`** avec **`searchEnabled: true`** (CP-D2 validé).

## Prérequis

- Document indexé (`chunkCount > 0`) et **activé pour la recherche** (max 5 actifs — CP-D1)
- `GEMINI_API_KEY` configurée si embeddings runtime non mockés
- Index vectoriel Firestore sur `chunks.embedding` (dimension **768**) en environnement Firebase

## Checklist

| # | Scénario | Attendu | OK |
|---|----------|---------|-----|
| 1 | `POST /v1/retrieval/search` avec `{ "query": "…" }` et token utilisateur | **200**, tableau de hits avec `documentId`, `title`, `chunkId`, `text`, `score`, `contextHeader` | [ ] |
| 2 | Même requête sur un doc **`ready`** mais **`searchEnabled: false`** | Ce document **n’apparaît pas** dans les résultats | [ ] |
| 3 | `documentIds: ["<id>"]` sur un sous-ensemble de docs actifs | Seuls les chunks de ce doc (s’il est actif + ready) | [ ] |
| 4 | Chunk PDF avec `pageStart` / `pageEnd` | `contextHeader` contient `Document: …`, `Pages: …`, puis le texte du chunk | [ ] |
| 5 | Query vide ou body invalide | **400** `VALIDATION_ERROR` | [ ] |

## Exemple curl (stack dev local)

```bash
export UID="votre-uid-dev"
export DOC_ID="id-document-actif-ready"

curl -s -X POST "http://localhost:3000/v1/retrieval/search" \
  -H "Authorization: Bearer dev:${UID}" \
  -H "Content-Type: application/json" \
  -d "{\"query\":\"chlorophylle photosynthèse\",\"limit\":5}" | jq .

curl -s -X POST "http://localhost:3000/v1/retrieval/search" \
  -H "Authorization: Bearer dev:${UID}" \
  -H "Content-Type: application/json" \
  -d "{\"query\":\"chlorophylle\",\"documentIds\":[\"${DOC_ID}\"],\"limit\":3}" | jq .
```

## Commandes automatisées (régression D3)

```bash
cd backend && npm test -- retrieval
```

---

*Ce document a été créé avec Cursor (IA).*
