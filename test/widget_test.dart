import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment28/main.dart';
import 'package:assignment28/services/storage_service.dart';

void main() {
  testWidgets('Expense Tracker smoke test', (WidgetTester tester) async {
    // Initialize SharedPreferences with empty values for testing
    SharedPreferences.setMockInitialValues({});
    
    final prefs = await SharedPreferences.getInstance();
    final storageService = StorageService(prefs);

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(storageService: storageService));

    // Verify that our app starts with the correct title.
    expect(find.text('Expense Tracker'), findsOneWidget);
    
    // Total expenses should start at ₹0.00
    expect(find.text('₹0.00'), findsOneWidget);
    
    // Empty state message should be visible
    expect(find.text('No expenses added yet'), findsOneWidget);

    // Tap the '+' icon to navigate to add expense screen
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that we are on the Add Expense screen
    expect(find.text('Add Expense'), findsOneWidget);
  });
}
