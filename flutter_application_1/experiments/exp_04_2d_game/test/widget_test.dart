import 'package:exp_04_2d_game/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders 2D gesture game', (tester) async {
    await tester.pumpWidget(const GameApp());

    expect(find.byType(GameApp), findsOneWidget);
  });
}
