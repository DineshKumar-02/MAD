import 'package:exp_07_shopping_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('adds a product to the shopping cart', (tester) async {
    await tester.pumpWidget(const ShopApp());

    expect(find.text('Simple Shop'), findsOneWidget);
    await tester.tap(find.byTooltip('Add Canvas Backpack'));
    await tester.pump();

    expect(find.text('Checkout · 1 items · \$39.99'), findsOneWidget);
  });
}
