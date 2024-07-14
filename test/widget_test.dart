import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:route_task/app/app.dart';
import 'package:route_task/app/constants.dart';
import 'package:route_task/app/extentions.dart';

void main() {
  // Set up GetIt and register dependencies before tests start
  setUpAll(() {
    GetIt.instance.allowReassignment = true; // Allow reassignment for tests
    // Add any additional setup for your dependencies here
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build your app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  group('Extensions Tests', () {
    test('String orEmpty() returns empty string for null', () {
      String? nullString;
      expect(nullString.orEmpty(), Constants.empty);
    });

    test('String orEmpty() returns original string for non-null', () {
      String? nonNullString = 'Hello';
      expect(nonNullString.orEmpty(), 'Hello');
    });

    test('int orZeroForInt() returns zero for null', () {
      int? nullInt;
      expect(nullInt.orZeroForInt(), Constants.zero);
    });

    test('int orZeroForInt() returns original value for non-null', () {
      int? nonNullInt = 5;
      expect(nonNullInt.orZeroForInt(), 5);
    });

    test('bool orFalse() returns false for null', () {
      bool? nullBool;
      expect(nullBool.orFalse(), Constants.falseBool);
    });

    test('bool orFalse() returns original value for non-null', () {
      bool? nonNullBool = true;
      expect(nonNullBool.orFalse(), true);
    });

    test('double orZeroForDouble() returns zero for null', () {
      double? nullDouble;
      expect(nullDouble.orZeroForDouble(), Constants.zeroForD);
    });

    test('double orZeroForDouble() returns original value for non-null', () {
      double? nonNullDouble = 3.14;
      expect(nonNullDouble.orZeroForDouble(), 3.14);
    });
  });
}
