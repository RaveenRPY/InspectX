import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspectx/inspectx.dart';

void main() {
  testWidgets('InspectX displays class name', (WidgetTester tester) async {
    // Build a MaterialApp with InspectX widget as the home
    await tester.pumpWidget(MaterialApp(
      home: InspectX(
        child: Container(),
      ),
    ));

    // Verify that the class name is displayed
    expect(find.text('InspectX'), findsOneWidget);
  });
}
