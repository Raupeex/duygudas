import 'package:flutter/material.dart';

import 'autogenetic.dart';
import 'breathing_exercises.dart';
import 'edit_profile.dart';
import 'exercises.dart';
import 'forgotten_password.dart';
import 'four_four_four_breath.dart';
import 'login_page.dart';
import 'login_register.dart';
import 'main_page.dart';
import 'personal_information.dart';
import 'professional_support.dart';
import 'register_page.dart';
import 'relaxation_exercises.dart';
import 'splash_screen.dart';
import 'test_phq9.dart';
import 'test_results.dart';
import 'tests.dart';

void main() {
  runApp(MyApp());
}

List<String> testResults = [];

// Global variables to hold user information
String userName = "";
String userSurname = "";
String userNickname = "";
String userPhone = "";
String userEmail = "";
String userDiagnosis = "";
String userMedications = "";
String userAvatar = 'assets/images/fox.png'; //

// Avatar options
List<String> avatarPaths = [
  'assets/images/bear.png',
  'assets/images/cat.png',
  'assets/images/chicken.png',
  'assets/images/dog.png',
  'assets/images/fox.png',
  'assets/images/meerkat.png',
  'assets/images/panda.png',
];

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
        '/tests': (context) => TestsPage(),
        '/exercises': (context) => ExercisesPage(),
        '/breathing_exercises': (context) => BreathingExercisesPage(),
        '/relaxation_exercises': (context) => RelaxationExercisesPage(),
        '/professional_support': (context) => ProfessionalSupportPage(),
        '/test_results': (context) => TestResultsPage(),
        '/four_four_four_breath': (context) => FourFourFourBreathPage(),
        '/autogenetic': (context) => AutogeneticPage(),
        '/test_phq9': (context) => TestPHQ9Page(),
        '/personal_information': (context) => PersonalInformationPage(),
        '/edit_profile': (context) => EditProfilePage(),
        '/forgotten_password': (context) => ForgottenPasswordPage(),
      },
    );
  }
}
