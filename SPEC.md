# Lucy — Spécification (Phase 1 : Authentification)

> Document validé pour implémentation (revue adversariale intégrée le 2026-05-25). Backend : **Firebase Auth + Firestore profil**. UI : design Lucy + layouts **web / mobile** (AfroSchool).

## Résumé exécutif

**Lucy** est une application de tutorat IA personnalisé. La **phase 1** couvre l’**authentification** Firebase **email + mot de passe** (+ reset email), avec **Clean Architecture** (DTO/mapper/entity), **shared widgets** et thème **`flex_color_scheme`** (pattern AfroSchool).

| Écran | Route | Firebase / UX |
|-------|--------|----------------|
| Connexion | `/login` | `signInWithEmailAndPassword` |
| Création de compte | `/signup` | `createUserWithEmailAndPassword` + `displayName` → **session auto** |
| Mot de passe oublié | `/reset-password` | `sendPasswordResetEmail` + écran « vérifiez votre email » (design) |

**Références :**

- **Architecture** : [`afroschool_admin_web`](file:///Users/espoirhermanfokokom/develop/project/afroschool_admin_web) (structure `lib/`, flux UI → Notifier → Service → Repository).
- **Design** : [`Design Authentication Flow Screens`](file:///Users/espoirhermanfokokom/Downloads/Design%20Authentication%20Flow%20Screens).

**Stack auth phase 1 :** `firebase_core`, `firebase_auth`, `cloud_firestore` — **email + mot de passe uniquement**.  
**Exclu du frontend :** Google Sign-In, Apple Sign-In (aucun package OAuth, aucun bouton, aucune section « or continue with » dans le design).  
**Pas de API REST custom** pour login/register/reset en phase 1.

---

## Décisions validées (2026-05-25)

| # | Sujet | Décision |
|---|--------|----------|
| Q1 | Backend | **Firebase Authentication** (+ config projet Firebase, voir § « Ce dont j’ai besoin ») |
| Q2 | Après inscription | **Oui** — connexion automatique (comportement natif Firebase après `createUser`) |
| Q3 | Login | **Email + mot de passe** uniquement |
| Q4 | Reset password | **Flux Firebase** : `sendPasswordResetEmail` ; lien email géré par Firebase (page hébergée ou deep link selon config console) |
| Q5 | OAuth Google / Apple | **Hors scope frontend** — ne pas implémenter, ne pas masquer : **supprimer** du code et de l’UI |
| Q6 | Plateformes | **Web + Android + iOS** (login email/password) ; **pas de macOS desktop** en phase 1 auth |
| Q11 | Profil Firestore | **Oui — option B** : document `users/{uid}` obligatoire (`fullName`, `email`, `createdAt`) ; échec Firestore = signup **échoue** (pas de session `/home`) |
| Q12 | Vérification email | **Non** en phase 1 — Firebase Auth suffit ; pas de garde `emailVerified` |
| Q13 | Reset anti-énumération | **Oui** — protection Firebase activée + UI succès systématique + pas de fuite `user-not-found` en reset |
| Q14 | Bootstrap routing | **Oui** — écran splash / attente du 1er `authStateChanges` avant redirect (évite flash login) |
| Q15 | Environnements Firebase | **OK** — 1 projet `lucy-7504c` (dev = prod) au départ |
| Q7 | Langues | **Français, anglais, allemand** (`app_fr.arb`, `app_en.arb`, `app_de.arb`) |
| Q8 | Post-login | **Oui** — redirection vers `/home` (placeholder phase 2) |
| Q9 | Data DTO / mapper / entity | **DTO + mapper obligatoires** en `data/` quand pertinent ; **entity domain** minimale — pas de champs redondants ni types Firebase/JSON en domain |
| Q10 | UI partagée & thème | Pattern AfroSchool ; **`primary` / `secondary` / `tertiary`** via `flex_color_scheme` ; **toute couleur UI → `colorScheme`**, hex **uniquement** dans `lucy_colors.dart` |

---

## Ce dont j’ai besoin de ta part (Firebase)

Pour brancher le frontend sans blocage, prépare **un projet Firebase** (Console : [https://console.firebase.google.com](https://console.firebase.google.com)) et fournis / configure les éléments suivants.

### A. Projet & applications enregistrées

Créer le projet **Lucy** (ou nom choisi) et ajouter **4 apps** dans Firebase (même projet) :

| Plateforme | Bundle ID / package suggéré | Fichier config à générer |
|------------|-----------------------------|---------------------------|
| **Web** | — | Config JS (voir FlutterFire) |
| **Android** | ex. `com.lucy.app` (à confirmer) | `google-services.json` |
| **iOS** | ex. `com.lucy.app` | `GoogleService-Info.plist` |
| **macOS** (si build desktop) | même bundle que iOS | idem plist |

**À me communiquer ou à placer dans le repo :**

1. Exécution locale (recommandé) :  
   `dart pub global activate flutterfire_cli` puis, dans `frontend/` :  
   `flutterfire configure`  
   → génère `lib/firebase_options.dart` (ne pas committer de secrets hors repo privé si politique stricte).
2. Ou export manuel des valeurs `apiKey`, `appId`, `messagingSenderId`, `projectId`, `authDomain`, etc. pour chaque plateforme.

### B. Firebase Authentication — méthodes activées

Dans **Authentication → Sign-in method** :

- [x] **Email/Password** uniquement (phase 1)
- [ ] **Google** — désactivé (hors frontend phase 1)
- [ ] **Apple** — désactivé (hors frontend phase 1)

**Email enumeration protection** : **activée** (§ Q13).

### C. Firestore — profil utilisateur (obligatoire phase 1)

| Champ | Source signup | Stockage |
|-------|---------------|----------|
| `fullName` | formulaire | `users/{uid}.fullName` + `User.displayName` (Firebase Auth) |
| `email` | formulaire | `users/{uid}.email` |
| `password` | formulaire | **Firebase Auth uniquement** — **jamais** en clair dans Firestore |
| `createdAt` | serveur/client | `users/{uid}.createdAt` (ISO 8601) |

**Règle signup (option B) :**

1. `createUserWithEmailAndPassword`
2. `updateDisplayName(fullName)`
3. **Écriture Firestore** `users/{uid}` — **si échec → rollback** (`deleteUser` si compte vient d’être créé) + erreur l10n ; **pas** de navigation `/home`
4. Si tout OK → session active → `/home`

**Sécurité :** règles Firestore à définir (lecture/écriture `users/{uid}` uniquement pour `request.auth.uid == uid`).

### D. Réinitialisation mot de passe (Firebase)

Dans **Authentication → Templates** (email de reset) et **Authorized domains** :

- [ ] Domaines autorisés : `localhost`, domaine de prod web Lucy
- [ ] **Action URL** / lien de reset : URL de ton app web (ex. `https://app.lucy.example/reset-password` ou page Firebase par défaut)

Pour **mobile** : configurer **Dynamic Links** ou **App Links** / **Universal Links** si tu veux rouvrir l’app depuis l’email (sinon l’utilisateur change le MDP via le navigateur — acceptable en phase 1).

**Pas d’écran custom « nouveau mot de passe avec token »** en phase 1 : Firebase gère le lien dans l’email (comme demandé).

### E. OAuth — hors périmètre phase 1

Pas de configuration Google/Apple côté frontend. Section design « or continue with » **absente** des écrans (pas seulement masquée).

### F. Environnements

- **1 projet Firebase** `lucy-7504c` (dev = prod au départ) — **validé** (Q15).

### G. Comptes de test

- [ ] 1–2 comptes email de test dans Authentication → Users (pour QA)

### H. Ce que tu n’as pas besoin de fournir pour démarrer l’auth

- Backend NestJS / API REST dédiée auth
- `Dio` + refresh token custom pour la phase 1 (Firebase gère les tokens ; `getIdToken()` pour les futurs appels API IA)

---

## 1. Objectif

### 1.1 Vision produit

1. **Créer un compte** (nom complet, email, mot de passe) → profil Firestore + **connecté automatiquement** si tout réussit.
2. **Se connecter** (email + mot de passe uniquement).
3. **Réinitialiser le mot de passe** via email Firebase, avec UX « Check your email » (anti-énumération).

### 1.2 Utilisateurs cibles

Apprenants / professionnels utilisant un **tuteur IA** sur documents personnels.

### 1.3 Hors périmètre phase 1

- **Google / Apple Sign-In** (code, dépendances, UI, config frontend).
- Module IA (chat, upload, RAG).
- API métier Lucy avec intercepteur Dio (sauf préparation `getIdToken()` pour phase 2).
- WebSocket, notifications push (Firebase Messaging possible plus tard, comme AfroSchool).
- RBAC école, matricule AfroSchool.
- **macOS** build cible auth (web + Android + iOS seulement).
- Vérification email obligatoire (`emailVerified`) avant `/home`.

### 1.4 Critères d’acceptation globaux

- [ ] 3 écrans conformes au design (l10n **fr / en / de**) ; **aucun** élément Google/Apple (section social absente).
- [ ] Flux **UI → Notifier → Service → Repository** ; data avec **mapper** ; domain **sans** types Firebase.
- [ ] UI auth : **shared widgets** + couleurs **100 % `colorScheme`** (0 hex hors `lucy_colors.dart`).
- [ ] Erreurs `FirebaseAuthException` → `auth_error_translator` → clés l10n (jamais message brut Firebase en UI).
- [ ] Session : écoute `authStateChanges` ; guard GoRouter ; **splash** au 1er lancement ; logout `signOut()` uniquement (pas de `GoogleSignIn`).
- [ ] Layouts **web** et **mobile** (pattern AfroSchool).
- [ ] Après login/signup **réussis** (Auth + Firestore profil OK) : **`/home`** placeholder.
- [ ] `dart run build_runner build` après Freezed / Riverpod.

---

## 2. Fonctionnalités détaillées

### 2.1 Login (`/login`)

**Design :** email, password (toggle), Forgot Password, Log In, lien Sign Up.  
**Phase 1 :** **supprimer** du layout la section « or continue with » et les boutons Google/Apple (pas dans le repo).

**Implémentation :**

| Action | Couche | Firebase |
|--------|--------|----------|
| Email login | `AuthService.loginWithEmail` | `signInWithEmailAndPassword` |

**AC :** loading, erreurs l10n, redirect si déjà connecté, navigation signup / reset.

### 2.2 Sign up (`/signup`)

**Champs :** `fullName`, `email`, `password` (tous obligatoires).

**Implémentation (transactionnelle — Q11 option B) :**

1. `createUserWithEmailAndPassword(email, password)`
2. `updateDisplayName(fullName)`
3. `set` Firestore `users/{uid}` : `{ fullName, email, createdAt }`
4. Si 3 OK → utilisateur authentifié → redirect `/home`
5. Si 3 échoue après 1 → `deleteUser()` + erreur l10n (pas de `/home`)

**AC :** validation locale ; double-submit désactivé ; erreurs Firebase/Firestore mappées l10n.

### 2.3 Reset password (`/reset-password`)

**Implémentation Firebase :**

- `sendPasswordResetEmail(email, actionCodeSettings?)` depuis le repository
- UI : état succès « Check your email » (design), **sans** page custom de saisie du nouveau MDP en phase 1

**AC :** formulaire + succès **systématique** (même si email inconnu — Q13) + try again + back to login ; pas de message distinct « utilisateur introuvable » en reset.

### 2.4 Session & sécurité

- **Source de vérité :** `FirebaseAuth.instance.authStateChanges()`
- **Persistance :** gérée par Firebase (pas de refresh token manuel type AfroSchool/Dio)
- **Stockage local optionnel :** cache `uid` / préférences via `flutter_secure_storage` ou `shared_preferences` si besoin UI (pas obligatoire pour auth Firebase)
- **Logout :** `FirebaseAuth.instance.signOut()` uniquement
- **Bootstrap :** route `/` ou splash jusqu’au 1er événement `authStateChanges` ; `GoRouter` `refreshListenable` sur ce stream (Q14)
- **Futur API IA :** `currentUser?.getIdToken()` dans un intercepteur Dio (phase 2)

### 2.5 Localisation (fr, en, de)

- Fichiers ARB : `app_fr.arb`, `app_en.arb`, `app_de.arb`
- `MaterialApp` : `supportedLocales: [fr, en, de]`, `localizationsDelegates`
- Mapper codes Firebase (`user-not-found`, `wrong-password`, `email-already-in-use`, `weak-password`, `invalid-email`, `network-request-failed`, etc.) vers clés `auth.*`

---

## 3. Couche data — DTO, mapper, entity (règle obligatoire)

Alignement **strict** sur AfroSchool (`features/*/data/dtos/`, `data/mappers/`, `domain/entities/`).

### 3.1 Principes

| Couche | Contenu | Interdit |
|--------|---------|----------|
| **data/dtos/** | Modèles **Freezed** liés à la source (JSON API, document Firestore, enveloppe Firebase si sérialisée) | Logique métier |
| **data/mappers/** | Extensions / classes `XxxDto.toEntity()` ou `FirebaseUser → AuthUser` | Import `presentation/` |
| **domain/entities/** | Entités **pures** (champs métier uniquement) | `firebase_auth`, `@JsonSerializable`, `@JsonKey`, types SDK |
| **domain/repositories/** | Contrats abstraits | Implémentation |

**Règle de simplification :** si un champ de l’entity ne sert à rien côté métier (doublon du DTO sans usage service/UI), **ne pas le mettre dans l’entity** — le garder dans le DTO ou le supprimer des deux après revue.

### 3.2 Auth (Firebase) — application concrète

```
features/auth/data/
├── datasources/
│   └── firebase_auth_datasource.dart    # seul endroit : FirebaseAuth / User SDK
├── dtos/                              # si besoin doc Firestore users/{uid} plus tard
│   └── user_profile_dto.dart          # Firestore users/{uid} (Freezed)
├── mappers/
│   ├── auth_user_mapper.dart          # User (SDK) → AuthUser
│   └── user_profile_mapper.dart       # DTO Firestore ↔ Map write
└── repositories/
    └── auth_repository_impl.dart      # appelle datasource + mapper → entity
```

- **Phase 1** : mapper Auth SDK obligatoire ; **DTO + mapper Firestore** obligatoires pour le profil `users/{uid}`.
- **Repository impl** ne retourne **jamais** `User` Firebase au service.
- **Entity** `AuthUser` : `uid`, `email`, `displayName?` — rien de plus sauf besoin prouvé.

Référence mapper : `afroschool_admin_web/lib/features/users/data/mappers/user_dto_mapper.dart`.

---

## 4. Thème — `flex_color_scheme` + **ColorScheme uniquement**

Même stack que AfroSchool : **`flex_color_scheme`** + thème custom Lucy.

### 4.0 Règle absolue — **jamais de couleur en dur dans le projet**

| Zone | Couleurs autorisées |
|------|---------------------|
| **`lib/core/theme/lucy_colors.dart`** | **Seul fichier** avec des `Color(0xFF…)` / hex — définit les **seeds** passés à `FlexThemeData` |
| **`lib/core/theme/lucy_*_theme.dart`** | Construisent `ThemeData` / `InputDecorationTheme` / boutons à partir de **`LucyColors`** + `ColorScheme` généré |
| **`features/`, `shared/`, `app.dart`** | **Uniquement** `Theme.of(context).colorScheme.*` (et dérivés : `.primary`, `.secondary`, `.tertiary`, `.onSurface`, `.error`, etc.) |

**Interdit partout ailleurs** (y compris `shared/widgets/`) :

- `Color(0xFF11223f)`, `const Color(...)`, `Colors.blue`, `Colors.white` (sauf si équivalent existe : `colorScheme.surface`, `colorScheme.onPrimary`)
- Accès direct `LucyColors.primary` dans un widget — utiliser `context.colorScheme.primary` (extension optionnelle sur `BuildContext`)
- `decoration: BoxDecoration(color: Color(...))` sans `colorScheme`

**Gradient bouton primaire :** stops = `colorScheme.primary` + `colorScheme.secondary` (pas de hex dans le widget).

**Vérification CI / revue :**

```bash
rg "Color\(0x|Colors\.(?!transparent)" lib/features lib/shared lib/app.dart
# → doit retourner 0 ligne
rg "LucyColors\." lib/features lib/shared
# → doit retourner 0 ligne (réservé à core/theme/)
```

### 4.1 Structure `lib/core/theme/` (cible)

```
lib/core/theme/
├── lucy_flex_theme.dart              # MaterialApp theme / darkTheme (comme AFFlexTheme)
└── lucy_custom_theme/
    ├── lucy_colors.dart              # seeds + gradients design Lucy (seules defs hex ici)
    ├── lucy_button_theme.dart
    ├── lucy_text_field_theme.dart
    ├── lucy_form_theme.dart
    └── lucy_snackbar_theme.dart      # si snackbars auth
```

### 4.2 Palette **primary / secondary / tertiary** (harmonie obligatoire)

Les couleurs Lucy ne sont pas des hex isolés : elles forment un **triplet cohérent** passé à **`FlexThemeData`** comme `primary`, `secondary`, `tertiary` (même principe qu’AfroSchool : `primary: AFColors.primary`, `secondary: …LightSeed`, `tertiary: …LightSeed`).

**Règle :** choisir les trois teintes **ensemble** (même famille / contraste lisible) ; `LucyFlexTheme` les injecte dans **`ColorScheme`** ; **tout le reste du code** lit **uniquement** `Theme.of(context).colorScheme` (jamais les hex de `LucyColors` directement).

#### Graines `ColorScheme` (thème clair — référence design auth)

| Rôle Flex / M3 | Constante `LucyColors` | Hex | Rôle UI Lucy |
|----------------|------------------------|-----|----------------|
| **primary** | `primary` | `#1e3d6f` | Bouton principal (gradient), focus ring, liens forts |
| **secondary** | `colorSchemeSecondaryLightSeed` | `#2e5b9e` | Bouton secondaire (outline), accents bleus secondaires |
| **tertiary** | `colorSchemeTertiaryLightSeed` | `#5a6c7d` | Bouton tertiaire (texte), sous-titres, labels secondaires |
| **error** | `error` | `#d4183d` | Erreurs formulaire (design destructive) |

Variantes **dark** (si dark mode) : `colorSchemeSecondaryDarkSeed`, `colorSchemeTertiaryDarkSeed` — dérivées de la même harmonie (éclaircies, pas des couleurs hors palette).

#### Tokens sémantiques complémentaires (hors triplet, toujours dans `LucyColors`)

| Token | Hex | Usage |
|--------|-----|--------|
| `lucyNavy` | `#11223f` | Titres (proche tertiary/primary — texte, pas seed Flex) |
| `lucyInputBg` | `#f0f4f8` | Fond champs (`inputDecorationTheme`) |
| `lucyBorder` | `#d1dce6` | Bordures champs |
| `primaryGradient` | `#1e3d6f` → `#2e5b9e` | `LucyPrimaryButton` uniquement (primary → secondary du triplet) |
| `onPrimary` / `onSecondary` / `onTertiary` | blanc / blanc / `lucyNavy` | Contraste texte sur boutons |

#### Passage dans `LucyFlexTheme` (obligatoire)

```dart
FlexThemeData.light(
  primary: LucyColors.primary,
  secondary: LucyColors.colorSchemeSecondaryLightSeed,
  tertiary: LucyColors.colorSchemeTertiaryLightSeed,
  error: LucyColors.error,
  // ...
);
```

Les teintes **doivent rester harmonisées** si l’une change (ajuster les trois + revue contraste WCAG sur boutons).

### 4.3 Lien widgets ↔ `ColorScheme`

| Widget shared | Couleur source |
|---------------|----------------|
| `LucyPrimaryButton` | `primary` + `primaryGradient` (primary → secondary) |
| `LucySecondaryButton` | `colorScheme.secondary` (bordure / texte) |
| `LucyTertiaryButton` | `colorScheme.tertiary` ou `primary` pour liens (comme design « Log In ») |
| Champs / labels | `tertiary` / `onSurface` / `lucyInputBg` via `LucyTextFieldTheme` |

**Interdit :** mélanger `lucyPrimary` en dur sur un bouton secondaire et `secondary` sur le primaire — chaque variant utilise **son** rôle ColorScheme.

### 4.4 Règles d’usage (rappel)

- **100 % des couleurs UI** → `Theme.of(context).colorScheme` (éventuellement via `LucyTextFieldTheme` / `LucyButtonTheme` déjà branchés sur le scheme).
- **Aucune exception** dans features/shared pour « juste cette fois » un hex du design Figma.
- `MaterialApp` : `theme: LucyFlexTheme.lightTheme` — le `ColorScheme` en est la **seule** source de vérité runtime pour l’UI.
- Extension recommandée : `context.colorScheme` dans `lib/core/extensions/context.dart` (comme AfroSchool).

Références : `af_flex_theme.dart` (l.90–94), `af_colors.dart` (seeds secondary/tertiary), `af_button_theme.dart`.

---

## 5. Shared widgets — pattern AfroSchool

Référence : `afroschool_admin_web/lib/shared/widgets/` + skill `flutter/shared/widgets/buttons`.

### 5.1 Arborescence

```
lib/shared/widgets/
├── buttons/
│   ├── lucy_primary_button.dart
│   ├── lucy_secondary_button.dart
│   └── lucy_tertiary_button.dart
├── inputs/
│   ├── lucy_text_field_web.dart
│   └── lucy_text_field_mobile.dart
└── branding/
    └── lucy_logo.dart                 # SVG / widget (design lucy-logo.tsx)
```

### 5.2 Contrat widgets (comme AF)

| Widget | Base Material | Comportement |
|--------|---------------|--------------|
| `LucyPrimaryButton` | `ElevatedButton` | `colorScheme.primary` + gradient primary→secondary |
| `LucySecondaryButton` | `OutlinedButton` | `colorScheme.secondary` (bordure + texte) |
| `LucyTertiaryButton` | `TextButton` | `colorScheme.tertiary` ou `primary` pour liens (design) |
| `LucyTextFieldWeb` / `LucyTextFieldMobile` | `TextFormField` | label, erreur, obscureText — styles depuis `LucyTextFieldTheme` |
| `LucyLogo` | — | variantes `icon` / `full`, tailles `sm`–`xl` (design) |

### 5.3 Layouts auth (feature)

```
features/auth/presentation/widgets/
├── auth_scaffold.dart
├── auth_web_layout.dart
└── auth_mobile_layout.dart
```

Les **pages** n’assemblent que des widgets **shared** + l10n — pas de `TextField`/`ElevatedButton` bruts stylés à la main.

Références : `af_primary_button.dart`, `af_text_field_web.dart`, `auth_web_layout.dart`.

---

## 6. Structure du projet

```
lib/
├── main.dart                      # Firebase.initializeApp + ProviderScope
├── firebase_options.dart          # généré FlutterFire
├── app.dart
├── core/
│   ├── firebase/                  # firebase_app.dart (init)
│   ├── constants/
│   ├── extensions/                # context.l10n, responsive
│   ├── localization/l10n/         # fr, en, de
│   ├── router/
│   ├── theme/                     # LucyFlexTheme, LucyColors, *Theme
│   └── utils/                     # validators, auth_error_translator (Firebase codes)
├── features/
│   └── auth/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── firebase_auth_datasource.dart
│       │   ├── dtos/              # si nécessaire (Firestore, API)
│       │   ├── mappers/
│       │   │   └── auth_user_mapper.dart
│       │   └── repositories/
│       │       └── auth_repository_impl.dart
│       ├── domain/
│       │   ├── entities/          # AuthUser — minimal, sans SDK
│       │   ├── repositories/
│       │   │   └── auth_repository.dart
│       │   └── providers/
│       ├── services/
│       │   └── auth_service.dart
│       └── presentation/
│           ├── controllers/
│           ├── pages/               # login, sign_up, reset_password, home (placeholder)
│           ├── states/
│           └── widgets/
└── shared/
    └── widgets/                   # buttons/, inputs/, branding/lucy_logo
```

**Note :** pas de `core/network/dio` obligatoire en phase 1 auth. Ajout phase 2 pour API IA.

### 6.1 Routes

| Path | Auth | Rôle |
|------|------|------|
| `/` | public | Splash — attend 1er `authStateChanges` (Q14) |
| `/login` | public | Login email/password |
| `/signup` | public | Inscription |
| `/reset-password` | public | Reset email |
| `/home` | privé | `currentUser != null` |

**Redirect :** utilisateur connecté qui ouvre `/login` ou `/signup` → `/home`.

### 6.2 Contrat `AuthRepository` (domaine)

```dart
Future<AuthUser> signInWithEmailAndPassword({required String email, required String password});
Future<AuthUser> signUpWithEmailAndPassword({required String email, required String password, required String fullName});
Future<void> sendPasswordResetEmail({required String email});
Future<void> signOut();
Stream<AuthUser?> authStateChanges();
AuthUser? get currentUser;
```

---

## 7. Commandes

```bash
cd frontend
dart pub global activate flutterfire_cli
flutterfire configure
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run -d chrome
flutter run   # mobile
```

### 7.1 Dépendances `pubspec.yaml` (phase 1 auth)

**Runtime**

- `firebase_core`
- `firebase_auth`
- `flutter_riverpod`, `riverpod_annotation`
- `freezed`, `freezed_annotation`
- `go_router`
- `flutter_localizations`, `intl`
- `flutter_svg`
- `flex_color_scheme` *(thème — même lib que AfroSchool)*
- `cloud_firestore` *(profil `users/{uid}` obligatoire)*

**Dev**

- `build_runner`, `riverpod_generator`, `flutter_lints`

**Phase 1 — non requis pour auth**

- `dio` (phase API IA)

---

## 8. Style de code & conventions

| Règle | Lucy |
|--------|------|
| Clean Architecture | Firebase uniquement dans `data/datasources` + `repository_impl` |
| l10n | fr / en / de ; pas de texte UI en dur |
| Erreurs | `FirebaseAuthException.code` → translator → l10n |
| Pas de valeurs en dur | routes, assets centralisés ; **couleurs UI = `colorScheme` only** (hex → `lucy_colors.dart`) |
| Doc code | anglais (`///`) |

---

## 9. Stratégie de tests

| Niveau | Cible |
|--------|--------|
| Unit | `AuthService` avec `MockAuthRepository` |
| Unit | `auth_error_translator` pour chaque code Firebase courant |
| Widget | validation formulaires, états loading |
| Integration | mock repository → navigation `/home` |

Tests contre **Firebase Emulator** (optionnel) : `firebase_auth` emulator + comptes de test.

---

## 10. Limites (boundaries)

### Toujours

- Encapsuler Firebase dans la couche data.
- Traduire toutes les erreurs auth.
- Layouts web + mobile sur les pages auth.

### Demander avant

- Ajout Cloud Functions, règles Firestore complexes, Messaging.
- Suppression de fichiers, changement bundle ID.
- Second projet Firebase (prod).

### Ne jamais

- `FirebaseAuth` / `User` Firebase dans domain, service ou presentation.
- **Toute** couleur en dur hors `lib/core/theme/lucy_colors.dart`.
- `LucyColors.*` ou `Color(0x…)` dans `features/`, `shared/`, `app.dart`.
- Ignorer `Theme.of(context).colorScheme` au profit d’une constante « design ».
- Afficher `e.message` Firebase brut.
- Inventer des endpoints REST pour remplacer Firebase en phase 1.

---

## 11. Plan d’implémentation

1. **Firebase** : `flutterfire configure`, `firebase_options.dart`, init dans `main.dart`.
2. **Core** : `LucyFlexTheme` + `flex_color_scheme`, l10n fr/en/de, router + guard, translator.
3. **Shared** : boutons, champs, logo (pattern AfroSchool).
4. **Auth data/domain** : datasource + **mapper** + entity + repository + service.
5. **UI** : login, signup, reset, layouts web/mobile (widgets shared + thème uniquement).
5. **Home** placeholder + tests.
---

## 12. Références

| Rôle | Chemin |
|------|--------|
| Layouts auth AfroSchool | `afroschool_admin_web/lib/features/auth/presentation/widgets/` |
| l10n 3 langues AfroSchool | `afroschool_admin_web/lib/core/localization/l10n/app_{fr,en,de}.arb` |
| Design | `Design Authentication Flow Screens/src/app/components/` |

---

*Ce document a été créé avec Cursor (IA). Dernière mise à jour : revue adversariale + décisions PO (Q11–Q15, OAuth supprimé du frontend).*
