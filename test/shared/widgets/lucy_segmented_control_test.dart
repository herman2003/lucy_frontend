import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/lucy/lucy_segmented_control.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('invokes onSelected when tapping a segment', (tester) async {
    int? selected;
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: Scaffold(
          body: LucySegmentedControl(
            labels: const ['Clair', 'Sombre'],
            selectedIndex: 0,
            onSelected: (index) => selected = index,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sombre'));
    await tester.pumpAndSettle();

    expect(selected, 1);
  });
}
