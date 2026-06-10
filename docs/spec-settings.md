# Lucy — Paramètres (spec)

> **Statut** : Livré (UI telC + profil éditable)  
> **Route** : `/settings` (onglet shell)

---

## 1. Objectif

L’apprenant consulte son **compte**, **édite** son profil d’apprentissage par thèmes, voit la langue UI (lecture seule), et se **déconnecte** (mobile).

## 2. UI (alignement telC)

- Fond `surfaceContainerLowest`, contenu centré `maxWidth: 600`
- Mobile : `AppBar` ; desktop : titre dans le body
- En-tête compte : carte bordée + avatar initiales
- Sections **uppercase** + groupes bordés (`SettingsGroup`)
- Tuiles avec icône colorée + chevron + valeur à droite
- Logout : `LucySecondaryButton` en bas (**mobile uniquement** ; desktop = sidebar)

### Profil par thème (éditable)

| Section | Champs | Édition |
|---------|--------|---------|
| Votre situation | rôle, domaines | sheet / page domaines |
| Objectifs | objectif, niveau | bottom sheet |
| Style Lucy | explication, ton, langue tuteur | bottom sheet |

## 3. API

- `GET /v1/users/me` — compte + `learnerProfile?` + `uiLocale?`
- `PATCH /v1/users/me/learner-profile` — corps snake_case complet

## 4. Architecture Flutter

```
SettingsPage → SettingsNotifier → SettingsService → SettingsRepository
```

---

*Ce document a été créé avec Cursor (IA).*
