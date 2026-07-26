import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucy_frontend/core/theme/lucy_flex_theme.dart';
import 'package:lucy_frontend/shared/widgets/branding/lucy_avatar.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('LucyAvatar renders at requested size', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: const Scaffold(body: LucyAvatar(size: 48)),
      ),
    );
    await tester.pumpAndSettle();

    final box = tester.getSize(find.byType(LucyAvatar));
    expect(box.width, 48);
    expect(box.height, 48);
  });

  testWidgets('LucyAvatar shows gradient star by default', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: LucyFlexTheme.lightTheme,
        home: const Scaffold(body: LucyAvatar()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('✦'), findsOneWidget);
  });
}
