import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/shared/widgets/branding/lucy_avatar.dart';

void main() {
  testWidgets('LucyAvatar renders at requested size', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LucyAvatar(size: 48),
        ),
      ),
    );

    expect(find.byType(LucyAvatar), findsOneWidget);
    final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect(avatar.radius, 24);
  });

  testWidgets('LucyAvatar uses placeholder icon by default', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LucyAvatar(),
        ),
      ),
    );

    expect(find.byIcon(Icons.auto_awesome), findsOneWidget);
  });
}
