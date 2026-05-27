# Checklist manuelle — Chat P4a (CP-CHAT-3)

Validation humaine après CHAT-08 → CHAT-10. Backend : `npm test -- chat` au vert.

## Prérequis

- [ ] Backend local (`npm run start:dev:local`) + Firebase auth dev
- [ ] Au moins un document **prêt** avec recherche activée pour les scénarios « chat actif »
- [ ] Compte avec onboarding terminé (`learnerProfile` présent)

## CP-CHAT-1 (API)

- [ ] `GET /v1/chats` — liste des fils
- [ ] `POST /v1/chats` — création fil
- [ ] `POST /v1/chats/:id/messages/stream` — SSE `text_delta` → `sources` → `done`
- [ ] `GET /v1/chats/eligibility` — `canChat` cohérent avec documents actifs

## CP-CHAT-2 (Flutter stream + UI)

- [ ] Onglet Chat : liste des fils + conversation
- [ ] Envoi message : bulles user/Lucy, indicateur de frappe, stream visible
- [ ] Cartes **Sources** sous la réponse (titre, pages, extrait)
- [ ] Erreurs : snackbar l10n (jamais message brut backend)

## CP-CHAT-3 (miroir + garde corpus)

### Miroir local

- [ ] Ouvrir Chat hors ligne (après sync) : fils/messages du cache visibles
- [ ] Bannière `chatOfflineBanner` ; envoi désactivé
- [ ] Reconnexion : resync fils + messages à l’ouverture
- [ ] **Logout** : rouvrir l’app / autre compte — pas de fuite de fils du compte précédent

### Garde corpus (`!canChat`)

- [ ] Désactiver tous les documents (recherche off ou aucun doc prêt)
- [ ] Bannière « Aucun document actif » + CTA **Aller aux documents**
- [ ] Composer désactivé ; pas de nouveau stream
- [ ] CTA ouvre l’onglet Documents

### Orientation quiz (manuel)

- [ ] Dans un fil actif, demander : « Génère un quiz sur mon cours »
- [ ] Lucy oriente vers l’onglet Quiz (pas de QCM généré dans le chat)

## Régression rapide

```bash
cd frontend && flutter test test/features/chat/
cd backend && npm test -- chat
```

---

*Ce document a été créé avec Cursor (IA).*
