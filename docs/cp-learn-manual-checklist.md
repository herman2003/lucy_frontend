# Checklist CP-LEARN — vérification manuelle

> Reprend la section **2.3** de [spec-learning-generation.md](./spec-learning-generation.md).  
> Cocher chaque point après validation en environnement de test (backend + app Flutter).

## Prérequis

- [ ] Backend `lucy_backend` démarré (`npm run start:dev` ou stack dev)
- [ ] App Flutter pointée vers l’API locale
- [ ] Compte avec onboarding terminé et au moins un document **ready** + actif pour les scénarios de génération

## Checklist fonctionnelle

- [ ] **Corpus vide** : aucun doc actif → le chat **n’initie pas** la génération ; onglet Quiz : bannière + empty state « demandez à Lucy » ; **historique jouable** si des sessions existent déjà (G4b)
- [ ] **G4b reprise** : désactiver un doc ou un domaine **après** génération → reprise `/quiz/session/:id` **toujours OK**
- [ ] **Profil incomplet** → erreur traduite (chat + API)
- [ ] **Chat quiz** : « fais-moi un quiz » → session créée + carte action → ouvrir QCM
- [ ] **Chat cartes** : « des cartes mémoire » → session flashcards + carte action → flip recto/verso
- [ ] **Bibliothèque Quiz** : liste sessions + reprise — **sans** bouton générer
- [ ] **Persistance** : quitter et rouvrir l’app → historique OK
- [ ] **Suppression** : glisser une session dans l’historique → confirmer → session retirée de la liste

## Commandes de non-régression

```bash
cd lucy_backend && npm test -- learning-sessions
cd lucy_backend && npm test -- quiz-eligibility
cd lucy_frontend && flutter analyze
cd lucy_frontend && flutter test test/features/quiz/
cd lucy_frontend && flutter test test/features/chat/presentation/chat_conversation_notifier_test.dart
```

---

*Ce document a été créé avec Cursor (IA).*
