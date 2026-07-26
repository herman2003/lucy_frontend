# Lucy — Dialogue pré-génération (Quiz + Cartes)

> **Statut** : **Validée produit** (2026-06-10)  
> **Parent** : [SPEC.md](../SPEC.md) §7.5 · [docs/spec-learning-generation.md](./spec-learning-generation.md) · [docs/spec-chat-rag.md](./spec-chat-rag.md)  
> **Intégré avec** : [spec-learning-composition-prep.md](./spec-learning-composition-prep.md) (**mode professeur** — analyse obligatoire avant génération)  
> **Suivi** : [tasks/todo-learning-professor.md](../tasks/todo-learning-professor.md)

---

## 1. Objectif

### 1.1 Utilisateurs

| Persona | Besoin |
|---------|--------|
| **Apprenant** | Demander un quiz ou des cartes dans le **Chat** sans que Lucy lance la génération LLM **trop tôt** |
| **Apprenant** | **Confirmer** le type (quiz vs cartes), le **sujet** (« sur quoi ? »), le **nombre** d’items, puis un **récap** avant lancement |
| **Apprenant** | Dire « comme tu veux » / « tout le cours » et obtenir des **défauts** prévisibles (5 quiz / 10 cartes, sujet = corpus entier) |
| **Apprenant** | **Annuler** ou **changer d’avis** pendant le dialogue (ex. passer de cartes à quiz) |
| **Apprenant** | Voir un **retour d’attente** pendant la génération LLM (10–30 s) |
| **Apprenant** | Sessions dont le **titre** et le **contenu** reflètent le sujet choisi |
| **Développeur** | État `pendingLearningGeneration` **côté serveur** (multi-appareil) ; pas de logique critique uniquement côté Flutter |

### 1.2 Problème

Aujourd’hui, dès qu’un message matche « quiz » ou « cartes », le backend appelle `LearningSessionsService.generate` **immédiatement** :

- le **nombre** est deviné (1er chiffre du message ou défaut) — confusion quiz (5) vs cartes (10) ;
- le **sujet** n’est pas demandé ni exploité (`topicHint` absent du code) ;
- le **retrieval** utilise une requête fixe, pas l’intention utilisateur ;
- la spec parente (G9, G10) n’est **pas** respectée.

### 1.3 Décisions produit proposées

| # | Sujet | Décision |
|---|--------|----------|
| D1 | **Point d’entrée** | Inchangé : génération **uniquement depuis le Chat** (pas de bouton dans l’onglet Quiz) |
| D2 | **Flux obligatoire** | Machine à états **multi-tours** avant tout appel `generate` |
| D3 | **État serveur** | `users/{uid}/chats/{chatId}.pendingLearningGeneration` (Firestore via Nest) |
| D4 | **Étapes** | `awaiting_confirm` → **`analyzing`** → **`awaiting_focus_selection`** → `awaiting_count` → `awaiting_launch_confirm` → `generate` (voir [mode professeur](./spec-learning-composition-prep.md)) |
| D5 | **Sujet (`topicHint`)** | **Fallback** si analyse échoue ; sinon remplacé par `focusAreas[]` |
| D6 | **Retrieval avec sujet** | Si `topicHint` non vide : requête retrieval = `topicHint` ; sinon requête fixe actuelle (G11 **assoupli** — toujours **tous les docs actifs**, pas de filtre document) |
| D7 | **Prompt LLM** | Injecter `topicHint` dans system/user prompt ; consigne « concentre-toi sur… » si présent |
| D8 | **Titre session** | `Cartes · {topicHint tronqué}` ou `Cartes · {date}` si pas de sujet ; idem quiz |
| D9 | **Défauts nombre** | Quiz **5**, cartes **10** ; plafonds inchangés (15 / 30) |
| D10 | **« Comme tu veux »** | Accepte défaut nombre **et** sujet = tout le corpus |
| D11 | **Annulation** | Mots-clés `annule`, `non`, `stop`, changement de sujet hors learning → **clear** pending, retour chat normal |
| D12 | **Génération en cours** | Message assistant fixe l10n + streaming texte court ; pas de nouveau SSE type dédié |
| D13 | **Boutons rapides** | Phase **LEARN-11** |
| D14 | **Sélection document** | Phase **LEARN-11** (hors G4) |

### 1.4 Machine à états (fusion mode professeur)

Diagramme complet : [spec-learning-composition-prep.md](./spec-learning-composition-prep.md) §1.4.

**Résumé** : pas de `generate` sans `awaiting_launch_confirm` + confirmation. L’étape `awaiting_topic` n’est plus le chemin principal — remplacée par **analyse + choix des parties**.

| Étape | Lucy (ex. FR) |
|-------|----------------|
| `awaiting_confirm` | « Tu veux un **quiz** ou des **cartes** ? » |
| `analyzing` | « Je parcours tes documents… » |
| `awaiting_focus_selection` | Liste numérotée des parties recommandées + choix |
| `awaiting_count` | « Combien de questions / cartes ? » |
| `awaiting_launch_confirm` | Récap + « Je lance ? » |
| `generating` | « Je prépare ton quiz… » |

Langue = `learnerProfile.tutoring_language`.

### 1.5 Hors périmètre (ce lot)

| Exclu | Détail |
|-------|--------|
| Génération depuis l’onglet Quiz | G6b inchangé |
| Choix d’un document PDF précis | Phase ultérieure |
| Chips / boutons rapides dans le chat | D13 |
| Streaming de la génération LLM | G7 inchangé |
| Nombres en toutes lettres (« quinze ») | Phase ultérieure (parser étendu) |
| Regénération « refais pareil » | Phase **LEARN-09** |
| Persistance progression quiz | Inchangé (client optionnel) |

### 1.6 Critères d’acceptation

- [ ] « Fais-moi des cartes » → Lucy **demande confirmation**, **pas** de génération immédiate
- [ ] Après confirmation → Lucy demande le **sujet**, puis le **nombre**
- [ ] Récap affiché → génération **seulement** après validation explicite
- [ ] « Comme tu veux » → 10 cartes ou 5 questions, sujet = corpus entier
- [ ] « 15 cartes sur l’entropie » en un message → récap direct puis confirmation
- [ ] `topicHint` persisté sur la session Firestore
- [ ] Retrieval utilise `topicHint` quand renseigné
- [ ] Titre session inclut le sujet quand pertinent
- [ ] « Annule » à toute étape → pending effacé, chat RAG normal au message suivant
- [ ] Pending **survit** au rechargement app (état sur le fil serveur)
- [ ] Corpus vide / profil incomplet → message Lucy + **pas** de pending bloqué
- [ ] Erreur `LEARNING_GENERATION_FAILED` → pending cleared, message traduit
- [ ] l10n fr / en / de pour toutes les phrases Lucy du flux
- [ ] Tests Nest : machine à états + parsing ; pas de régression LEARN existants

---

## 2. Commandes

### 2.1 Backend

```bash
cd lucy_backend
npm test -- --testPathPattern="chat-learning|learning-session"
npm run start:dev
```

### 2.2 Frontend

```bash
cd lucy_frontend
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
flutter analyze
flutter test test/features/chat/
flutter test test/features/quiz/
```

### 2.3 Vérification manuelle (CP-LEARN-06)

- [ ] Flux complet cartes : confirm → sujet → nombre → récap → carte action chat
- [ ] Flux complet quiz : idem avec plafond 15
- [ ] Annulation milieu de flux
- [ ] Rechargement app pendant `awaiting_count` → Lucy reprend au bon endroit
- [ ] Session générée : contenu plus pertinent quand sujet précis (test manuel même doc)

---

## 3. Structure projet

### 3.1 Backend (`lucy_backend`)

```
src/features/chat/
  domain/
    pending-learning-generation.types.ts    # étapes + payload
  utils/
    chat-learning-generation.ts             # intent, count, topic, yes/no, cancel
    chat-learning-dialogue.ts               # transitions machine à états
    chat-learning-dialogue.spec.ts
  services/
    chat-stream.service.ts                  # orchestration dialogue vs RAG vs generate
  repositories/
    firestore-chats.repository.ts           # patchThread pendingLearningGeneration

src/features/learning-sessions/
  dto/
    generate-learning-session.dto.ts        # + topicHint optionnel
  services/
    learning-sessions.service.ts            # retrieval query + prompt + title
  domain/
    learning-session.types.ts               # topicHint sur session persistée

src/prompts/
  flashcards-generator.system.hbs           # + bloc TOPIC_FOCUS optionnel
  quiz-generator.system.hbs                 # idem
```

**Firestore — fil chat** (extension) :

```
users/{uid}/chats/{chatId}
  …champs existants…
  pendingLearningGeneration?: {
    type: "quiz" | "flashcards"
    step: "awaiting_confirm" | "awaiting_topic" | "awaiting_count" | "awaiting_launch_confirm"
    topicHint?: string | null
    itemCount?: number | null
    updatedAt: string (ISO)
  }
```

**API** : pas de nouvelle route REST — le flux reste `POST /v1/chats/:chatId/messages/stream`.  
`POST /v1/learning-sessions/generate` accepte `topicHint?: string` (max 200 car., trim).

### 3.2 Frontend (`lucy_frontend`)

```
lib/features/chat/
  # Aucun état pending local obligatoire — messages assistant portent le dialogue
  # Optionnel : badge/indicateur si dernier message assistant = question pending

lib/features/quiz/
  domain/entities/learning_session.dart     # + topicHint si exposé API
  data/models/…                             # mapper topicHint
```

Pas de nouvelle page. `ChatLearningSessionCard` inchangée (reçoit toujours `learning_session_created`).

---

## 4. Style de code

| Règle | Détail |
|--------|--------|
| Architecture | Clean Architecture : logique dialogue **Nest** ; Flutter affiche les messages stream |
| l10n | Toutes les phrases Lucy du flux via clés `chatLearning*` (fr / en / de) — **jamais** de texte assistant en dur côté backend sauf templates l10n centralisés ou map par `tutoring_language` |
| Erreurs API | `LearningErrorTranslator` / `ChatErrorTranslator` — codes existants |
| Models | Freezed + `@JsonKey` snake_case si champs API ajoutés |
| Constantes | Plafonds dans `LEARNING_SESSION_ITEM_LIMITS` — pas de magic numbers |
| Prompts | Fichiers `.hbs` ; `topicHint` via Handlebars conditionnel |
| Logs | `pending step=… type=…` en debug ; pas de contenu utilisateur complet en prod |

---

## 5. Stratégie de tests

### 5.1 Backend

| Zone | Tests |
|------|-------|
| `chat-learning-dialogue` | Transitions : confirm, topic, count, launch, cancel, message complet en un tour |
| `parseLearningItemCount` | Entiers valides, hors plafond, absent |
| `parseLearningTopicHint` | Texte libre, « tout le cours », vide |
| `chat-stream.service` | Mock repo : pending persisté ; pas d’appel `generate` avant `awaiting_launch_confirm` + oui |
| `generate-learning-session.dto` | `topicHint` longueur max, trim |
| `learning-sessions.service` | Retrieval query = topicHint quand fourni ; titre avec sujet |
| Régression | `chat-learning-generation.spec.ts`, `learning-sessions.service.spec.ts` |

Cible : **+25 tests** minimum sur ce lot.

### 5.2 Frontend

| Zone | Tests |
|------|-------|
| Mappers | `topicHint` sur session si présent dans JSON |
| `chat_conversation_notifier` | Pas de changement majeur si dialogue = messages assistant standards |
| Widget | `ChatLearningSessionCard` — régression inchangée |

---

## 6. Limites (boundaries)

### 6.1 Toujours faire

- Vérifier **prérequis** (corpus actif, profil) **avant** de créer un `pending` ou de lancer `generate`
- **Effacer** `pendingLearningGeneration` après génération réussie, échec, ou annulation
- Respecter les plafonds `itemCount` (quiz 15, cartes 30)
- Réponses Lucy dans la **langue de tutorat** du profil
- Conserver le comportement **G4b** : reprise sessions existantes inchangée

### 6.2 Demander d’abord

- Modifier **G11** pour filtrer par `documentId` (hors scope actuel)
- Ajouter des **chips** UI dans le chat
- Changer les **défauts** 5/10 ou les plafonds
- Exposer `pendingLearningGeneration` au client Flutter via API dédiée (préférer inférence via messages)

### 6.3 Ne jamais faire

- Génération LLM **sans** étape de confirmation finale (`awaiting_launch_confirm`)
- Stocker le pending **uniquement** en SharedPreferences Flutter
- Afficher `e.message` brut en UI
- Bypass du flux dialogue depuis l’onglet Quiz en MVP
- Filtrer les docs par domaine profil apprenant

---

## 7. Phases d’implémentation

| Phase | Id | Livrable |
|-------|-----|----------|
| **1** | LEARN-06a | Types pending + patch thread Firestore + machine à états + tests unitaires |
| **2** | LEARN-06b | Intégration `chat-stream.service` + messages Lucy l10n + annulation |
| **3** | LEARN-06c | `topicHint` dans DTO, retrieval, prompts, titre session + tests service |
| **4** | LEARN-06d | Checklist CP-LEARN-06 manuelle + doc plan/todo |

**Dépendances** : chat P4a, learning-sessions LEARN-01→05 livrés.

---

*Ce document a été créé avec Cursor (IA).*
