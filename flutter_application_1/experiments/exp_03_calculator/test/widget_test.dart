import 'package:exp_03_calculator/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('calculates a sum', (tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.tap(find.text('7'));
    await tester.tap(find.text('+'));
    await tester.tap(find.text('5'));
    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('12'), findsOneWidget);
  });
}
