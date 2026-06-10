import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/quiz/presentation/widgets/quiz_library_empty_state.dart';

void main() {
  testWidgets('shows G12 empty hint without CTA button', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: QuizLibraryEmptyState()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Lucy'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
    expect(find.byType(FilledButton), findsNothing);
  });
}
