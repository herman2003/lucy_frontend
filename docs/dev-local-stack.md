# Stack dev local — onboarding sans Gemini ni Firebase Admin

Pour développer sans **P1** (`GEMINI_API_KEY`) ni **P2** (compte de service), utilisez le stack documenté dans `Lucy/backend/`.

## Backend

```bash
cd ../backend
cp .env.example .env   # LLM_PROVIDER=mock, FIREBASE_AUTH_MODE=dev, FIRESTORE_PROVIDER=memory
npm install
npm run start:dev:local
curl http://localhost:3001/health
```

Réponse attendue : `"localStackReady": true` dans `dev`.

Auth API : `Authorization: Bearer dev:local-user-1`

## Flutter web

```bash
cd frontend
flutter run -d chrome
# API par défaut : http://localhost:3001 (voir ApiEndpoints)
```

L’app utilise Firebase Auth côté client (signup réel). Pour tester **uniquement** l’API Nest en local, utilisez les tests automatisés (`flutter test`) ou branchez Dio avec un token `dev:<uid>` aligné sur votre uid de test.

## Vérification automatisée

| Couche | Commande |
|--------|----------|
| Backend | `cd backend && npm test` |
| Flutter | `flutter test` / `flutter analyze` |

Parcours E2E widget : `test/features/onboarding/presentation/onboarding_cp4_e2e_flow_test.dart`

---

*Ce document a été créé avec Cursor (IA).*
