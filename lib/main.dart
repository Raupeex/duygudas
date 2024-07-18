import 'package:flutter/material.dart';
import 'login_register.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'mood.dart';
import 'calendar_page.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login_register': (context) => LoginRegisterPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/mood': (context) => MoodSelectorPage(),
        '/calendar': (context) => CalendarPage(),
      },
    );
  }
}
