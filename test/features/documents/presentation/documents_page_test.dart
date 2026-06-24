import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document.dart';
import 'package:lucy_frontend/features/documents/domain/entities/document_status.dart';
import 'package:lucy_frontend/features/documents/domain/providers/documents_provider.dart';
import 'package:lucy_frontend/features/documents/presentation/pages/documents_page.dart';
import 'package:lucy_frontend/features/documents/services/documents_service.dart';
import 'package:lucy_frontend/shared/widgets/feedback/lucy_snackbar.dart';

import '../../../helpers/test_locales.dart';
import '../helpers/fake_documents_repository.dart';

void main() {
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

  testWidgets('shows empty state and add FAB when there are no documents', (
    tester,
  ) async {
    await pumpDocumentsPage(tester, repository: FakeDocumentsRepository());

    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Ajouter'), findsOneWidget);
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
    expect(find.textContaining('Prêt'), findsOneWidget);
  });

  testWidgets('tapping add FAB opens upload sheet', (tester) async {
    await pumpDocumentsPage(tester, repository: FakeDocumentsRepository());

    await tester.tap(find.text('Ajouter'));
    await tester.pumpAndSettle();

    expect(find.text('Ajouter un document'), findsOneWidget);
    expect(find.text('Téléverser'), findsOneWidget);
  });
}
