import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/quiz/utils/learning_session_date_formatter.dart';

void main() {
  test('returns today and yesterday labels from l10n', () {
    final l10n = lookupAppLocalizations(const Locale('fr'));
    final reference = DateTime(2026, 5, 29, 12);

    expect(
      formatLearningSessionListDate(
        l10n: l10n,
        locale: const Locale('fr'),
        isoTimestamp: '2026-05-29T08:00:00.000Z',
        reference: reference,
      ),
      'Aujourd\'hui',
    );
    expect(
      formatLearningSessionListDate(
        l10n: l10n,
        locale: const Locale('fr'),
        isoTimestamp: '2026-05-28T08:00:00.000Z',
        reference: reference,
      ),
      'Hier',
    );
  });
}
