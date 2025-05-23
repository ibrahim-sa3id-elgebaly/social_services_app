// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_serveces_app/main.dart';
import 'package:social_serveces_app/ui/splash_screens/first_screen.dart';
import 'package:social_serveces_app/ui/authentications_screen/login/login_screen.dart';

void main() {
  testWidgets('App launches and shows splash screen', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const MyApp(
      initialRoute: FirstScreen.routeName,
    ));

    // Verify that the initial splash screen is shown
    expect(find.byType(FirstScreen), findsOneWidget);
  });

  testWidgets('Login screen contains all required elements', (WidgetTester tester) async {
    // Directly test the LoginScreen widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    ));

    // Verify all critical widgets exist
    expect(find.text('Login'), findsOneWidget); // AppBar title
    expect(find.byType(TextFormField), findsNWidgets(2)); // Email and password fields
    expect(find.text('Forgotten password?'), findsOneWidget);
    expect(find.text('Or create new account'), findsOneWidget);
  });
}
