import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document_status.dart';
import 'package:lucy_frontend/features/documents/domain/providers/documents_provider.dart';
import 'package:lucy_frontend/features/documents/presentation/pages/documents_page.dart';
import 'package:lucy_frontend/features/documents/services/documents_service.dart';
import 'package:lucy_frontend/shared/widgets/feedback/lucy_snackbar.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_document_card.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_documents_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  tearDown(LucySnackBar.hideAll);

  Future<void> pumpDocumentsPage(
    WidgetTester tester, {
    required FakeDocumentsRepository repository,
  }) async {
    setTestLocaleFr();
    addTearDown(clearTestLocaleOverride);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          documentsRepositoryProvider.overrideWithValue(repository),
          documentsServiceProvider.overrideWith(
            (ref) => DocumentsService(repository: repository),
          ),
        ],
        child: MaterialApp(
          theme: LucyFlexTheme.lightTheme,
          locale: const Locale('fr'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const DocumentsPage(),
        ),
      ),
    );
    await tester.pump();
    await tester.pumpAndSettle();
  }

  testWidgets('shows empty state and add button when there are no documents', (
    tester,
  ) async {
    await pumpDocumentsPage(tester, repository: FakeDocumentsRepository());

    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Aucun document'), findsOneWidget);
    expect(find.text('Ajouter'), findsWidgets);
    expect(find.byType(FloatingActionButton), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('lists document titles when repository returns items', (
    tester,
  ) async {
    const readyDoc = Document(
      id: 'doc-1',
      title: 'Cours de maths',
      fileName: 'maths.pdf',
      mimeType: 'application/pdf',
      byteSize: 1024,
      status: DocumentStatus.ready,
      searchEnabled: false,
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
    );

    await pumpDocumentsPage(
      tester,
      repository: FakeDocumentsRepository(initialDocuments: [readyDoc]),
    );

    expect(find.text('Cours de maths'), findsOneWidget);
    expect(find.text('1 document'), findsOneWidget);
    expect(find.textContaining('Prêt'), findsOneWidget);
    expect(find.byType(LucyDocumentCard), findsOneWidget);
  });

  testWidgets('tapping add button opens upload sheet', (tester) async {
    await pumpDocumentsPage(tester, repository: FakeDocumentsRepository());

    await tester.tap(find.widgetWithText(FilledButton, 'Ajouter'));
    await tester.pumpAndSettle();

    expect(find.text('Ajouter un document'), findsOneWidget);
    expect(find.text('Téléverser'), findsOneWidget);
  });
}
