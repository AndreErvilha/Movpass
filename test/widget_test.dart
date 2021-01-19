// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movpass/main.dart';

void main() {
  testWidgets('Verify alert message on press fab', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify the alertDialog is not on screen
    expect(find.text('Mensagem de alerta'), findsNothing);

    // Tap the 'message' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.message));
    await tester.pump();

    // Verify if alertDialog is showed with a text 'Mensagem de alerta'
    expect(find.text('Mensagem de alerta'), findsOneWidget);
  });
}
