# Firebase & OAuth setup — Lucy (`com.lucy.app`)

Project Firebase: **`lucy-7504c`**

This document tracks platform OAuth configuration. Repo-side steps are done where possible; console steps still require the Firebase / Apple / Google portals.

---

## Already configured in the repository

| Item | Status |
|------|--------|
| iOS Google URL scheme (`REVERSED_CLIENT_ID`) | `ios/Runner/Info.plist` |
| macOS Google URL scheme | `macos/Runner/Info.plist` |
| Sign in with Apple entitlements (iOS) | `ios/Runner/Runner.entitlements` + Xcode capability |
| Sign in with Apple entitlements (macOS) | `macos/Runner/DebugProfile.entitlements`, `Release.entitlements` |
| Android debug SHA-1 in Firebase | Registered via CLI (see below) |
| Web branding | `web/index.html`, `web/manifest.json` (Lucy theme `#1e3d6f`) |
| Supported platforms in app | **Web, Android, iOS, macOS** — Windows/Linux intentionally excluded |

---

## Android — SHA certificate fingerprints

**App ID:** `1:915801010147:android:866498945967265a8a3ad6`  
**Package:** `com.lucy.app`

### Debug (registered in Firebase)

```
SHA-1: 78:9F:4A:DF:40:65:7C:15:CB:00:07:D9:43:59:DA:02:A0:C0:BF:C4
```

Registered with:

```bash
firebase apps:android:sha:create \
  "1:915801010147:android:866498945967265a8a3ad6" \
  "78:9F:4A:DF:40:65:7C:15:CB:00:07:D9:43:59:DA:02:A0:C0:BF:C4" \
  --project lucy-7504c
```

### Release (when you have a release keystore)

```bash
cd android && ./gradlew :app:signingReport
# Copy SHA-1 from Variant: release (after configuring signingConfigs.release)
firebase apps:android:sha:create "1:915801010147:android:866498945967265a8a3ad6" "<RELEASE_SHA1>" --project lucy-7504c
```

Console: [Firebase → Project settings → Your apps → Android `com.lucy.app` → SHA certificate fingerprints](https://console.firebase.google.com/project/lucy-7504c/settings/general)

---

## iOS — Google Sign-In

- **Bundle ID:** `com.lucy.app`
- **REVERSED_CLIENT_ID:** `com.googleusercontent.apps.915801010147-t19l9e4ukna7f179h2oajk5qv5nkbo6g`
- Configured in `ios/Runner/Info.plist` → `CFBundleURLTypes`

---

## iOS / macOS — Sign in with Apple

### In the repo

- Entitlement: `com.apple.developer.applesignin` = `Default`
- Xcode: Sign in with Apple capability enabled on Runner target

### In Apple Developer (required — manual)

1. [Identifiers](https://developer.apple.com/account/resources/identifiers/list) → App ID `com.lucy.app` → enable **Sign In with Apple**
2. Regenerate provisioning profiles if needed

### In Firebase Console (required — manual)

1. [Authentication → Sign-in method → Apple](https://console.firebase.google.com/project/lucy-7504c/authentication/providers) → Enable
2. Upload **Services ID**, **Team ID**, **Key (.p8)** as per [Firebase Apple auth docs](https://firebase.google.com/docs/auth/ios/apple)

---

## Web — Firebase Auth authorized domains

In [Authentication → Settings → Authorized domains](https://console.firebase.google.com/project/lucy-7504c/authentication/settings):

Ensure these are listed:

| Domain | Purpose |
|--------|---------|
| `localhost` | `flutter run -d chrome` local dev |
| `lucy-7504c.firebaseapp.com` | Firebase Hosting default (if used) |
| `lucy-7504c.web.app` | Firebase Hosting alternate |
| *(your production domain)* | e.g. `app.lucy.example` when deployed |

Add production domain before shipping web to prod.

### Google Sign-In on Web

Uses Firebase Auth web SDK — ensure **Google** provider is enabled and OAuth consent screen is configured in Google Cloud (linked to `lucy-7504c`).

---

## Authentication providers checklist (Firebase Console)

- [ ] Email / Password
- [ ] Google
- [ ] Apple (with Apple Developer keys)

[Open providers](https://console.firebase.google.com/project/lucy-7504c/authentication/providers)

---

## Password reset email

[Authentication → Templates](https://console.firebase.google.com/project/lucy-7504c/authentication/emails): customize reset email; set action URL to your web app or Firebase default page.

---

## Windows & Linux

Not targeted for phase 1. `DefaultFirebaseOptions.currentPlatform` throws on Windows/Linux until you run:

```bash
flutterfire configure --platforms=windows,linux
```

---

*Ce document a été créé avec Cursor (IA).*
