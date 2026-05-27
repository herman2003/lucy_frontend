# CP-R2 — Checklist validation manuelle (stockage Cloudflare R2)

À exécuter pour **R2-06**, avec backend `STORAGE_PROVIDER=r2` et credentials R2 valides (voir [spec-storage-r2.md](./spec-storage-r2.md) §2).

## Prérequis

- [ ] Bucket R2 créé + CORS configuré (`backend/r2.cors.json` ou équivalent dashboard)
- [ ] `backend/.env` : `STORAGE_PROVIDER=r2`, `R2_ACCOUNT_ID`, `R2_ACCESS_KEY_ID`, `R2_SECRET_ACCESS_KEY`, `R2_BUCKET`
- [ ] `FIRESTORE_PROVIDER=firebase` (ou stack dev documentée)
- [ ] Utilisateur authentifié, onboarding terminé
- [ ] `cd backend && npm run start:dev` (ou `start:dev:local`)

## Checklist — Web

| # | Scénario | Attendu | OK |
|---|----------|---------|-----|
| 1 | Boot backend sans credentials R2 alors que `STORAGE_PROVIDER=r2` | Échec au démarrage avec message clair | [ ] |
| 2 | **Documents** → ajouter un PDF ≤ 20 Mo | PUT vers `*.r2.cloudflarestorage.com` **200** (pas d’erreur CORS preflight) | [ ] |
| 3 | Après `complete` | Document passe `processing` puis `ready` ; objet visible dans le dashboard R2 | [ ] |
| 4 | Menu ⋮ → **Télécharger** | URL presignée GET ouvre/télécharge le fichier | [ ] |
| 5 | **Supprimer** un document `ready` | Ligne supprimée ; objet R2 absent (ou orphelin géré par sweeper) | [ ] |
| 6 | Activer recherche sur un doc `ready` | `searchEnabled` OK (Firestore inchangé) | [ ] |

## Checklist — Mobile (iOS / Android)

| # | Scénario | Attendu | OK |
|---|----------|---------|-----|
| 7 | Même scénarios 2–5 sur appareil ou simulateur | Comportement identique au web | [ ] |
| 8 | Upload en arrière-plan / rotation écran | Pas de corruption ; reprise ou erreur l10n propre | [ ] |

## Régression provider Firebase (optionnel)

| # | Scénario | Attendu | OK |
|---|----------|---------|-----|
| 9 | `STORAGE_PROVIDER=firebase` (ou unset) + bucket Blaze | Upload/download inchangés vs avant R2 | [ ] |

## Vérification API (curl)

```bash
# Créer document + récupérer uploadUrl (remplacer $TOKEN)
curl -s -X POST http://localhost:3000/v1/documents \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"title":"Test R2","fileName":"a.pdf","mimeType":"application/pdf","byteSize":1234}'

# PUT binaire vers uploadUrl → POST …/complete → vérifier dashboard R2
```

## Commandes automatisées

```bash
cd backend && npm test
cd frontend && flutter analyze && flutter test test/features/documents/
```

## Clôture R2-06

- [ ] Tous les scénarios web **obligatoires** (1–6) cochés
- [ ] Au moins un parcours mobile (7–8) coché
- [ ] Cocher les critères §8 de [spec-storage-r2.md](./spec-storage-r2.md) si validés
- [ ] Cocher **R2-06** dans [tasks/todo.md](../tasks/todo.md)

---

*Ce document a été créé avec Cursor (IA).*
