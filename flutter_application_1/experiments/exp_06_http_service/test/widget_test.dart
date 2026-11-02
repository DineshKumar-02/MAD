import 'package:exp_06_http_service/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the HTTP service demo', (tester) async {
    await tester.pumpWidget(const HttpDemoApp());

    expect(find.text('HTTP Web Service'), findsOneWidget);
    expect(find.text('Fetch sample post'), findsOneWidget);
  });
}
