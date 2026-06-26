# Todo — Rappels & historique quiz (LEARN-12)

> **Spec** : [spec-learning-reminders-history.md](../docs/spec-learning-reminders-history.md)  
> **Parent** : LEARN-01→11 livré

**Légende** : `[ ]` à faire · `[x]` fait

---

## LEARN-12b — Historique quiz

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | LEARN-12b-1 | Entité `QuizAttempt` + datasource SharedPreferences |
| [x] | LEARN-12b-2 | `QuizAttemptService` + enregistrement à la fin de session |
| [x] | LEARN-12b-3 | Dernier score sur tuile bibliothèque quiz |
| [x] | LEARN-12b-4 | Tests service + notifier + widget bibliothèque |
| [x] | LEARN-12b-V2 | API Nest POST/GET attempts + sync Firestore |

---

## LEARN-12a — Rappels

| Statut | Id | Tâche |
|--------|-----|--------|
| [x] | LEARN-12a-1 | `LearningReminderService` (SM-2 dues + dernier quiz) |
| [x] | LEARN-12a-2 | Bandeau in-app Quiz (et optionnel Chat) |
| [x] | LEARN-12a-3 | Page Paramètres rappels (opt-in + créneau) |
| [x] | LEARN-12a-4 | Notifications locales `flutter_local_notifications` |
| [x] | LEARN-12a-V2 | FCM + rappels calendrier J-N serveur |

---

## Checklist manuelle (post-MVP)

- [ ] Finir un quiz → score visible dans la bibliothèque après kill app
- [ ] Rejouer → deux entrées historique ; dernier score affiché
- [ ] Opt-in rappels → 1 notif au créneau si cartes dues
- [ ] Opt-out → plus de notif ; bandeau in-app seulement si pertinent

---

*Ce document a été créé avec Cursor (IA).*
