import 'package:exp_08_push_notifications/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('simulates a push message in the inbox', (tester) async {
    await tester.pumpWidget(const PushDemoApp());

    expect(find.text('Push Notifications'), findsOneWidget);
    await tester.tap(find.text('Simulate push'));
    await tester.pump();

    expect(find.text('Sample push message'), findsOneWidget);
  });
}
