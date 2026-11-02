import 'package:exp_10_bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('calculates BMI from height and weight', (tester) async {
    await tester.pumpWidget(const BmiApp());

    await tester.enterText(find.byType(TextFormField).at(0), '68');
    await tester.enterText(find.byType(TextFormField).at(1), '170');
    await tester.tap(find.text('Calculate BMI'));
    await tester.pump();

    expect(find.text('23.5'), findsOneWidget);
    expect(find.text('Within the usual range'), findsOneWidget);
  });
}
