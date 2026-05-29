# CP-D1 — Checklist validation manuelle (Documents upload + liste)

À exécuter après **DOC-06**, avec backend (`FIRESTORE_PROVIDER=firebase` ou `memory` + Storage configuré) et app Flutter sur **web** et **mobile**.

## Prérequis

- Utilisateur authentifié, onboarding `isConfigured: true`
- CORS Storage configuré pour l’origine web (voir `backend/README.md`)
- Bucket Firebase Storage accessible

## Checklist

| # | Scénario | Attendu | Web | Mobile |
|---|----------|---------|-----|--------|
| 1 | Ouvrir l’onglet **Documents** | Liste (vide ou existante), FAB **Ajouter** | [ ] | [ ] |
| 2 | **Ajouter** → choisir un `.pdf` / `.docx` / `.txt` / `.md` ≤ 20 Mo | Upload démarre ; pas de 2e upload simultané (FAB désactivé) | [ ] | [ ] |
| 3 | Après upload | Document en liste ; bandeau traitement si `processing` | [ ] | [ ] |
| 4 | **Télécharger** (menu ⋮) | Ouverture URL signée / téléchargement fichier | [ ] | [ ] |
| 5 | Activer la recherche sur **5** documents `ready` | OK pour les 5 | [ ] | [ ] |
| 6 | Activer un **6e** | Snackbar erreur l10n (limite 5) | [ ] | [ ] |
| 7 | **Supprimer** un document `ready` ou `failed` | Disparaît de la liste | [ ] | [ ] |
| 8 | **Supprimer** pendant `processing` | Refus + snackbar l10n | [ ] | [ ] |
| 9 | Type interdit (ex. `.exe`) | Refus côté client ou API + message l10n | [ ] | [ ] |

## Commandes automatisées (régression)

```bash
cd backend && npm test
cd lucy_frontend && flutter analyze && flutter test
```

---

*Ce document a été créé avec Cursor (IA).*
