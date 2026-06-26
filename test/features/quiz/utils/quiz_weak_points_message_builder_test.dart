import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_item.dart';
import 'package:lucy_frontend/features/quiz/utils/quiz_weak_points_message_builder.dart';

void main() {
  Future<AppLocalizations> loadFrL10n(WidgetTester tester) async {
    late AppLocalizations l10n;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('fr'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            l10n = AppLocalizations.of(context)!;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    return l10n;
  }

  testWidgets('builds flashcards request from incorrect items', (tester) async {
    final l10n = await loadFrL10n(tester);

    final message = buildQuizWeakPointsFlashcardsMessage(
      l10n: l10n,
      incorrectItems: const [
        LearningSessionItem(
          id: 'item-1',
          question: "Qu'est-ce que l'entropie ?",
          sources: [],
        ),
        LearningSessionItem(
          id: 'item-2',
          question: "Définir l'enthalpie",
          sources: [],
        ),
      ],
    );

    expect(message, contains("Qu'est-ce que l'entropie ?"));
    expect(message, contains("Définir l'enthalpie"));
    expect(message.toLowerCase(), contains('cartes'));
  });

  testWidgets('returns empty string when there are no incorrect items', (
    tester,
  ) async {
    final l10n = await loadFrL10n(tester);

    final message = buildQuizWeakPointsFlashcardsMessage(
      l10n: l10n,
      incorrectItems: const [],
    );

    expect(message, isEmpty);
  });
}
