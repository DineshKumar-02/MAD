import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('renders MAD Lab Master Dashboard', (tester) async {
    await tester.pumpWidget(const MadLabMasterApp());

    expect(find.text('MAD LAB (23IT703)'), findsOneWidget);
  });
}
