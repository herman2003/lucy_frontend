import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/router/lucy_route_paths.dart';
import 'package:lucy_frontend/core/signals/pending_chat_outbound_message_holder.dart';
import 'package:lucy_frontend/features/quiz/presentation/utils/quiz_library_generate_navigation.dart';

class _TriggerButton extends ConsumerWidget {
  const _TriggerButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => openQuizGenerationInChat(
        context: context,
        ref: ref,
        type: QuizLibraryGenerateType.quiz,
      ),
      child: const Text('trigger'),
    );
  }
}

void main() {
  testWidgets('openQuizGenerationInChat enqueues quiz message and navigates to chat', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: LucyRoutePaths.quiz,
                builder: (context, state) => const Scaffold(
                  body: _TriggerButton(),
                ),
              ),
              GoRoute(
                path: LucyRoutePaths.chat,
                builder: (context, state) => const Scaffold(
                  body: Text('chat'),
                ),
              ),
            ],
            initialLocation: LucyRoutePaths.quiz,
          ),
        ),
      ),
    );

    await tester.tap(find.text('trigger'));
    await tester.pumpAndSettle();

    expect(find.text('chat'), findsOneWidget);
    expect(
      ProviderScope.containerOf(
        tester.element(find.text('chat')),
      ).read(pendingChatOutboundMessageHolderProvider)?.message,
      'Propose-moi un quiz',
    );
  });
}
