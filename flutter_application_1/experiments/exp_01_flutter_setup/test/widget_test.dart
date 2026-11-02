import 'package:exp_01_flutter_setup/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the Flutter and Kotlin setup checklist', (tester) async {
    await tester.pumpWidget(const SetupApp());

    expect(find.text('Experiment 1: Setup'), findsOneWidget);
    expect(find.text('Flutter + Kotlin'), findsOneWidget);
    expect(find.text('Android Studio'), findsOneWidget);
  });
}
