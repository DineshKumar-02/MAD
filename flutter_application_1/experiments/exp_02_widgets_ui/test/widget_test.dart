import 'package:exp_02_widgets_ui/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the interactive widgets gallery', (tester) async {
    await tester.pumpWidget(const WidgetsApp());

    expect(find.text('Widgets & UI'), findsOneWidget);
    expect(find.text('Your name'), findsOneWidget);
    expect(find.text('Show snackbar'), findsOneWidget);
  });
}
