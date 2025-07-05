import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipe_book/app.dart'; // ✅ correct import for RecipeBookApp

void main() {
  testWidgets('App builds without error', (WidgetTester tester) async {
    // Build the RecipeBookApp widget
    await tester.pumpWidget(const RecipeBookApp());

    // Verify something simple, like the presence of a widget on the home screen
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
