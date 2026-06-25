# Todo — Refonte UI post-login (P5)

> **Actif** : P5 — UI redesign V3/V4 · **Plan** : [plan.md](./plan.md) · **Spec** : [docs/spec-ui-redesign.md](../docs/spec-ui-redesign.md)

**Légende** : `[ ]` à faire · `[x]` fait

**Archives** : [todo-learn.md](./todo-learn.md) (LEARN terminé)

---

## Checkpoint CP-UI-1 — Identité visuelle (tokens + thème)

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | UI-01a | Tokens couleurs + `lucy_spacing.dart` |
| [x] | UI-01b | `google_fonts` + `lucy_typography.dart` |
| [x] | UI-01c | `LucyInterfaceStyle` + storage SharedPreferences |
| [x] | UI-01d | `LucyThemeExtensions` + `LucyFlexTheme.themeFor()` |
| [x] | UI-01e | `lucyThemeProvider` + bootstrap `main.dart` / `app.dart` |
| [x] | UI-01f | l10n styles (fr/en/de) + tests provider |

---

## Checkpoint CP-UI-2 — Shell hybride

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | UI-02a | `LucyDesktopSidebar` + `LucyBrandMark` |
| [x] | UI-02b | `LucyBottomNav` custom V4 (emojis) + tests |
| [x] | UI-02c | Refactor `LucyAppShell` ; router tests verts |

---

## Checkpoint CP-UI-3 — Documents

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | UI-03a | `LucyDocumentCard`, `LucyChip`, `LucyEmptyState` |
| [x] | UI-03b | `DocumentsPage` restyle grille/liste |

---

## Checkpoint CP-UI-4 — Chat

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | UI-04a | `LucyMessageBubble`, `LucySourceCard`, `LucyComposer` |
| [x] | UI-04b | `LucyChatThreadsPanel` desktop 300 px |
| [x] | UI-04c | `LucyConversationsDrawer` mobile |
| [x] | UI-04d | `ChatPage` intégration + tests chat |

---

## Checkpoint CP-UI-5 — Quiz & learning

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | UI-05a | Hub cards + `LearningSessionPage` QCM restyle |
| [ ] | UI-05b | Flashcards session + `ChatLearningSessionCard` |

---

## Checkpoint CP-UI-6 — Settings & profil

| Statut | Id | Tâche |
|--------|-----|--------|
| [ ] | UI-06a | Segmented clair/sombre + picker 3 styles |
| [ ] | UI-06b | Settings hub + sous-pages profil / AI / mot de passe |

---

## Prérequis — terminé

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | LEARN-01→05 | Génération quiz + cartes |
| [x] | CHAT-01→10 | Chat P4a |
| [x] | DOC-01→14 | Documents + RAG |
| [x] | QUIZ-01 | Eligibility |

---

*Ce document a été créé avec Cursor (IA). Révisé — UI redesign — 2026-06-10.*
