import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations_fr.dart';
import 'package:lucy_frontend/features/chat/presentation/utils/chat_quick_chips_resolver.dart';

void main() {
  final l10n = AppLocalizationsFr();

  group('resolveChatQuickChips (LEARN-11a)', () {
    test('returns default learning actions when there is no assistant context', () {
      final chips = resolveChatQuickChips(l10n: l10n);

      expect(
        chips.map((chip) => chip.message),
        containsAll([
          l10n.chatSuggestionQuiz,
          l10n.chatSuggestionFlashcards,
          l10n.chatSuggestionRevisionPlan,
        ]),
      );
    });

    test('returns yes and cancel during type confirmation', () {
      final chips = resolveChatQuickChips(
        l10n: l10n,
        lastAssistantMessageContent:
            'Tu veux un **quiz** sur tes documents actifs — c’est bien ça ?',
      );

      expect(chips.map((c) => c.message), [l10n.chatQuickChipYesMessage, l10n.chatQuickChipCancelMessage]);
    });

    test('returns focus shortcuts during part selection', () {
      final chips = resolveChatQuickChips(
        l10n: l10n,
        lastAssistantMessageContent:
            'Quelles parties veux-tu travailler ? Réponds avec des numéros',
      );

      expect(
        chips.map((c) => c.message),
        [l10n.chatQuickChipAllMessage, l10n.chatQuickChipMostImportantMessage],
      );
    });

    test('returns as-you-like during count step', () {
      final chips = resolveChatQuickChips(
        l10n: l10n,
        lastAssistantMessageContent:
            'Combien de **questions** veux-tu ? (1–15, ou « comme tu veux » pour 5.)',
      );

      expect(chips.single.message, l10n.chatQuickChipAsYouLikeMessage);
    });

    test('returns yes and cancel on launch recap', () {
      final chips = resolveChatQuickChips(
        l10n: l10n,
        lastAssistantMessageContent:
            '**Récap** : 5 questions · sections 1 et 2 — je lance ?',
      );

      expect(chips.map((c) => c.message), [l10n.chatQuickChipYesMessage, l10n.chatQuickChipCancelMessage]);
    });
  });
}
