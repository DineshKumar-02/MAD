import 'package:exp_11_object_detection/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows sample on-device detection output', (tester) async {
    await tester.pumpWidget(const DetectionDemoApp());

    expect(find.text('On-device Object Detection'), findsOneWidget);
    await tester.tap(find.text('Analyze sample frame'));
    await tester.pump();

    expect(find.text('Chair'), findsOneWidget);
    expect(find.text('94%'), findsOneWidget);
  });
}
