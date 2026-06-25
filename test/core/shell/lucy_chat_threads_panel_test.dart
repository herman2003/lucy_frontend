import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/constants/lucy_spacing.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/shell/lucy_chat_threads_panel.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  const threads = [
    LucyChatThreadItem(
      id: 'thread-1',
      title: 'Révision maths',
      preview: 'Explique les dérivées',
    ),
    LucyChatThreadItem(
      id: 'thread-2',
      title: 'Biologie',
    ),
  ];

  Widget wrap({
    required void Function(String threadId) onThreadSelected,
    required VoidCallback onCreateThread,
    String? selectedThreadId,
  }) {
    return MaterialApp(
      theme: LucyFlexTheme.lightTheme,
      locale: const Locale('fr'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: LucyChatThreadsPanel(
          title: 'Conversations',
          newConversationLabel: 'Nouvelle conversation',
          emptyMessage: 'Aucune conversation',
          threads: threads,
          selectedThreadId: selectedThreadId,
          canCreateThread: true,
          onThreadSelected: onThreadSelected,
          onCreateThread: onCreateThread,
        ),
      ),
    );
  }

  testWidgets('uses fixed 300px width and shows header', (tester) async {
    await tester.pumpWidget(
      wrap(onThreadSelected: (_) {}, onCreateThread: () {}),
    );
    await tester.pumpAndSettle();

    final size = tester.getSize(find.byType(LucyChatThreadsPanel));
    expect(size.width, LucySpacing.chatThreadsPanelWidth);
    expect(find.text('Conversations'), findsOneWidget);
    expect(find.text('Révision maths'), findsOneWidget);
  });

  testWidgets('invokes callbacks for thread selection and create', (tester) async {
    String? selectedId;
    var created = false;

    await tester.pumpWidget(
      wrap(
        onThreadSelected: (id) => selectedId = id,
        onCreateThread: () => created = true,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Biologie'));
    await tester.pump();

    expect(selectedId, 'thread-2');

    await tester.tap(find.byTooltip('Nouvelle conversation'));
    await tester.pump();

    expect(created, isTrue);
  });
}
