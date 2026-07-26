# Checklist CP-LEARN-06 — dialogue quiz/cartes (mode professeur)

> Reprend la section **2.3** de [spec-learning-generation-dialogue.md](./spec-learning-generation-dialogue.md) et le flux unifié de [spec-learning-composition-prep.md](./spec-learning-composition-prep.md).  
> Cocher chaque point après validation en environnement de test (backend + app Flutter).

## Prérequis

- [ ] Backend `lucy_backend` démarré (`npm run start:dev` ou stack dev)
- [ ] App Flutter pointée vers l’API locale
- [ ] Compte avec onboarding terminé (`learnerProfile` présent)
- [ ] Au moins un document **ready** + **searchEnabled** pour les scénarios de génération

## Flux mode professeur — cartes

- [ ] « Fais-moi des cartes mémoire » → Lucy **demande confirmation** (pas de génération immédiate)
- [ ] « Oui » → message **« Je parcours tes documents… »** visible **pendant** l’analyse (stream SSE)
- [ ] Liste numérotée des parties recommandées → sélection (ex. **1** ou **tout**)
- [ ] Lucy demande le **nombre** → récap → confirmation **oui**
- [ ] Carte action **Cartes prêtes** → ouverture session flashcards
- [ ] « Comme tu veux » au nombre → **10** cartes par défaut

## Flux mode professeur — quiz

- [ ] « Fais-moi un quiz » → confirmation → analyse → sélection → nombre → récap → génération
- [ ] Plafond quiz respecté (max **15** questions)
- [ ] Message **« Je prépare ton quiz… »** visible pendant la génération (stream SSE)
- [ ] Carte action **Quiz prêt** → ouverture QCM

## Garde-fous et reprise

- [ ] **Annulation** (« annule ») à toute étape → pending effacé, chat RAG normal au message suivant
- [ ] **Rechargement app** pendant `awaiting_count` ou `awaiting_focus_selection` → Lucy reprend au bon endroit (état sur le fil serveur)
- [ ] **Corpus vide** → pas de pending bloqué ; message d’erreur traduit
- [ ] **Profil incomplet** → erreur traduite, pas de génération
- [ ] **Échec génération** (`LEARNING_GENERATION_FAILED`) → pending cleared, message actionnable

## Qualité pédagogique (manuel)

- [ ] Sélection **1 et 2** → contenu plus ciblé que génération sans sélection (même document)
- [ ] Fonctionne **sans** mot « examen » dans le message utilisateur

## Commandes de non-régression

```bash
cd lucy_backend && npm test -- --testPathPattern="chat-learning|chat-stream|learning-session"
cd lucy_frontend && flutter gen-l10n
cd lucy_frontend && flutter analyze
cd lucy_frontend && flutter test test/features/chat/
cd lucy_frontend && flutter test test/features/quiz/
```

---

*Ce document a été créé avec Cursor (IA).*
