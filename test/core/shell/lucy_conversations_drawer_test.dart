import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/constants/lucy_spacing.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/shell/lucy_chat_threads_panel.dart';
import 'package:lucy_frontend/core/shell/lucy_conversations_drawer.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  const threads = [
    LucyChatThreadItem(id: 't-1', title: 'Maths', preview: 'Dérivées'),
  ];

  Widget wrap({
    required bool isOpen,
    required VoidCallback onClose,
    void Function(String id)? onThreadSelected,
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
        body: SizedBox(
          width: 400,
          height: 600,
          child: LucyConversationsDrawer(
            isOpen: isOpen,
            onClose: onClose,
            title: 'Conversations',
            newConversationLabel: 'Nouvelle conversation',
            emptyMessage: 'Vide',
            threads: threads,
            onThreadSelected: onThreadSelected ?? (_) {},
            onCreateThread: () {},
          ),
        ),
      ),
    );
  }

  testWidgets('hides content when closed', (tester) async {
    await tester.pumpWidget(wrap(isOpen: false, onClose: () {}));
    await tester.pumpAndSettle();

    expect(find.text('Maths'), findsNothing);
  });

  testWidgets('shows thread list at 80 percent width when open', (tester) async {
    await tester.pumpWidget(wrap(isOpen: true, onClose: () {}));
    await tester.pumpAndSettle();

    expect(find.text('Conversations'), findsOneWidget);
    expect(find.text('Maths'), findsOneWidget);

    final panelWidth = tester.getSize(find.text('Maths')).width;
    expect(
      panelWidth,
      lessThan(400 * LucySpacing.chatConversationsDrawerWidthFactor + 48),
    );
  });

  testWidgets('closes when tapping outside panel', (tester) async {
    var closed = false;
    await tester.pumpWidget(wrap(isOpen: true, onClose: () => closed = true));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(360, 300));
    await tester.pumpAndSettle();

    expect(closed, isTrue);
  });

  testWidgets('selects thread and closes drawer', (tester) async {
    String? selectedId;
    var closed = false;

    await tester.pumpWidget(
      wrap(
        isOpen: true,
        onClose: () => closed = true,
        onThreadSelected: (id) => selectedId = id,
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Maths'));
    await tester.pumpAndSettle();

    expect(selectedId, 't-1');
    expect(closed, isTrue);
  });
}
