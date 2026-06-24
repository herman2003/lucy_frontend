import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:lucy_frontend/features/chat/domain/entities/chat_learning_session_created.dart';
import 'package:lucy_frontend/features/chat/presentation/widgets/chat_learning_session_card.dart';

void main() {
  testWidgets('opens quiz session route when tapping Ouvrir', (tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ChatLearningSessionCard(
            session: ChatLearningSessionCreated(
              sessionId: 'learn_test_1',
              type: 'quiz',
              title: 'Quiz · test',
            ),
          ),
        ),
        GoRoute(
          path: LucyRoutePaths.quizSession(':sessionId'),
          builder: (context, state) =>
              Text('session:${state.pathParameters['sessionId']}'),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Commencer le quiz'));
    await tester.pumpAndSettle();

    expect(find.text('session:learn_test_1'), findsOneWidget);
  });

  testWidgets('shows flashcards card title for flashcards session', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: const ChatLearningSessionCard(
          session: ChatLearningSessionCreated(
            sessionId: 'learn_flash_1',
            type: 'flashcards',
            title: 'Cartes · test',
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Cartes prêtes'), findsOneWidget);
    expect(find.text('Cartes · test'), findsOneWidget);
  });
}
