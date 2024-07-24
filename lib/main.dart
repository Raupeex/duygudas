import 'package:flutter/material.dart';

import 'autogenetic.dart';
import 'breathing_exercises.dart';
import 'exercises.dart';
import 'four_four_four_breath.dart';
import 'login_page.dart';
import 'login_register.dart';
import 'main_page.dart';
import 'professional_support.dart';
import 'profile_edit.dart';
import 'register_page.dart';
import 'relaxation_exercises.dart';
import 'settings_page.dart';
import 'splash_screen.dart';
import 'test_results.dart';
import 'tests.dart';

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
        '/main_page': (context) => MainPage(),
        '/settings': (context) => SettingsPage(),
        '/tests': (context) => TestsPage(),
        '/exercises': (context) => ExercisesPage(),
        '/breathing_exercises': (context) => BreathingExercisesPage(),
        '/relaxation_exercises': (context) => RelaxationExercisesPage(),
        '/professional_support': (context) => ProfessionalSupportPage(),
        '/profile_edit': (context) => ProfileEditPage(),
        '/test_results': (context) => TestResultsPage(),
        '/four_four_four_breath': (context) => FourFourFourBreathPage(),
        '/autogenetic': (context) => AutogeneticPage(),
      },
    );
  }
}
