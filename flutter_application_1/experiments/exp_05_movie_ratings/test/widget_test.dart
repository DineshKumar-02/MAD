import 'package:exp_05_movie_ratings/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('lists movies and lets a user rate one', (tester) async {
    await tester.pumpWidget(const MoviesApp());

    expect(find.text('Movie Ratings'), findsOneWidget);
    expect(find.text('Interstellar'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pump();
    expect(find.byIcon(Icons.star).first, findsOneWidget);
  });
}
