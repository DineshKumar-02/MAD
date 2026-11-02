import 'package:exp_09_google_maps/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows the map preview and locations', (tester) async {
    await tester.pumpWidget(const MapsDemoApp());

    expect(find.text('Google Maps Demo'), findsOneWidget);
    expect(find.text('City Library'), findsWidgets);
    expect(find.textContaining('requires a Maps API key'), findsOneWidget);
  });
}
