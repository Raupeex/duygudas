import 'package:flutter/material.dart';
import 'screens/login_register.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/mood.dart';
import 'screens/calendar_page.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
